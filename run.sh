#!/usr/bin/env bash
set -eu

cliReleases=("19.03.15" "20.10.0" "20.10.12" "20.10.17" "20.10.23" "23.0.1" "23.0.3" "24.0.0-beta.1")
cliRefs=("pr-3419-a4b6fe1" "pr-3429-a09e61a" "pr-3635-84b86e2" "pr-3640-c59773f" "pr-3713-f1615fa" "pr-4114-f5d698a" "pr-4173-c25b8f8" "fix-perf-reg" "fix-racy-help")
composeCliRefs=("v1.0.31")
buildxRefs=("v0.10.4")

rm -rf ./fixtures*
mkdir ./fixtures ./fixtures-compose-cli ./fixtures-buildx
mkdir -p ./builds

os="linux"
if [ "$(uname -s)" = "Darwin" ]; then
  os="mac"
fi

arch="$(uname -m)"
case "$(uname -m)" in
	"amd64")
		arch="x86_64"
		;;
	"386")
		arch="i386"
		;;
	"arm64")
		arch="aarch64"
		;;
	"armv7")
		arch="armhf"
		;;
	"armv6")
		arch="armel"
		;;
	"ppc64le")
		arch="ppc64le"
		;;
	"s390x")
		arch="s390x"
		;;
esac

tmpdir=$(mktemp -d -t cli-bench-output.XXXXXXXXXX)
trap "rm -rf $tmpdir" EXIT

for release in "${cliReleases[@]}"; do
  if [ ! -f "./builds/docker-${release}-${os}-${arch}" ]; then
    cliURL="https://download.docker.com/${os}/static/test/${arch}/docker-${release}.tgz"
    if curl --head --silent --fail "${cliURL}" 1>/dev/null 2>&1; then
      (
        set -e
        out="$tmpdir/$(openssl rand -hex 20)"
        mkdir -p "$out"
        wget -qO- "${cliURL}" | tar xvz --strip 1 -C "$out"
        cp "$out/docker" "./builds/docker-${release}-${os}-${arch}"
      )
    else
      echo "$cliURL not found"
    fi
  fi
  if [ -f "./builds/docker-${release}-${os}-${arch}" ]; then
    cp "./builds/docker-${release}-${os}-${arch}" "./fixtures/docker-${release}"
  fi
done

for i in "${!cliRefs[@]}"; do
  ref="${cliRefs[$i]}"
  if [ ! -f "./builds/docker-dev-${i}-${ref}-${os}-${arch}" ]; then
    (
      set -e
      out="$tmpdir/$(openssl rand -hex 20)"
      mkdir -p "$out"
      docker buildx bake --set "*.platform=local" --set "*.output=$out" "https://github.com/crazy-max/docker-cli.git#${ref}"
      cp "$out"/docker-* "./builds/docker-dev-${i}-${ref}-${os}-${arch}"
    )
  fi
  cp "./builds/docker-dev-${i}-${ref}-${os}-${arch}" "./fixtures/docker-dev-${ref#v}"
done

for i in "${!composeCliRefs[@]}"; do
  ref="${composeCliRefs[$i]}"
  if [ ! -f "./builds/compose-cli-${i}-${ref}-${os}-${arch}" ]; then
    (
      set -e
      out="$tmpdir/$(openssl rand -hex 20)"
      mkdir -p "$out"
      docker buildx build --platform=local --target=cli --output="$out" "https://github.com/docker/compose-cli.git#${ref}"
      cp "$out/docker" "./builds/compose-cli-${i}-${ref}-${os}-${arch}"
    )
  fi
  cp "./builds/compose-cli-${i}-${ref}-${os}-${arch}" "./fixtures-compose-cli/compose-cli-${ref#v}"
done

for i in "${!buildxRefs[@]}"; do
  ref="${buildxRefs[$i]}"
  if [ ! -f "./builds/buildx-${i}-${ref}-${os}-${arch}" ]; then
    (
      set -e
      out="$tmpdir/$(openssl rand -hex 20)"
      mkdir -p "$out"
      docker buildx bake --set "*.platform=local" --set "*.output=$out" "https://github.com/docker/buildx.git#${ref}"
      cp "$out/buildx" "./builds/buildx-${i}-${ref}-${os}-${arch}"
    )
  fi
  cp "./builds/buildx-${i}-${ref}-${os}-${arch}" "./fixtures-buildx/buildx-${ref#v}"
done

# benchmark "docker --version"
cmdsCli=()
for binCli in ./fixtures/*; do
  filename=$(basename -- "$binCli")
  cmdsCli+=("-n=$filename" "$binCli --version")
done
hyperfine --warmup 2 --runs 5 --export-markdown "$tmpdir/bench-cli.md" "${cmdsCli[@]}"

# benchmark "buildx version"
cmdsBuildx=()
for binBuildx in ./fixtures-buildx/*; do
  filenameBuildx=$(basename -- "$binBuildx")
  cmdsBuildx+=("-n=${filenameBuildx}" "$binBuildx version")
done
hyperfine --warmup 2 --runs 5 --export-markdown "$tmpdir/bench-buildx.md" "${cmdsBuildx[@]}"

# benchmark "docker buildx version"
cmdsDockerBuildx=()
for binCli in ./fixtures/*; do
  filenameCli=$(basename -- "$binCli")
  for binBuildx in ./fixtures-buildx/*; do
    filenameBuildx=$(basename -- "$binBuildx")
    dockerConfig="${tmpdir}/.docker/${filenameBuildx}"
    cliPlugins="${tmpdir}/.docker/${filenameBuildx}/cli-plugins"
    mkdir -p "${cliPlugins}"
    cp "${binBuildx}" "${cliPlugins}/docker-buildx"
    cmdsDockerBuildx+=("-n=${filenameCli}-${filenameBuildx}" "DOCKER_CONFIG=$dockerConfig $binCli buildx version")
  done
done
hyperfine --warmup 2 --runs 5 --export-markdown "$tmpdir/bench-docker-buildx.md" "${cmdsDockerBuildx[@]}"

# benchmark "docker buildx version" (through compose-cli)
cmdsCCLIDockerBuildx=()
for binCli in ./fixtures/*; do
  filenameCli=$(basename -- "$binCli")
  for binCCLI in ./fixtures-compose-cli/*; do
    filenameCCLI=$(basename -- "$binCCLI")
    for binBuildx in ./fixtures-buildx/*; do
      filenameBuildx=$(basename -- "$binBuildx")
      dockerConfig="${tmpdir}/.docker/${filenameBuildx}"
      cliPlugins="${tmpdir}/.docker/${filenameBuildx}/cli-plugins"
      mkdir -p "${cliPlugins}"
      cp "${binBuildx}" "${cliPlugins}/docker-buildx"
      cmdsCCLIDockerBuildx+=("-n=${filenameCCLI}-${filenameCli}-${filenameBuildx}" "DOCKER_CONFIG=$dockerConfig DOCKER_COM_DOCKER_CLI=$binCli $binCCLI buildx version")
    done
  done
done
hyperfine --warmup 2 --runs 5 --export-markdown "$tmpdir/bench-ccli-docker-buildx.md" "${cmdsCCLIDockerBuildx[@]}"

cat > bench.md <<EOL
## \`docker --version\`

$(cat "$tmpdir"/bench-cli.md)

## \`buildx version\`

$(cat "$tmpdir"/bench-buildx.md)

## \`docker buildx version\`

$(cat "$tmpdir"/bench-docker-buildx.md)

## \`docker buildx version\` (through compose-cli)

$(cat "$tmpdir"/bench-ccli-docker-buildx.md)
EOL

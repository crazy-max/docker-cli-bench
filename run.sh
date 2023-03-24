#!/usr/bin/env bash
set -eu

cliReleases=("19.03.15" "20.10.0" "20.10.12" "20.10.17" "23.0.1")
cliRefs=("pr-3597-2b4ffb3" "pr-3429-a09e61a" "pr-3635-84b86e2" "pr-3640-c59773f" "pr-3713-f1615fa" "pr-4114-f5d698a")
composeCliRefs=("v1.0.31")
buildxRefs=("v0.7.0" "v0.8.2" "v0.9.1" "v0.10.4")

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
    cliURL="https://download.docker.com/${os}/static/stable/${arch}/docker-${release}.tgz"
    if curl --head --silent --fail "${cliURL}" 1>/dev/null 2>&1; then
      (
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
      out="$tmpdir/$(openssl rand -hex 20)"
      mkdir -p "$out"
      docker buildx bake --set "*.platform=local" --set "*.output=$out" "https://github.com/crazy-max/docker-cli.git#${ref}"
      cp "$out"/docker-* "./builds/docker-dev-${i}-${ref}-${os}-${arch}"
    )
  fi
  cp "./builds/docker-dev-${i}-${ref}-${os}-${arch}" "./fixtures/docker-dev-${ref#v}"
done

#for i in "${!composeCliRefs[@]}"; do
#  ref="${composeCliRefs[$i]}"
#  if [ ! -f "./builds/compose-cli-${i}-${ref}-${os}-${arch}" ]; then
#    (
#      out="$tmpdir/$(openssl rand -hex 20)"
#      mkdir -p "$out"
#      docker buildx build --platform=local --target=cli --output="$out" "https://github.com/docker/compose-cli.git#${ref}"
#      cp "$out/docker" "./builds/compose-cli-${i}-${ref}-${os}-${arch}"
#    )
#  fi
#  cp "./builds/compose-cli-${i}-${ref}-${os}-${arch}" "./fixtures-compose-cli/compose-cli-${ref#v}"
#done

for i in "${!buildxRefs[@]}"; do
  ref="${buildxRefs[$i]}"
  if [ ! -f "./builds/buildx-${i}-${ref}-${os}-${arch}" ]; then
    (
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
hyperfine --warmup 2 --runs 3 --export-markdown "$tmpdir/bench-cli.md" "${cmdsCli[@]}"

# benchmark "buildx version"
cmdsBuildx=()
for binBuildx in ./fixtures-buildx/*; do
  filenameBuildx=$(basename -- "$binBuildx")
  cmdsBuildx+=("-n=${filenameBuildx}" "$binBuildx version")
done
hyperfine --warmup 2 --runs 3 --export-markdown "$tmpdir/bench-buildx.md" "${cmdsBuildx[@]}"

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
hyperfine --warmup 2 --runs 3 --export-markdown "$tmpdir/bench-docker-buildx.md" "${cmdsDockerBuildx[@]}"

cat > bench.md <<EOL
## \`docker --version\`

$(cat "$tmpdir"/bench-cli.md)

## \`buildx version\`

$(cat "$tmpdir"/bench-buildx.md)

## \`docker buildx version\`

$(cat "$tmpdir"/bench-docker-buildx.md)
EOL

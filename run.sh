#!/usr/bin/env bash

cliReleases=("19.03.15" "20.10.0" "20.10.12" "20.10.17")
cliRefs=("2b4ffb301bb1cdd1adeb321807e10a9c656f346e" "a09e61a247656c780d2ae487a276ea1761ceb85c" "84b86e23b7f520b0bb956df88331d6c8d472ce0e" "c59773f1551a8fd289538efc82274332f31f8c19" "f1615facb1ca44e4336ab20e621315fc2cfb845a")
composeCliRefs=("1.0.26-env" "build-metrics-futureproof2" "go-1.18-test" "go-1.18")
buildxRefs=("v0.7.0" "v0.8.2" "701c548e46348da2958104907c9572ea7ce6ab52" "update-docker-cli")

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

for release in "${cliReleases[@]}"; do
  if [ ! -f "./builds/docker-${release}-${os}-${arch}" ]; then
    cliURL="https://download.docker.com/${os}/static/stable/${arch}/docker-${release}.tgz"
    if curl --head --silent --fail "${cliURL}" 1>/dev/null 2>&1; then
      (
        output=$(mktemp -d -t cli-bench-output.XXXXXXXXXX)
        wget -qO- "${cliURL}" | tar xvz --strip 1 -C "$output"
        cp "$output/docker" "./builds/docker-${release}-${os}-${arch}"
        rm -rf "$output"
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
  if [ ! -f "./builds/docker-22.xx-${i}-${ref}-${os}-${arch}" ]; then
    (
      output=$(mktemp -d -t cli-bench-output.XXXXXXXXXX)
      docker buildx bake --set "*.platform=local" --set "*.output=$output" "https://github.com/docker/cli.git#${ref}"
      cp $output/docker-* "./builds/docker-22.xx-${i}-${ref}-${os}-${arch}"
      rm -rf "$output"
    )
  fi
  cp "./builds/docker-22.xx-${i}-${ref}-${os}-${arch}" "./fixtures/docker-22.xx-${i}-${ref}"
done

for i in "${!composeCliRefs[@]}"; do
  ref="${composeCliRefs[$i]}"
  if [ ! -f "./builds/compose-cli-${i}-${ref}-${os}-${arch}" ]; then
    (
      output=$(mktemp -d -t cli-bench-output.XXXXXXXXXX)
      docker buildx build --platform=local --target=cli --output=$output "https://github.com/crazy-max/compose-cli.git#${ref}"
      cp "$output/docker" "./builds/compose-cli-${i}-${ref}-${os}-${arch}"
      rm -rf "$output"
    )
  fi
  cp "./builds/compose-cli-${i}-${ref}-${os}-${arch}" "./fixtures-compose-cli/compose-cli-${i}-${ref}"
done

for i in "${!buildxRefs[@]}"; do
  ref="${buildxRefs[$i]}"
  if [ ! -f "./builds/buildx-${i}-${ref}-${os}-${arch}" ]; then
    (
      output=$(mktemp -d -t cli-bench-output.XXXXXXXXXX)
      docker buildx bake --set "*.platform=local" --set "*.output=$output" "https://github.com/crazy-max/buildx.git#${ref}"
      cp "$output/buildx" "./builds/buildx-${i}-${ref}-${os}-${arch}"
      rm -rf "$output"
    )
  fi
  cp "./builds/buildx-${i}-${ref}-${os}-${arch}" "./fixtures-buildx/buildx-${i}-${ref}"
done

go test -run=NONE -bench=. -benchtime=5x | tee bench.txt

if [ ! -x "$(command -v benchstat)" ]; then
  go install golang.org/x/perf/cmd/benchstat@latest
fi

benchstat bench.txt

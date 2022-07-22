#!/usr/bin/env bash

cliReleases=("19.03.15" "20.10.0" "20.10.12" "20.10.17")
cliRefs=("2b4ffb301bb1cdd1adeb321807e10a9c656f346e" "a09e61a247656c780d2ae487a276ea1761ceb85c" "84b86e23b7f520b0bb956df88331d6c8d472ce0e" "c59773f1551a8fd289538efc82274332f31f8c19" "f1615facb1ca44e4336ab20e621315fc2cfb845a")
composeCliRefs=("main" "mobycli-env")
buildxRefs=("v0.8.2" "701c548e46348da2958104907c9572ea7ce6ab52" "update-docker-cli")

rm -rf ./fixtures*
mkdir ./fixtures ./fixtures-compose-cli ./fixtures-buildx
mkdir -p ./builds

for release in "${cliReleases[@]}"; do
  if [ ! -f "./builds/docker-${release}-$(uname -p)" ]; then
    (
      output=$(mktemp -d -t cli-bench-output.XXXXXXXXXX)
      wget -qO- "https://download.docker.com/linux/static/stable/$(uname -p)/docker-${release}.tgz" | tar xvz --strip 1 -C "$output"
      cp "$output/docker" "./builds/docker-${release}-$(uname -p)"
      rm -rf "$output"
    )
  fi
  cp "./builds/docker-${release}-$(uname -p)" "./fixtures/docker-${release}"
done

for i in "${!cliRefs[@]}"; do
  ref="${cliRefs[$i]}"
  if [ ! -f "./builds/docker-22.xx-${i}-${ref}-$(uname -p)" ]; then
    (
      output=$(mktemp -d -t cli-bench-output.XXXXXXXXXX)
      docker buildx bake --set "*.output=$output" "https://github.com/docker/cli.git#${ref}"
      cp $output/docker-* "./builds/docker-22.xx-${i}-${ref}-$(uname -p)"
      rm -rf "$output"
    )
  fi
  cp "./builds/docker-22.xx-${i}-${ref}-$(uname -p)" "./fixtures/docker-22.xx-${i}-${ref}"
done

for i in "${!composeCliRefs[@]}"; do
  ref="${composeCliRefs[$i]}"
  if [ ! -f "./builds/compose-cli-${i}-${ref}-$(uname -p)" ]; then
    (
      output=$(mktemp -d -t cli-bench-output.XXXXXXXXXX)
      docker buildx build --platform=local --target=cli --output=$output "https://github.com/crazy-max/compose-cli.git#${ref}"
      cp "$output/docker" "./builds/compose-cli-${i}-${ref}-$(uname -p)"
      rm -rf "$output"
    )
  fi
  cp "./builds/compose-cli-${i}-${ref}-$(uname -p)" "./fixtures-compose-cli/compose-cli-${i}-${ref}"
done

for i in "${!buildxRefs[@]}"; do
  ref="${buildxRefs[$i]}"
  if [ ! -f "./builds/buildx-${i}-${ref}-$(uname -p)" ]; then
    (
      output=$(mktemp -d -t cli-bench-output.XXXXXXXXXX)
      docker buildx bake --set *.output=$output "https://github.com/crazy-max/buildx.git#${ref}"
      cp "$output/buildx" "./builds/buildx-${i}-${ref}-$(uname -p)"
      rm -rf "$output"
    )
  fi
  cp "./builds/buildx-${i}-${ref}-$(uname -p)" "./fixtures-buildx/buildx-${i}-${ref}"
done

go test -run=NONE -bench=. -benchtime=5x | tee bench.txt

if [ ! -x "$(command -v benchstat)" ]; then
  go install golang.org/x/perf/cmd/benchstat@latest
fi

benchstat bench.txt

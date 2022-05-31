#!/usr/bin/env bash

cliReleases=("19.03.15" "20.10.0" "20.10.12" "20.10.16")
cliRefs=("84b86e23b7f520b0bb956df88331d6c8d472ce0e" "2b4ffb301bb1cdd1adeb321807e10a9c656f346e")
composeCliRef="https://github.com/crazy-max/compose-cli.git#mobycli-env"

rm -rf ./fixtures
mkdir ./fixtures
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
  if [ ! -f "./builds/docker-22.06.0-${i}-${ref}-$(uname -p)" ]; then
    (
      output=$(mktemp -d -t cli-bench-output.XXXXXXXXXX)
      docker buildx bake --set "*.output=$output" "https://github.com/docker/cli.git#${ref}"
      cp $output/docker-* "./builds/docker-22.06.0-${i}-${ref}-$(uname -p)"
      rm -rf "$output"
    )
  fi
  cp "./builds/docker-22.06.0-${i}-${ref}-$(uname -p)" "./fixtures/docker-22.xx-${i}-${ref}"
done

if [ ! -f "./builds/compose-cli-$(uname -p)" ]; then
  (
    output=$(mktemp -d -t cli-bench-output.XXXXXXXXXX)
    docker buildx build --platform=local --target=cli --output=$output "$composeCliRef"
    cp "$output/docker" "./builds/compose-cli-$(uname -p)"
    rm -rf "$output"
  )
fi
cp "./builds/compose-cli-$(uname -p)" "./compose-cli"

go test -run=NONE -bench=. -benchtime=5x | tee bench.txt

if [ ! -x "$(command -v benchstat)" ]; then
  go install golang.org/x/perf/cmd/benchstat@latest
fi

benchstat bench.txt

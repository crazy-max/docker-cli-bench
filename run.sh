#!/usr/bin/env sh

go test -run=NONE -bench=. -benchtime=5x | tee bench.txt

if [ ! -x "$(command -v benchstat)" ]; then
  go install golang.org/x/perf/cmd/benchstat@latest
fi

benchstat bench.txt

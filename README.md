```text
goos: linux
goarch: amd64
pkg: github.com/crazy-max/docker-cli-bench
cpu: AMD Ryzen 9 5950X 16-Core Processor
BenchmarkCliVersion/docker-19.03.15-32                 5         488292562 ns/op
BenchmarkCliVersion/docker-20.10.0-32                  5         479489629 ns/op
BenchmarkCliVersion/docker-20.10.12-32                 5         477344865 ns/op
BenchmarkCliVersion/docker-20.10.16-32                 5         426461838 ns/op
BenchmarkCliVersion/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32                 5         244964440 ns/op
BenchmarkCliVersion/docker-22.xx-1-a09e61a247656c780d2ae487a276ea1761ceb85c-32                 5         338975748 ns/op
BenchmarkCliVersion/docker-22.xx-2-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32                 5         324709978 ns/op
BenchmarkBuildxVersion/docker-19.03.15-32                                                      5         479520293 ns/op
BenchmarkBuildxVersion/docker-20.10.0-32                                                       5         433267681 ns/op
BenchmarkBuildxVersion/docker-20.10.12-32                                                      5         479150888 ns/op
BenchmarkBuildxVersion/docker-20.10.16-32                                                      5         433314213 ns/op
BenchmarkBuildxVersion/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32              5         276029629 ns/op
BenchmarkBuildxVersion/docker-22.xx-1-a09e61a247656c780d2ae487a276ea1761ceb85c-32              5         352837946 ns/op
BenchmarkBuildxVersion/docker-22.xx-2-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32              5         348705050 ns/op
BenchmarkCliVersionViaComposeCli/docker-19.03.15-32                                            5         984682842 ns/op
BenchmarkCliVersionViaComposeCli/docker-20.10.0-32                                             5         923572246 ns/op
BenchmarkCliVersionViaComposeCli/docker-20.10.12-32                                            5         951378791 ns/op
BenchmarkCliVersionViaComposeCli/docker-20.10.16-32                                            5         949051429 ns/op
BenchmarkCliVersionViaComposeCli/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32                    5         782497364 ns/op
BenchmarkCliVersionViaComposeCli/docker-22.xx-1-a09e61a247656c780d2ae487a276ea1761ceb85c-32                    5         863001258 ns/op
BenchmarkCliVersionViaComposeCli/docker-22.xx-2-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32                    5         842948949 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-19.03.15-32                                                         5        1002259673 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-20.10.0-32                                                          5         947629012 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-20.10.12-32                                                         5         994753576 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-20.10.16-32                                                         5         961118902 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32                 5         802853288 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-22.xx-1-a09e61a247656c780d2ae487a276ea1761ceb85c-32                 5         844687127 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-22.xx-2-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32                 5         865235913 ns/op
PASS
ok      github.com/crazy-max/docker-cli-bench   110.069s
```

```text
name                                                                                   time/op
CliVersion/docker-19.03.15-32                                                          488ms ± 0%
CliVersion/docker-20.10.0-32                                                           479ms ± 0%
CliVersion/docker-20.10.12-32                                                          477ms ± 0%
CliVersion/docker-20.10.16-32                                                          426ms ± 0%
CliVersion/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32                  245ms ± 0%
CliVersion/docker-22.xx-1-a09e61a247656c780d2ae487a276ea1761ceb85c-32                  339ms ± 0%
CliVersion/docker-22.xx-2-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32                  325ms ± 0%
BuildxVersion/docker-19.03.15-32                                                       480ms ± 0%
BuildxVersion/docker-20.10.0-32                                                        433ms ± 0%
BuildxVersion/docker-20.10.12-32                                                       479ms ± 0%
BuildxVersion/docker-20.10.16-32                                                       433ms ± 0%
BuildxVersion/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32               276ms ± 0%
BuildxVersion/docker-22.xx-1-a09e61a247656c780d2ae487a276ea1761ceb85c-32               353ms ± 0%
BuildxVersion/docker-22.xx-2-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32               349ms ± 0%
CliVersionViaComposeCli/docker-19.03.15-32                                             985ms ± 0%
CliVersionViaComposeCli/docker-20.10.0-32                                              924ms ± 0%
CliVersionViaComposeCli/docker-20.10.12-32                                             951ms ± 0%
CliVersionViaComposeCli/docker-20.10.16-32                                             949ms ± 0%
CliVersionViaComposeCli/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32     782ms ± 0%
CliVersionViaComposeCli/docker-22.xx-1-a09e61a247656c780d2ae487a276ea1761ceb85c-32     863ms ± 0%
CliVersionViaComposeCli/docker-22.xx-2-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32     843ms ± 0%
BuildxVersionViaComposeCli/docker-19.03.15-32                                          1.00s ± 0%
BuildxVersionViaComposeCli/docker-20.10.0-32                                           948ms ± 0%
BuildxVersionViaComposeCli/docker-20.10.12-32                                          995ms ± 0%
BuildxVersionViaComposeCli/docker-20.10.16-32                                          961ms ± 0%
BuildxVersionViaComposeCli/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32  803ms ± 0%
BuildxVersionViaComposeCli/docker-22.xx-1-a09e61a247656c780d2ae487a276ea1761ceb85c-32  845ms ± 0%
BuildxVersionViaComposeCli/docker-22.xx-2-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32  865ms ± 0%
```

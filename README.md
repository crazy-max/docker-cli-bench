```text
goos: linux
goarch: amd64
pkg: github.com/crazy-max/docker-cli-bench
cpu: AMD Ryzen 9 5950X 16-Core Processor
BenchmarkCliVersion/docker-19.03.15-32                 5         470425035 ns/op
BenchmarkCliVersion/docker-20.10.0-32                  5         449099797 ns/op
BenchmarkCliVersion/docker-20.10.12-32                 5         510862339 ns/op
BenchmarkCliVersion/docker-20.10.16-32                 5         435397146 ns/op
BenchmarkCliVersion/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32                 5         265526874 ns/op
BenchmarkCliVersion/docker-22.xx-1-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32                 5         342702022 ns/op
BenchmarkBuildxVersion/docker-19.03.15-32                                                      5         474765168 ns/op
BenchmarkBuildxVersion/docker-20.10.0-32                                                       5         446933730 ns/op
BenchmarkBuildxVersion/docker-20.10.12-32                                                      5         463494979 ns/op
BenchmarkBuildxVersion/docker-20.10.16-32                                                      5         448247001 ns/op
BenchmarkBuildxVersion/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32              5         274755439 ns/op
BenchmarkBuildxVersion/docker-22.xx-1-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32              5         352615966 ns/op
BenchmarkCliVersionViaComposeCli/docker-19.03.15-32                                            5         975886304 ns/op
BenchmarkCliVersionViaComposeCli/docker-20.10.0-32                                             5         971681403 ns/op
BenchmarkCliVersionViaComposeCli/docker-20.10.12-32                                            5         974530581 ns/op
BenchmarkCliVersionViaComposeCli/docker-20.10.16-32                                            5         998342149 ns/op
BenchmarkCliVersionViaComposeCli/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32                    5         784324034 ns/op
BenchmarkCliVersionViaComposeCli/docker-22.xx-1-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32                    5         851059860 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-19.03.15-32                                                         5        1009923386 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-20.10.0-32                                                          5         942523658 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-20.10.12-32                                                         5         984211591 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-20.10.16-32                                                         5         970651740 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32                 5         807466737 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-22.xx-1-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32                 5         877929376 ns/op
PASS
ok      github.com/crazy-max/docker-cli-bench   96.636s
```

```text
name                                                                                   time/op
CliVersion/docker-19.03.15-32                                                          470ms ± 0%
CliVersion/docker-20.10.0-32                                                           449ms ± 0%
CliVersion/docker-20.10.12-32                                                          511ms ± 0%
CliVersion/docker-20.10.16-32                                                          435ms ± 0%
CliVersion/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32                  266ms ± 0%
CliVersion/docker-22.xx-1-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32                  343ms ± 0%
BuildxVersion/docker-19.03.15-32                                                       475ms ± 0%
BuildxVersion/docker-20.10.0-32                                                        447ms ± 0%
BuildxVersion/docker-20.10.12-32                                                       463ms ± 0%
BuildxVersion/docker-20.10.16-32                                                       448ms ± 0%
BuildxVersion/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32               275ms ± 0%
BuildxVersion/docker-22.xx-1-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32               353ms ± 0%
CliVersionViaComposeCli/docker-19.03.15-32                                             976ms ± 0%
CliVersionViaComposeCli/docker-20.10.0-32                                              972ms ± 0%
CliVersionViaComposeCli/docker-20.10.12-32                                             975ms ± 0%
CliVersionViaComposeCli/docker-20.10.16-32                                             1.00s ± 0%
CliVersionViaComposeCli/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32     784ms ± 0%
CliVersionViaComposeCli/docker-22.xx-1-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32     851ms ± 0%
BuildxVersionViaComposeCli/docker-19.03.15-32                                          1.01s ± 0%
BuildxVersionViaComposeCli/docker-20.10.0-32                                           943ms ± 0%
BuildxVersionViaComposeCli/docker-20.10.12-32                                          984ms ± 0%
BuildxVersionViaComposeCli/docker-20.10.16-32                                          971ms ± 0%
BuildxVersionViaComposeCli/docker-22.xx-0-2b4ffb301bb1cdd1adeb321807e10a9c656f346e-32  807ms ± 0%
BuildxVersionViaComposeCli/docker-22.xx-1-84b86e23b7f520b0bb956df88331d6c8d472ce0e-32  878ms ± 0%
```

```text
goos: linux
goarch: amd64
pkg: github.com/crazy-max/docker-cli-bench
cpu: AMD Ryzen 9 5950X 16-Core Processor
BenchmarkCliVersion/docker-19.03.15-32                 5         455323066 ns/op
BenchmarkCliVersion/docker-20.10.0-32                  5         420477804 ns/op
BenchmarkCliVersion/docker-20.10.12-32                 5         433564783 ns/op
BenchmarkCliVersion/docker-20.10.16-32                 5         420332894 ns/op
BenchmarkCliVersion/docker-22.06.0-20220512-84b86e23-32                        5         262574480 ns/op
BenchmarkCliVersion/docker-22.06.0-20220529-2b4ffb30-32                        5         339449326 ns/op
BenchmarkBuildxVersion/docker-19.03.15-32                                      5         471488905 ns/op
BenchmarkBuildxVersion/docker-20.10.0-32                                       5         444357231 ns/op
BenchmarkBuildxVersion/docker-20.10.12-32                                      5         457813711 ns/op
BenchmarkBuildxVersion/docker-20.10.16-32                                      5         424835740 ns/op
BenchmarkBuildxVersion/docker-22.06.0-20220512-84b86e23-32                     5         270223324 ns/op
BenchmarkBuildxVersion/docker-22.06.0-20220529-2b4ffb30-32                     5         349111402 ns/op
BenchmarkCliVersionViaComposeCli/docker-19.03.15-32                            5        1179523473 ns/op
BenchmarkCliVersionViaComposeCli/docker-20.10.0-32                             5        1139657430 ns/op
BenchmarkCliVersionViaComposeCli/docker-20.10.12-32                            5        1186310310 ns/op
BenchmarkCliVersionViaComposeCli/docker-20.10.16-32                            5        1174578095 ns/op
BenchmarkCliVersionViaComposeCli/docker-22.06.0-20220512-84b86e23-32                   5         998983885 ns/op
BenchmarkCliVersionViaComposeCli/docker-22.06.0-20220529-2b4ffb30-32                   5        1065475862 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-19.03.15-32                                 5        1234623154 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-20.10.0-32                                  5        1161675252 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-20.10.12-32                                 5        1193262452 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-20.10.16-32                                 5        1171404709 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-22.06.0-20220512-84b86e23-32                5        1011626284 ns/op
BenchmarkBuildxVersionViaComposeCli/docker-22.06.0-20220529-2b4ffb30-32                5        1092528427 ns/op
PASS
ok      github.com/crazy-max/docker-cli-bench   110.482s
```

```text
name                                                            time/op
CliVersion/docker-19.03.15-32                                   455ms ± 0%
CliVersion/docker-20.10.0-32                                    420ms ± 0%
CliVersion/docker-20.10.12-32                                   434ms ± 0%
CliVersion/docker-20.10.16-32                                   420ms ± 0%
CliVersion/docker-22.06.0-20220512-84b86e23-32                  263ms ± 0%
CliVersion/docker-22.06.0-20220529-2b4ffb30-32                  339ms ± 0%
BuildxVersion/docker-19.03.15-32                                471ms ± 0%
BuildxVersion/docker-20.10.0-32                                 444ms ± 0%
BuildxVersion/docker-20.10.12-32                                458ms ± 0%
BuildxVersion/docker-20.10.16-32                                425ms ± 0%
BuildxVersion/docker-22.06.0-20220512-84b86e23-32               270ms ± 0%
BuildxVersion/docker-22.06.0-20220529-2b4ffb30-32               349ms ± 0%
CliVersionViaComposeCli/docker-19.03.15-32                      1.18s ± 0%
CliVersionViaComposeCli/docker-20.10.0-32                       1.14s ± 0%
CliVersionViaComposeCli/docker-20.10.12-32                      1.19s ± 0%
CliVersionViaComposeCli/docker-20.10.16-32                      1.17s ± 0%
CliVersionViaComposeCli/docker-22.06.0-20220512-84b86e23-32     1.00s ± 0%
CliVersionViaComposeCli/docker-22.06.0-20220529-2b4ffb30-32     1.07s ± 0%
BuildxVersionViaComposeCli/docker-19.03.15-32                   1.23s ± 0%
BuildxVersionViaComposeCli/docker-20.10.0-32                    1.16s ± 0%
BuildxVersionViaComposeCli/docker-20.10.12-32                   1.19s ± 0%
BuildxVersionViaComposeCli/docker-20.10.16-32                   1.17s ± 0%
BuildxVersionViaComposeCli/docker-22.06.0-20220512-84b86e23-32  1.01s ± 0%
BuildxVersionViaComposeCli/docker-22.06.0-20220529-2b4ffb30-32  1.09s ± 0%
```

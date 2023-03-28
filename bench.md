## `docker --version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `docker-20.10.12` | 19.2 ± 1.3 | 18.4 | 21.4 | 2.04 ± 0.47 |
| `docker-20.10.17` | 19.5 ± 0.8 | 18.5 | 20.5 | 2.07 ± 0.47 |
| `docker-20.10.23` | 15.3 ± 2.4 | 12.6 | 19.0 | 1.63 ± 0.44 |
| `docker-23.0.1` | 93.9 ± 1.8 | 91.0 | 95.8 | 9.96 ± 2.22 |
| `docker-dev-pr-3419-a4b6fe1` | 17.5 ± 1.0 | 16.8 | 19.1 | 1.85 ± 0.42 |
| `docker-dev-pr-3429-a09e61a` | 93.7 ± 0.8 | 92.5 | 94.5 | 9.94 ± 2.21 |
| `docker-dev-pr-3635-84b86e2` | 94.4 ± 0.9 | 92.9 | 95.5 | 10.01 ± 2.22 |
| `docker-dev-pr-3640-c59773f` | 92.7 ± 1.3 | 91.4 | 94.9 | 9.84 ± 2.19 |
| `docker-dev-pr-3713-f1615fa` | 94.6 ± 1.7 | 91.8 | 96.0 | 10.04 ± 2.23 |
| `docker-dev-pr-4114-f5d698a` | 92.6 ± 1.2 | 91.5 | 94.4 | 9.82 ± 2.18 |
| `docker-dev-rm-plugins-completion` | 9.7 ± 2.5 | 7.6 | 13.5 | 1.03 ± 0.35 |
| `docker-dev-fix-perf-reg` | 37.3 ± 0.9 | 36.2 | 38.4 | 3.96 ± 0.88 |
| `docker-dev-fix-perf-reg-2` | 9.4 ± 2.1 | 7.6 | 12.6 | 1.00 |

## `buildx version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `buildx-0.10.4` | 14.6 ± 0.5 | 13.7 | 15.0 | 1.00 |

## `docker buildx version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `docker-20.10.12-buildx-0.10.4` | 48.2 ± 0.7 | 47.4 | 49.0 | 1.30 ± 0.02 |
| `docker-20.10.17-buildx-0.10.4` | 49.1 ± 1.5 | 48.0 | 51.7 | 1.32 ± 0.04 |
| `docker-20.10.23-buildx-0.10.4` | 42.9 ± 0.5 | 42.6 | 43.8 | 1.16 ± 0.02 |
| `docker-23.0.1-buildx-0.10.4` | 120.9 ± 1.2 | 119.5 | 122.4 | 3.26 ± 0.04 |
| `docker-dev-pr-3419-a4b6fe1-buildx-0.10.4` | 48.3 ± 2.0 | 46.5 | 50.8 | 1.30 ± 0.05 |
| `docker-dev-pr-3429-a09e61a-buildx-0.10.4` | 123.6 ± 1.6 | 121.9 | 126.1 | 3.33 ± 0.05 |
| `docker-dev-pr-3635-84b86e2-buildx-0.10.4` | 123.4 ± 1.0 | 122.4 | 124.6 | 3.32 ± 0.04 |
| `docker-dev-pr-3640-c59773f-buildx-0.10.4` | 124.4 ± 0.9 | 123.4 | 125.4 | 3.35 ± 0.04 |
| `docker-dev-pr-3713-f1615fa-buildx-0.10.4` | 124.1 ± 1.0 | 122.8 | 125.6 | 3.34 ± 0.04 |
| `docker-dev-pr-4114-f5d698a-buildx-0.10.4` | 121.7 ± 0.5 | 121.0 | 122.5 | 3.28 ± 0.03 |
| `docker-dev-rm-plugins-completion-buildx-0.10.4` | 37.2 ± 0.6 | 36.4 | 37.8 | 1.00 ± 0.02 |
| `docker-dev-fix-perf-reg-buildx-0.10.4` | 66.8 ± 0.6 | 66.0 | 67.7 | 1.80 ± 0.02 |
| `docker-dev-fix-perf-reg-2-buildx-0.10.4` | 37.1 ± 0.4 | 36.8 | 37.7 | 1.00 |

## `docker buildx version` (through compose-cli)

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `compose-cli-1.0.31-docker-20.10.12-buildx-0.10.4` | 75.6 ± 0.8 | 74.8 | 77.0 | 1.17 ± 0.02 |
| `compose-cli-1.0.31-docker-20.10.17-buildx-0.10.4` | 75.3 ± 0.5 | 74.7 | 76.0 | 1.17 ± 0.02 |
| `compose-cli-1.0.31-docker-20.10.23-buildx-0.10.4` | 70.6 ± 1.6 | 69.4 | 73.5 | 1.10 ± 0.03 |
| `compose-cli-1.0.31-docker-23.0.1-buildx-0.10.4` | 147.2 ± 0.8 | 146.0 | 148.0 | 2.29 ± 0.04 |
| `compose-cli-1.0.31-docker-dev-pr-3419-a4b6fe1-buildx-0.10.4` | 73.7 ± 0.9 | 72.3 | 74.3 | 1.15 ± 0.02 |
| `compose-cli-1.0.31-docker-dev-pr-3429-a09e61a-buildx-0.10.4` | 150.3 ± 1.4 | 148.8 | 152.5 | 2.34 ± 0.04 |
| `compose-cli-1.0.31-docker-dev-pr-3635-84b86e2-buildx-0.10.4` | 151.0 ± 1.5 | 150.0 | 153.4 | 2.35 ± 0.05 |
| `compose-cli-1.0.31-docker-dev-pr-3640-c59773f-buildx-0.10.4` | 150.7 ± 1.2 | 149.0 | 152.0 | 2.34 ± 0.04 |
| `compose-cli-1.0.31-docker-dev-pr-3713-f1615fa-buildx-0.10.4` | 150.7 ± 0.9 | 149.9 | 152.2 | 2.34 ± 0.04 |
| `compose-cli-1.0.31-docker-dev-pr-4114-f5d698a-buildx-0.10.4` | 147.7 ± 1.3 | 146.2 | 149.9 | 2.30 ± 0.04 |
| `compose-cli-1.0.31-docker-dev-rm-plugins-completion-buildx-0.10.4` | 64.6 ± 1.1 | 63.4 | 66.2 | 1.00 ± 0.02 |
| `compose-cli-1.0.31-docker-dev-fix-perf-reg-buildx-0.10.4` | 93.0 ± 1.1 | 91.5 | 94.5 | 1.45 ± 0.03 |
| `compose-cli-1.0.31-docker-dev-fix-perf-reg-2-buildx-0.10.4` | 64.4 ± 1.1 | 63.2 | 65.5 | 1.00 |
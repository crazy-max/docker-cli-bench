## `docker --version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `docker-20.10.12` | 22.4 ± 1.5 | 20.3 | 24.1 | 2.43 ± 0.27 |
| `docker-20.10.17` | 24.1 ± 2.3 | 21.3 | 26.7 | 2.61 ± 0.33 |
| `docker-20.10.23` | 16.0 ± 1.2 | 15.1 | 18.1 | 1.74 ± 0.20 |
| `docker-23.0.1` | 421.9 ± 205.0 | 323.7 | 788.4 | 45.71 ± 22.55 |
| `docker-23.0.3` | 338.1 ± 16.6 | 326.0 | 366.8 | 36.63 ± 3.60 |
| `docker-24.0.0-beta.1` | 9.5 ± 0.9 | 8.3 | 10.8 | 1.03 ± 0.13 |
| `docker-dev-fix-perf-reg` | 11.1 ± 1.5 | 9.5 | 12.9 | 1.20 ± 0.19 |
| `docker-dev-fix-racy-help` | 9.2 ± 0.8 | 8.0 | 10.0 | 1.00 |
| `docker-dev-pr-3419-a4b6fe1` | 24.9 ± 7.8 | 19.2 | 38.4 | 2.69 ± 0.88 |
| `docker-dev-pr-4114-f5d698a` | 350.9 ± 9.1 | 337.0 | 360.7 | 38.01 ± 3.39 |
| `docker-dev-pr-4173-c25b8f8` | 11.7 ± 1.9 | 9.6 | 14.1 | 1.26 ± 0.23 |

## `buildx version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `buildx-0.10.4` | 18.4 ± 2.1 | 16.2 | 21.4 | 1.00 |

## `docker buildx version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `docker-20.10.12-buildx-0.10.4` | 67.1 ± 8.1 | 58.8 | 76.4 | 1.55 ± 0.19 |
| `docker-20.10.17-buildx-0.10.4` | 60.8 ± 2.5 | 56.9 | 62.9 | 1.41 ± 0.06 |
| `docker-20.10.23-buildx-0.10.4` | 58.5 ± 11.2 | 50.4 | 77.8 | 1.36 ± 0.26 |
| `docker-23.0.1-buildx-0.10.4` | 155.5 ± 12.2 | 144.9 | 175.9 | 3.60 ± 0.29 |
| `docker-23.0.3-buildx-0.10.4` | 159.5 ± 9.8 | 147.3 | 172.9 | 3.69 ± 0.23 |
| `docker-24.0.0-beta.1-buildx-0.10.4` | 43.2 ± 0.7 | 42.6 | 44.1 | 1.00 |
| `docker-dev-fix-perf-reg-buildx-0.10.4` | 45.9 ± 3.2 | 42.0 | 50.5 | 1.06 ± 0.08 |
| `docker-dev-fix-racy-help-buildx-0.10.4` | 44.3 ± 3.1 | 40.3 | 48.5 | 1.03 ± 0.07 |
| `docker-dev-pr-3419-a4b6fe1-buildx-0.10.4` | 58.1 ± 2.2 | 55.9 | 61.2 | 1.35 ± 0.06 |
| `docker-dev-pr-4114-f5d698a-buildx-0.10.4` | 161.7 ± 14.0 | 149.9 | 178.4 | 3.74 ± 0.33 |
| `docker-dev-pr-4173-c25b8f8-buildx-0.10.4` | 44.8 ± 2.5 | 42.7 | 49.2 | 1.04 ± 0.06 |

## `docker buildx version` (through compose-cli)

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `compose-cli-1.0.31-docker-20.10.12-buildx-0.10.4` | 99.5 ± 4.2 | 93.4 | 104.7 | 1.24 ± 0.06 |
| `compose-cli-1.0.31-docker-20.10.17-buildx-0.10.4` | 95.7 ± 6.6 | 91.3 | 107.2 | 1.19 ± 0.08 |
| `compose-cli-1.0.31-docker-20.10.23-buildx-0.10.4` | 90.6 ± 2.5 | 88.3 | 94.8 | 1.13 ± 0.04 |
| `compose-cli-1.0.31-docker-23.0.1-buildx-0.10.4` | 201.2 ± 16.9 | 182.4 | 226.9 | 2.51 ± 0.21 |
| `compose-cli-1.0.31-docker-23.0.3-buildx-0.10.4` | 194.9 ± 9.8 | 184.8 | 208.8 | 2.43 ± 0.13 |
| `compose-cli-1.0.31-docker-24.0.0-beta.1-buildx-0.10.4` | 82.2 ± 3.4 | 77.1 | 86.6 | 1.03 ± 0.05 |
| `compose-cli-1.0.31-docker-dev-fix-perf-reg-buildx-0.10.4` | 85.7 ± 3.8 | 82.7 | 91.9 | 1.07 ± 0.05 |
| `compose-cli-1.0.31-docker-dev-fix-racy-help-buildx-0.10.4` | 80.1 ± 1.3 | 78.5 | 81.9 | 1.00 |
| `compose-cli-1.0.31-docker-dev-pr-3419-a4b6fe1-buildx-0.10.4` | 92.6 ± 2.7 | 89.6 | 96.7 | 1.16 ± 0.04 |
| `compose-cli-1.0.31-docker-dev-pr-4114-f5d698a-buildx-0.10.4` | 187.5 ± 3.8 | 183.7 | 192.2 | 2.34 ± 0.06 |
| `compose-cli-1.0.31-docker-dev-pr-4173-c25b8f8-buildx-0.10.4` | 83.3 ± 4.8 | 77.6 | 89.1 | 1.04 ± 0.06 |

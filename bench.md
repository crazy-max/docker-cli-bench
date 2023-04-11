## `docker --version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `docker-20.10.12` | 25.9 ± 2.6 | 22.3 | 28.7 | 2.52 ± 0.34 |
| `docker-20.10.17` | 27.0 ± 2.5 | 23.5 | 29.8 | 2.63 ± 0.34 |
| `docker-20.10.23` | 16.7 ± 1.6 | 15.5 | 19.5 | 1.62 ± 0.21 |
| `docker-23.0.1` | 355.0 ± 8.8 | 341.3 | 361.9 | 34.55 ± 3.18 |
| `docker-23.0.3` | 362.5 ± 2.9 | 360.2 | 367.4 | 35.28 ± 3.14 |
| `docker-24.0.0-beta.1` | 10.3 ± 0.9 | 9.5 | 11.6 | 1.00 |
| `docker-dev-fix-perf-reg` | 11.4 ± 1.5 | 9.6 | 13.4 | 1.11 ± 0.18 |
| `docker-dev-fix-racy-help` | 11.0 ± 0.7 | 10.1 | 11.9 | 1.07 ± 0.12 |
| `docker-dev-pr-3419-a4b6fe1` | 21.2 ± 2.2 | 18.8 | 24.1 | 2.07 ± 0.28 |
| `docker-dev-pr-4114-f5d698a` | 347.9 ± 8.7 | 334.6 | 357.7 | 33.86 ± 3.12 |
| `docker-dev-pr-4173-c25b8f8` | 10.3 ± 0.9 | 9.3 | 11.4 | 1.00 ± 0.13 |

## `buildx version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `buildx-0.10.4` | 16.7 ± 1.2 | 15.5 | 18.4 | 1.00 |

## `docker buildx version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `docker-20.10.12-buildx-0.10.4` | 62.6 ± 2.5 | 60.1 | 65.8 | 1.44 ± 0.07 |
| `docker-20.10.17-buildx-0.10.4` | 62.7 ± 3.2 | 59.8 | 67.7 | 1.44 ± 0.08 |
| `docker-20.10.23-buildx-0.10.4` | 53.9 ± 1.2 | 53.0 | 55.8 | 1.24 ± 0.04 |
| `docker-23.0.1-buildx-0.10.4` | 154.6 ± 4.3 | 151.0 | 159.5 | 3.55 ± 0.13 |
| `docker-23.0.3-buildx-0.10.4` | 152.8 ± 1.7 | 151.1 | 155.5 | 3.51 ± 0.09 |
| `docker-24.0.0-beta.1-buildx-0.10.4` | 43.6 ± 1.0 | 42.1 | 44.6 | 1.00 |
| `docker-dev-fix-perf-reg-buildx-0.10.4` | 43.7 ± 0.6 | 42.8 | 44.2 | 1.00 ± 0.03 |
| `docker-dev-fix-racy-help-buildx-0.10.4` | 45.4 ± 2.4 | 43.0 | 48.1 | 1.04 ± 0.06 |
| `docker-dev-pr-3419-a4b6fe1-buildx-0.10.4` | 62.2 ± 3.0 | 58.9 | 65.5 | 1.43 ± 0.08 |
| `docker-dev-pr-4114-f5d698a-buildx-0.10.4` | 152.5 ± 0.7 | 151.8 | 153.4 | 3.50 ± 0.08 |
| `docker-dev-pr-4173-c25b8f8-buildx-0.10.4` | 44.9 ± 1.0 | 43.5 | 46.2 | 1.03 ± 0.03 |

## `docker buildx version` (through compose-cli)

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `compose-cli-1.0.31-docker-20.10.12-buildx-0.10.4` | 97.1 ± 1.6 | 94.7 | 99.2 | 1.20 ± 0.03 |
| `compose-cli-1.0.31-docker-20.10.17-buildx-0.10.4` | 102.4 ± 4.8 | 96.9 | 108.8 | 1.27 ± 0.06 |
| `compose-cli-1.0.31-docker-20.10.23-buildx-0.10.4` | 94.8 ± 4.4 | 90.1 | 101.0 | 1.17 ± 0.06 |
| `compose-cli-1.0.31-docker-23.0.1-buildx-0.10.4` | 194.4 ± 4.2 | 190.1 | 200.5 | 2.40 ± 0.07 |
| `compose-cli-1.0.31-docker-23.0.3-buildx-0.10.4` | 194.8 ± 2.5 | 192.3 | 198.5 | 2.41 ± 0.05 |
| `compose-cli-1.0.31-docker-24.0.0-beta.1-buildx-0.10.4` | 82.2 ± 1.4 | 80.8 | 84.5 | 1.02 ± 0.02 |
| `compose-cli-1.0.31-docker-dev-fix-perf-reg-buildx-0.10.4` | 80.8 ± 1.3 | 78.8 | 82.3 | 1.00 |
| `compose-cli-1.0.31-docker-dev-fix-racy-help-buildx-0.10.4` | 81.5 ± 1.0 | 79.7 | 82.3 | 1.01 ± 0.02 |
| `compose-cli-1.0.31-docker-dev-pr-3419-a4b6fe1-buildx-0.10.4` | 97.4 ± 2.6 | 94.3 | 101.4 | 1.20 ± 0.04 |
| `compose-cli-1.0.31-docker-dev-pr-4114-f5d698a-buildx-0.10.4` | 197.3 ± 6.5 | 189.2 | 207.1 | 2.44 ± 0.09 |
| `compose-cli-1.0.31-docker-dev-pr-4173-c25b8f8-buildx-0.10.4` | 85.1 ± 1.3 | 82.9 | 86.2 | 1.05 ± 0.02 |

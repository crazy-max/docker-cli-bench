## `docker --version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `docker-20.10.12` | 19.8 ± 1.1 | 18.6 | 21.1 | 2.09 ± 0.56 |
| `docker-20.10.17` | 19.4 ± 0.6 | 18.7 | 20.1 | 2.05 ± 0.54 |
| `docker-20.10.23` | 14.8 ± 2.3 | 13.2 | 18.8 | 1.56 ± 0.48 |
| `docker-23.0.1` | 92.2 ± 0.8 | 91.1 | 93.2 | 9.76 ± 2.57 |
| `docker-dev-pr-3419-a4b6fe1` | 17.8 ± 1.0 | 17.0 | 19.5 | 1.88 ± 0.51 |
| `docker-dev-pr-3429-a09e61a` | 95.4 ± 1.0 | 94.3 | 96.9 | 10.09 ± 2.66 |
| `docker-dev-pr-3635-84b86e2` | 94.5 ± 1.1 | 92.7 | 95.4 | 10.00 ± 2.64 |
| `docker-dev-pr-3640-c59773f` | 95.1 ± 1.1 | 93.4 | 96.2 | 10.06 ± 2.65 |
| `docker-dev-pr-3713-f1615fa` | 95.8 ± 0.9 | 94.2 | 96.5 | 10.13 ± 2.67 |
| `docker-dev-pr-4114-f5d698a` | 92.1 ± 0.9 | 91.1 | 93.2 | 9.75 ± 2.57 |
| `docker-dev-fix-perf-reg` | 9.8 ± 2.5 | 7.5 | 13.6 | 1.04 ± 0.38 |
| `docker-dev-fix-racy-help` | 9.5 ± 2.5 | 7.5 | 13.5 | 1.00 |

## `buildx version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `buildx-0.10.4` | 14.5 ± 0.6 | 13.9 | 15.5 | 1.00 |

## `docker buildx version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `docker-20.10.12-buildx-0.10.4` | 48.2 ± 0.6 | 47.7 | 48.8 | 1.29 ± 0.02 |
| `docker-20.10.17-buildx-0.10.4` | 48.5 ± 0.3 | 48.1 | 48.9 | 1.30 ± 0.02 |
| `docker-20.10.23-buildx-0.10.4` | 42.7 ± 0.4 | 42.3 | 43.2 | 1.15 ± 0.02 |
| `docker-23.0.1-buildx-0.10.4` | 121.8 ± 1.0 | 120.1 | 122.7 | 3.27 ± 0.05 |
| `docker-dev-pr-3419-a4b6fe1-buildx-0.10.4` | 47.1 ± 1.0 | 46.1 | 48.7 | 1.27 ± 0.03 |
| `docker-dev-pr-3429-a09e61a-buildx-0.10.4` | 123.7 ± 1.0 | 122.4 | 124.7 | 3.32 ± 0.05 |
| `docker-dev-pr-3635-84b86e2-buildx-0.10.4` | 123.8 ± 0.8 | 122.8 | 124.8 | 3.33 ± 0.05 |
| `docker-dev-pr-3640-c59773f-buildx-0.10.4` | 124.1 ± 0.6 | 123.5 | 125.0 | 3.33 ± 0.04 |
| `docker-dev-pr-3713-f1615fa-buildx-0.10.4` | 125.4 ± 1.2 | 124.2 | 127.4 | 3.37 ± 0.05 |
| `docker-dev-pr-4114-f5d698a-buildx-0.10.4` | 121.4 ± 0.6 | 120.7 | 122.1 | 3.26 ± 0.04 |
| `docker-dev-fix-perf-reg-buildx-0.10.4` | 37.3 ± 0.2 | 37.1 | 37.7 | 1.00 ± 0.01 |
| `docker-dev-fix-racy-help-buildx-0.10.4` | 37.2 ± 0.5 | 36.7 | 37.9 | 1.00 |

## `docker buildx version` (through compose-cli)

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `compose-cli-1.0.31-docker-20.10.12-buildx-0.10.4` | 75.9 ± 0.6 | 75.6 | 77.0 | 1.17 ± 0.01 |
| `compose-cli-1.0.31-docker-20.10.17-buildx-0.10.4` | 75.5 ± 0.4 | 75.1 | 75.9 | 1.16 ± 0.01 |
| `compose-cli-1.0.31-docker-20.10.23-buildx-0.10.4` | 71.6 ± 2.3 | 70.2 | 75.5 | 1.10 ± 0.04 |
| `compose-cli-1.0.31-docker-23.0.1-buildx-0.10.4` | 149.3 ± 1.5 | 147.5 | 151.6 | 2.30 ± 0.03 |
| `compose-cli-1.0.31-docker-dev-pr-3419-a4b6fe1-buildx-0.10.4` | 75.9 ± 2.1 | 74.2 | 79.5 | 1.17 ± 0.03 |
| `compose-cli-1.0.31-docker-dev-pr-3429-a09e61a-buildx-0.10.4` | 153.7 ± 3.2 | 150.7 | 158.2 | 2.37 ± 0.05 |
| `compose-cli-1.0.31-docker-dev-pr-3635-84b86e2-buildx-0.10.4` | 152.3 ± 1.5 | 150.9 | 154.8 | 2.35 ± 0.03 |
| `compose-cli-1.0.31-docker-dev-pr-3640-c59773f-buildx-0.10.4` | 152.1 ± 0.6 | 151.5 | 153.0 | 2.34 ± 0.02 |
| `compose-cli-1.0.31-docker-dev-pr-3713-f1615fa-buildx-0.10.4` | 152.2 ± 0.7 | 151.4 | 153.1 | 2.35 ± 0.02 |
| `compose-cli-1.0.31-docker-dev-pr-4114-f5d698a-buildx-0.10.4` | 159.2 ± 10.3 | 148.3 | 171.5 | 2.45 ± 0.16 |
| `compose-cli-1.0.31-docker-dev-fix-perf-reg-buildx-0.10.4` | 65.6 ± 0.9 | 64.6 | 67.0 | 1.01 ± 0.01 |
| `compose-cli-1.0.31-docker-dev-fix-racy-help-buildx-0.10.4` | 64.9 ± 0.4 | 64.2 | 65.3 | 1.00 |

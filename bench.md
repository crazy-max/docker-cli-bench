## `docker --version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `docker-20.10.12` | 19.8 ± 1.4 | 18.7 | 22.2 | 2.05 ± 0.61 |
| `docker-20.10.17` | 19.7 ± 0.8 | 18.8 | 20.9 | 2.03 ± 0.59 |
| `docker-20.10.23` | 15.1 ± 2.3 | 13.3 | 18.7 | 1.56 ± 0.51 |
| `docker-23.0.1` | 92.7 ± 1.4 | 91.2 | 94.9 | 9.60 ± 2.77 |
| `docker-dev-pr-3419-a4b6fe1` | 17.7 ± 1.8 | 16.2 | 20.6 | 1.83 ± 0.56 |
| `docker-dev-pr-3429-a09e61a` | 94.4 ± 0.7 | 93.4 | 95.1 | 9.77 ± 2.81 |
| `docker-dev-pr-3635-84b86e2` | 95.4 ± 1.5 | 93.9 | 97.7 | 9.88 ± 2.85 |
| `docker-dev-pr-3640-c59773f` | 94.7 ± 0.4 | 94.2 | 95.3 | 9.81 ± 2.82 |
| `docker-dev-pr-3713-f1615fa` | 95.1 ± 1.1 | 93.4 | 96.5 | 9.84 ± 2.83 |
| `docker-dev-pr-4114-f5d698a` | 92.2 ± 0.6 | 91.7 | 93.1 | 9.55 ± 2.75 |
| `docker-dev-rm-plugins-completion` | 9.7 ± 2.8 | 7.5 | 14.0 | 1.00 |
| `docker-dev-fix-perf-reg` | 38.5 ± 0.8 | 37.4 | 39.2 | 3.98 ± 1.15 |
| `docker-dev-fix-perf-reg-2` | 9.9 ± 2.4 | 7.8 | 13.7 | 1.03 ± 0.39 |

## `buildx version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `buildx-0.10.4` | 14.2 ± 0.5 | 13.8 | 14.8 | 1.00 |

## `docker buildx version`

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `docker-20.10.12-buildx-0.10.4` | 48.3 ± 0.3 | 48.0 | 48.8 | 1.36 ± 0.02 |
| `docker-20.10.17-buildx-0.10.4` | 48.6 ± 0.7 | 48.1 | 49.7 | 1.37 ± 0.03 |
| `docker-20.10.23-buildx-0.10.4` | 42.8 ± 0.4 | 42.5 | 43.4 | 1.20 ± 0.02 |
| `docker-23.0.1-buildx-0.10.4` | 121.4 ± 0.9 | 120.6 | 122.9 | 3.42 ± 0.06 |
| `docker-dev-pr-3419-a4b6fe1-buildx-0.10.4` | 46.8 ± 0.9 | 45.8 | 47.7 | 1.32 ± 0.03 |
| `docker-dev-pr-3429-a09e61a-buildx-0.10.4` | 124.7 ± 1.6 | 122.9 | 127.1 | 3.51 ± 0.07 |
| `docker-dev-pr-3635-84b86e2-buildx-0.10.4` | 123.9 ± 0.8 | 123.2 | 125.0 | 3.49 ± 0.05 |
| `docker-dev-pr-3640-c59773f-buildx-0.10.4` | 124.8 ± 3.1 | 122.5 | 130.2 | 3.51 ± 0.10 |
| `docker-dev-pr-3713-f1615fa-buildx-0.10.4` | 124.3 ± 1.1 | 122.6 | 125.8 | 3.50 ± 0.06 |
| `docker-dev-pr-4114-f5d698a-buildx-0.10.4` | 121.3 ± 0.6 | 120.3 | 122.0 | 3.41 ± 0.05 |
| `docker-dev-rm-plugins-completion-buildx-0.10.4` | 37.2 ± 0.2 | 37.0 | 37.5 | 1.05 ± 0.02 |
| `docker-dev-fix-perf-reg-buildx-0.10.4` | 65.1 ± 1.0 | 64.0 | 66.6 | 1.83 ± 0.04 |
| `docker-dev-fix-perf-reg-2-buildx-0.10.4` | 35.5 ± 0.5 | 35.1 | 36.4 | 1.00 |

## `docker buildx version` (through compose-cli)

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `compose-cli-1.0.31-docker-20.10.12-buildx-0.10.4` | 75.3 ± 0.4 | 74.8 | 75.7 | 1.17 ± 0.02 |
| `compose-cli-1.0.31-docker-20.10.17-buildx-0.10.4` | 76.5 ± 1.6 | 75.0 | 79.1 | 1.19 ± 0.03 |
| `compose-cli-1.0.31-docker-20.10.23-buildx-0.10.4` | 70.2 ± 0.6 | 69.5 | 70.7 | 1.09 ± 0.02 |
| `compose-cli-1.0.31-docker-23.0.1-buildx-0.10.4` | 146.6 ± 0.6 | 146.0 | 147.4 | 2.28 ± 0.05 |
| `compose-cli-1.0.31-docker-dev-pr-3419-a4b6fe1-buildx-0.10.4` | 74.9 ± 1.3 | 73.5 | 76.8 | 1.16 ± 0.03 |
| `compose-cli-1.0.31-docker-dev-pr-3429-a09e61a-buildx-0.10.4` | 151.8 ± 1.3 | 150.4 | 153.5 | 2.36 ± 0.05 |
| `compose-cli-1.0.31-docker-dev-pr-3635-84b86e2-buildx-0.10.4` | 152.7 ± 0.8 | 151.9 | 153.6 | 2.37 ± 0.05 |
| `compose-cli-1.0.31-docker-dev-pr-3640-c59773f-buildx-0.10.4` | 151.8 ± 1.2 | 149.9 | 152.8 | 2.36 ± 0.05 |
| `compose-cli-1.0.31-docker-dev-pr-3713-f1615fa-buildx-0.10.4` | 151.0 ± 0.7 | 150.0 | 151.8 | 2.35 ± 0.05 |
| `compose-cli-1.0.31-docker-dev-pr-4114-f5d698a-buildx-0.10.4` | 148.3 ± 0.9 | 147.3 | 149.6 | 2.30 ± 0.05 |
| `compose-cli-1.0.31-docker-dev-rm-plugins-completion-buildx-0.10.4` | 64.4 ± 1.3 | 63.7 | 66.6 | 1.00 |
| `compose-cli-1.0.31-docker-dev-fix-perf-reg-buildx-0.10.4` | 94.4 ± 1.3 | 93.3 | 96.4 | 1.47 ± 0.03 |
| `compose-cli-1.0.31-docker-dev-fix-perf-reg-2-buildx-0.10.4` | 64.6 ± 1.0 | 63.9 | 66.0 | 1.00 ± 0.02 |

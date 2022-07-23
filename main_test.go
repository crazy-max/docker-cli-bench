package main

import (
	"bytes"
	"errors"
	"io/ioutil"
	"os"
	"os/exec"
	"path"
	"path/filepath"
	"testing"
)

func BenchmarkCliVersion(b *testing.B) {
	cfs, _ := ioutil.ReadDir("fixtures")
	for _, tt := range cfs {
		tt := tt
		b.Run(tt.Name(), func(b *testing.B) {
			dockerCli, err := dockerCliPath(tt.Name())
			if err != nil {
				b.Fatal(err)
			}
			for i := 0; i < b.N; i++ {
				cmd := exec.Command(dockerCli, "version")
				var stdout bytes.Buffer
				cmd.Stdout = &stdout
				_ = cmd.Run()
			}
		})
	}
}

func BenchmarkBuildxVersion(b *testing.B) {
	cfs, _ := ioutil.ReadDir("fixtures")
	buildxfs, _ := ioutil.ReadDir("fixtures-buildx")
	homedir, err := os.UserHomeDir()
	if err != nil {
		b.Fatal(err)
	}
	cliPluginsPath := filepath.Join(homedir, ".docker", "cli-plugins")
	if _, err = os.Stat(cliPluginsPath); errors.Is(err, os.ErrNotExist) {
		if err = os.MkdirAll(cliPluginsPath, 0755); err != nil {
			b.Fatal(err)
		}
	}
	buildxPluginPath := filepath.Join(cliPluginsPath, "docker-buildx")
	if _, err = os.Stat(buildxPluginPath); err == nil {
		if err = os.Rename(buildxPluginPath, buildxPluginPath+".bak"); err != nil {
			b.Fatal(err)
		}
		defer func() {
			if err = os.Rename(buildxPluginPath+".bak", buildxPluginPath); err != nil {
				b.Fatal(err)
			}
		}()
	}
	for _, tt1 := range buildxfs {
		tt1 := tt1
		buildx, err := buildxPath(tt1.Name())
		if err != nil {
			b.Fatal(err)
		}
		if _, err := os.Lstat(buildxPluginPath); err == nil {
			if err := os.Remove(buildxPluginPath); err != nil {
				b.Fatal(err)
			}
		}
		if err := os.Symlink(buildx, buildxPluginPath); err != nil {
			b.Fatal(err)
		}
		for _, tt := range cfs {
			tt := tt
			b.Run(tt1.Name()+"-"+tt.Name(), func(b *testing.B) {
				dockerCli, err := dockerCliPath(tt.Name())
				if err != nil {
					b.Fatal(err)
				}
				for i := 0; i < b.N; i++ {
					cmd := exec.Command(dockerCli, "buildx", "version")
					var stdout bytes.Buffer
					cmd.Stdout = &stdout
					if err := cmd.Run(); err != nil {
						b.Fatal(err)
					}
				}
			})
		}
	}
}

func BenchmarkBuildxVersionStandalone(b *testing.B) {
	cfs, _ := ioutil.ReadDir("fixtures-buildx")
	for _, tt := range cfs {
		tt := tt
		b.Run(tt.Name(), func(b *testing.B) {
			buildx, err := buildxPath(tt.Name())
			if err != nil {
				b.Fatal(err)
			}
			for i := 0; i < b.N; i++ {
				cmd := exec.Command(buildx, "version")
				var stdout bytes.Buffer
				cmd.Stdout = &stdout
				_ = cmd.Run()
			}
		})
	}
}

func BenchmarkCliVersionViaComposeCli(b *testing.B) {
	cfs, _ := ioutil.ReadDir("fixtures")
	cclifs, _ := ioutil.ReadDir("fixtures-compose-cli")
	for _, tt1 := range cclifs {
		tt1 := tt1
		composeCli, err := composeCliPath(tt1.Name())
		if err != nil {
			b.Fatal(err)
		}
		for _, tt := range cfs {
			tt := tt
			b.Run(tt1.Name()+"-"+tt.Name(), func(b *testing.B) {
				dockerCli, err := dockerCliPath(tt.Name())
				if err != nil {
					b.Fatal(err)
				}
				for i := 0; i < b.N; i++ {
					cmd := exec.Command(composeCli, "version")
					cmd.Env = append(os.Environ(), "DOCKER_COM_DOCKER_CLI="+dockerCli)
					var stdout bytes.Buffer
					cmd.Stdout = &stdout
					if err := cmd.Run(); err != nil {
						b.Error(err)
					}
				}
			})
		}
	}
}

func BenchmarkBuildxVersionViaComposeCli(b *testing.B) {
	cfs, _ := ioutil.ReadDir("fixtures")
	cclifs, _ := ioutil.ReadDir("fixtures-compose-cli")
	buildxfs, _ := ioutil.ReadDir("fixtures-buildx")
	homedir, err := os.UserHomeDir()
	if err != nil {
		b.Fatal(err)
	}
	cliPluginsPath := filepath.Join(homedir, ".docker", "cli-plugins")
	if _, err = os.Stat(cliPluginsPath); errors.Is(err, os.ErrNotExist) {
		if err = os.MkdirAll(cliPluginsPath, 0755); err != nil {
			b.Fatal(err)
		}
	}
	buildxPluginPath := filepath.Join(cliPluginsPath, "docker-buildx")
	if _, err = os.Stat(buildxPluginPath); err == nil {
		if err = os.Rename(buildxPluginPath, buildxPluginPath+".bak"); err != nil {
			b.Fatal(err)
		}
		defer func() {
			if err = os.Rename(buildxPluginPath+".bak", buildxPluginPath); err != nil {
				b.Fatal(err)
			}
		}()
	}
	for _, tt0 := range buildxfs {
		buildx, err := buildxPath(tt0.Name())
		if err != nil {
			b.Fatal(err)
		}
		if _, err := os.Lstat(buildxPluginPath); err == nil {
			if err := os.Remove(buildxPluginPath); err != nil {
				b.Fatal(err)
			}
		}
		if err := os.Symlink(buildx, buildxPluginPath); err != nil {
			b.Fatal(err)
		}
		for _, tt1 := range cclifs {
			tt1 := tt1
			composeCli, err := composeCliPath(tt1.Name())
			if err != nil {
				b.Fatal(err)
			}
			for _, tt := range cfs {
				tt := tt
				b.Run(tt0.Name()+"-"+tt1.Name()+"-"+tt.Name(), func(b *testing.B) {
					dockerCli, err := dockerCliPath(tt.Name())
					if err != nil {
						b.Fatal(err)
					}
					for i := 0; i < b.N; i++ {
						cmd := exec.Command(composeCli, "buildx", "version")
						cmd.Env = append(os.Environ(), "DOCKER_COM_DOCKER_CLI="+dockerCli)
						var stdout bytes.Buffer
						cmd.Stdout = &stdout
						if err := cmd.Run(); err != nil {
							b.Error(err)
						}
					}
				})
			}
		}
	}
}

func dockerCliPath(bin string) (string, error) {
	return filepath.Abs(filepath.Clean(path.Join("./fixtures", bin)))
}

func composeCliPath(bin string) (string, error) {
	return filepath.Abs(filepath.Clean(path.Join("./fixtures-compose-cli", bin)))
}

func buildxPath(bin string) (string, error) {
	return filepath.Abs(filepath.Clean(path.Join("./fixtures-buildx", bin)))
}

package main

import (
	"bytes"
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
	for _, tt := range cfs {
		tt := tt
		b.Run(tt.Name(), func(b *testing.B) {
			dockerCli, err := dockerCliPath(tt.Name())
			if err != nil {
				b.Fatal(err)
			}
			for i := 0; i < b.N; i++ {
				cmd := exec.Command(dockerCli, "buildx", "version")
				var stdout bytes.Buffer
				cmd.Stdout = &stdout
				_ = cmd.Run()
			}
		})
	}
}

func BenchmarkCliVersionViaComposeCli(b *testing.B) {
	composeCli, err := composeCliPath()
	if err != nil {
		b.Fatal(err)
	}
	cfs, _ := ioutil.ReadDir("fixtures")
	for _, tt := range cfs {
		tt := tt
		b.Run(tt.Name(), func(b *testing.B) {
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

func BenchmarkBuildxVersionViaComposeCli(b *testing.B) {
	composeCli, err := composeCliPath()
	if err != nil {
		b.Fatal(err)
	}
	cfs, _ := ioutil.ReadDir("fixtures")
	for _, tt := range cfs {
		tt := tt
		b.Run(tt.Name(), func(b *testing.B) {
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

func composeCliPath() (string, error) {
	return filepath.Abs(filepath.Clean("./compose-cli"))
}

func dockerCliPath(bin string) (string, error) {
	return filepath.Abs(filepath.Clean(path.Join("./fixtures", bin)))
}

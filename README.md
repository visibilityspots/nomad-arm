# Nomad ARM build

 [![build status](https://github.com/visibilityspots/nomad-arm/actions/workflows/build.yml/badge.svg)](https://github.com/visibilityspots/nomad-arm/actions/workflows/build.yml)
 [![gitHub release](https://img.shields.io/github/v/release/visibilityspots/nomad-arm)](https://github.com/visibilityspots/nomad-arm/releases)

since [nomad](https://www.nomadproject.io/) version 1.8.3 hashicorp isn't providing ARM based binaries anymore. Which is unfortunate especially since I [builded](https://visibilityspots.org/nomad-arm-cluster.html) a nomad cluster with some raspberry pi's..

to be able to maintain my cluster with future releases I've created this repository which will build and release an ARM binary so I can keep upgrading my cluster using some custom ansible playbooks I wrote over the years.

### buildx

```
$ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
$ docker buildx build -t visibilityspots/nomad:v1.8.3 --platform linux/amd64,linux/arm/v6,linux/arm/v7 --output binaries .
```


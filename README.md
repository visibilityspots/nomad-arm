# Nomad ARM build

 [![build status](https://github.com/visibilityspots/nomad-arm/actions/workflows/build.yaml/badge.svg)](https://github.com/visibilityspots/nomad-arm/actions/workflows/build.yaml)
 [![gitHub release](https://img.shields.io/github/v/release/visibilityspots/nomad-arm)](https://github.com/visibilityspots/nomad-arm/releases)

since [nomad]() version 1.8.3 hashicorp isn't providing ARM based binaries anymore. Which is unfortunate especially since I [build](https://visibilityspots.org/nomad-arm-cluster.html) a nomad cluster with some raspberry pi's..

to be able to maintain my cluster with future releases I've created this repository which will build and release an ARM binary so I can keep upgrading my cluster using some custom ansible playbooks I wrote over the years.

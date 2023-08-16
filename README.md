---
name: Dockle plugin for Woodpecker-CI
authors: EuryeceTelecom
description: Scan containers with dockle
tags: [check, security, dockle, vulnerabilities, misconfigurations, secrets]
containerImage: euryecetelecom/woodpeckerci-dockle
containerImageUrl: https://hub.docker.com/r/euryecetelecom/woodpeckerci-dockle
url: https://github.com/euryecetelecom/woodpeckerci-dockle
---


# Dockle plugin for Woodpecker-CI

Woodpecker-CI plugin to scan containers with dockle (Container Image Linter for Security, Helping build the Best-Practice Docker Image) https://github.com/goodwithtech/dockle.


## Settings

| Settings Name             | Default               | Description
| --------------------------| --------------------- | --------------------------------------------
| `exit-code`               | `1`                   | If an issue is detected let the step fail
| `exit-level`              | `warn`                | Define alert levels (can be info, warn or fatal)
| `build-directory`         | `${CI_WORKSPACE}`     | Directory containing the Dockerfile to use to build the container
| `dockerfile`              | `Dockerfile`          | Dockerfile to use
| `dockle-ignores`          | *none*                | Dockle rules to ignore (cf https://github.com/goodwithtech/dockle/blob/master/CHECKPOINT.md)


## Usage

This container require privilegied capabilities to communicate with host docker daemon, like woodpeckerci/plugin-docker-buildx. Ensure the project configuration takes it in account (verified has to be enabled).

### Simple usage:

```yml
pipeline:
  dockle_check:
    image: euryecetelecom/woodpeckerci-dockle
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

### Advanced usage:

```yml
pipeline:
  dockle_check:
    image: euryecetelecom/woodpeckerci-dockle
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    settings:
      dockerfile: MyCustomDockerfile
      build-directory: ./docker
      exit-code: 0
      exit-level: info
      dockle-ignores: CIS-DI-0001,DKL-DI-0006
```

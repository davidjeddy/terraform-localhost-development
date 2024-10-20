# terraform-localhost-development

## Badges

Build Status, Code Coverage, PR stats/time frame, Project status, etc.

## Description

Tired of changing the `source` of deployment modules when doing development with published modules? This project acts as a proxy of the remote IaC registry to the localhost file system.

## Functionality

Host a private local IaC module registry to enable easier module development.

## Request Flow

- IaC Binary (Terraform/OpenTofu) -> localhost DNS resolution -> /etc/hosts -> localhost registry

## Table of Contents

- [terraform-localhost-development](#terraform-localhost-development)
  - [Badges](#badges)
  - [Description](#description)
  - [Functionality](#functionality)
  - [Request Flow](#request-flow)
  - [Table of Contents](#table-of-contents)
  - [Contributing](#contributing)
    - [Code of Conduct](#code-of-conduct)
    - [Contributing Guidelines](#contributing-guidelines)
    - [Development Documentation](#development-documentation)
  - [Requirements](#requirements)
  - [Containerized](#containerized)
  - [Non-containerized](#non-containerized)
  - [Process](#process)
  - [How to](#how-to)
    - [Obtain](#obtain)
    - [Configure](#configure)
    - [Run](#run)
    - [Stop](#stop)
  - [Versioning](#versioning)
  - [Contributors](#contributors)
  - [Additional Information](#additional-information)

## Contributing

### Code of Conduct

Please see [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md).

### Contributing Guidelines

Please see [CONTRIBUTING_GUIDELINES.md](./CONTRIBUTING_GUIDELINES.md).

### Development Documentation

Please see [DEVELOPMENT.md](./DEVELOPMENT.md).

## Requirements

## Containerized

## Non-containerized

- [POSIX](https://en.wikipedia.org/wiki/POSIX) terminal
- `sudo` privilege on a localhost
  - MacOS will also require permissions to change system security settings
- Internet access (for initial install only)
- [Git](https://git-scm.com/)
- [OCI Container compatible runtime](https://opencontainers.org/) ([containerd](https://containerd.io/), [Docker](https://www.docker.com/), [Podman](https://podman.io/), etc)
  - Note: Helper scripts use [Podman](https://podman.io/)
  - Node / NPM for TLS validation web server
- IaC tool ([Terraform](https://www.terraform.io/)/[OpenTofu](https://opentofu.org/))

## Process

- `./libs/bash/install.sh`
- Edit `./libs/bash/config.sh`
- `./libs/bash/build.sh`
- `./libs/bash/start.sh`

- `./libs/bash/stop.sh`

## How to

### Obtain

```sh
git clone https://github.com/davidjeddy/terraform-localhost-development.git
```

### Configure

```sh
# using podman here, but any OCI process should be compatible
podman run ...
```

### Run

Create local self signed TLS certificate using mkcert

```sh
```

Launch the proxy service via container command, using podman here, but any OCI process should be compatible.

```sh
podman 
```

### Stop

```sh
./libs/bash/stop.sh
```

## Versioning

This project follows [SemVer 2.0](https://semver.org/).

```quote
Given a version number MAJOR.MINOR.PATCH, increment the:

1. MAJOR version when you make incompatible API changes,
2. MINOR version when you add functionality in a backwards compatible manner, and
3. PATCH version when you make backwards compatible bug fixes.

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.
```

## Contributors

## Additional Information

- Adding visual aids to any / all the above sections above is recommended.
- [Contributes](##Contributors) sources from [all-contributors](https://github.com/all-contributors/all-contributors).
- [ROADMAP](./ROADMAP.md) example from [all-contributors/all-contributors](https://github.com/all-contributors/all-contributors/blob/master/MAINTAINERS.md).
- Based on [README Maturity Model](https://github.com/LappleApple/feedmereadmes/blob/master/README-maturity-model.md); strive for a Level 5 `Product-oriented README`.
- This Code of Conduct is adapted from the [Contributor Covenant](https://www.contributor-covenant.org), version 2.0, available at https://www.contributor-covenant.org/version/2/0/code_of_conduct.html.
- [CONTRIBUTING.md](./CONTRIBUTING.md) is based on the [Ruby on Rails Contributing](https://github.com/rails/rails/blob/master/CONTRIBUTING.md) document, credit is due to them.
- [LICENSE](./LICENSE.md) sources from:
  - [https://choosealicense.com](https://choosealicense.com)
  - [https://en.wikipedia.org/wiki/All_rights_reserved](https://en.wikipedia.org/wiki/All_rights_reserved)
- [SECURITY.md](./SECURITY.md) based from [ISARA Radiate Security Solution Suite 2.0 Security Issues](https://github.com/isaracorp/Toolkit-Samples/edit/master/SECURITY.md).

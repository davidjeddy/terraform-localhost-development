# ROADMAP

Documentation or Link to resources that contain the production planning with future release and changes accessible.

- GitHub Issues
- [GitLab Project Roadmap](https://docs.gitlab.com/ee/user/group/roadmap/)
- [..or other popular Product Roadmap resources](https://www.actitime.com/project-management/roadmap-software/)

## Road to One-Oh

- [ ] [Support all module source types](https://developer.hashicorp.com/terraform/language/modules/sources):
  - [ ] Local paths - ok, this one is not needed :)
  - [ ] Terraform Registry
  - [ ] Git, GitHub, and Bitbucket
  - [ ] Mercurial repositories
  - [ ] HTTP URLs
  - [ ] S3 buckets
  - [ ] GCS buckets
  - [ ] Modules in Package Sub-directories
- [X] Use git sub-module for Citizen version control
- [ ] Convert node and citizen to containerized services
- [ ] Generate markdown from README.adoc to README.md as part of a release build
  - [ ] ./github/release.yaml
  - [ ] [pandoc](https://github.com/jgm/pandoc)

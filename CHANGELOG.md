
<a name="unreleased"></a>
## [Unreleased]

<a name="v11.3.0"></a>
## [v11.3.0] - 2025-10-06
### 🔧 Maintenance
- [cc763f2](https://github.com/devopsmakers/terraform-aws-eks/commit/cc763f2) default true for deletion protection ([#9](https://github.com/devopsmakers/terraform-aws-eks/issues/9))
- [4449c6a](https://github.com/devopsmakers/terraform-aws-eks/commit/4449c6a) add deletion_protection ([#8](https://github.com/devopsmakers/terraform-aws-eks/issues/8))


<a name="v11.2.3"></a>
## [v11.2.3] - 2025-03-27
### 🔧 Maintenance
- [e87a9e7](https://github.com/devopsmakers/terraform-aws-eks/commit/e87a9e7) change log_group name back to cluster ([#7](https://github.com/devopsmakers/terraform-aws-eks/issues/7))
- **release:** [7c944c2](https://github.com/devopsmakers/terraform-aws-eks/commit/7c944c2) Update changelog for v11.2.3


<a name="v11.2.2"></a>
## [v11.2.2] - 2025-03-26
### ✨ Features
- [5cff1d3](https://github.com/devopsmakers/terraform-aws-eks/commit/5cff1d3) support log_group_class - BOS-3058 ([#6](https://github.com/devopsmakers/terraform-aws-eks/issues/6))

### 🔧 Maintenance
- **release:** [c57d6d0](https://github.com/devopsmakers/terraform-aws-eks/commit/c57d6d0) Update changelog for v11.2.2


<a name="v11.2.1"></a>
## [v11.2.1] - 2022-09-07
### 🔧 Maintenance
- [71f596a](https://github.com/devopsmakers/terraform-aws-eks/commit/71f596a) update kubeconfig to current apiversion
- **release:** [0efd9f2](https://github.com/devopsmakers/terraform-aws-eks/commit/0efd9f2) Update changelog for v11.2.1


<a name="v11.2.0"></a>
## [v11.2.0] - 2022-07-29
### 🐛 Bug Fixes
- [d9bc92c](https://github.com/devopsmakers/terraform-aws-eks/commit/d9bc92c) replace deprecated data.template_file with templatefile function BOS-1567 ([#4](https://github.com/devopsmakers/terraform-aws-eks/issues/4))

### 🔧 Maintenance
- **release:** [9a8d031](https://github.com/devopsmakers/terraform-aws-eks/commit/9a8d031) Update changelog for v11.2.0


<a name="v11.1.0"></a>
## [v11.1.0] - 2022-05-27
### ✨ Features
- [cbde2e7](https://github.com/devopsmakers/terraform-aws-eks/commit/cbde2e7) use aws instead of aws-iam-authenticator and simplify BOS-1154

### 🔧 Maintenance
- [3b0cef8](https://github.com/devopsmakers/terraform-aws-eks/commit/3b0cef8) Use new version of auth (old one no longer works
- **release:** [25eec11](https://github.com/devopsmakers/terraform-aws-eks/commit/25eec11) Update changelog for v11.1.0


<a name="v11.0.1"></a>
## [v11.0.1] - 2021-08-11
### 🔧 Maintenance
- [b5d8e49](https://github.com/devopsmakers/terraform-aws-eks/commit/b5d8e49) Bump to allow terraform 1.0.X
- **release:** [39a322a](https://github.com/devopsmakers/terraform-aws-eks/commit/39a322a) Update changelog for v11.0.1


<a name="v11.0.0"></a>
## [v11.0.0] - 2021-02-15
### ✨ Features
- [626b4ef](https://github.com/devopsmakers/terraform-aws-eks/commit/626b4ef) remove automatic ASG replacement and support for name overrides

### 🔧 Maintenance
- **release:** [d1e8c08](https://github.com/devopsmakers/terraform-aws-eks/commit/d1e8c08) Update changelog for v11.0.0


<a name="v10.2.3"></a>
## [v10.2.3] - 2020-05-18
### 🐛 Bug Fixes
- [377e8a5](https://github.com/devopsmakers/terraform-aws-eks/commit/377e8a5) issue with placement groups ([#5](https://github.com/devopsmakers/terraform-aws-eks/issues/5))

### 🔧 Maintenance
- **release:** [dee493a](https://github.com/devopsmakers/terraform-aws-eks/commit/dee493a) Update changelog for v10.2.3


<a name="v10.2.2"></a>
## [v10.2.2] - 2020-05-05
### 🐛 Bug Fixes
- [5000dda](https://github.com/devopsmakers/terraform-aws-eks/commit/5000dda) iam_instance_profile_name empty when manage_worker_iam_resources=false
- **worker_groups:** [c1ae5c1](https://github.com/devopsmakers/terraform-aws-eks/commit/c1ae5c1) index error when create_eks is false ([#3](https://github.com/devopsmakers/terraform-aws-eks/issues/3))

### 🔧 Maintenance
- **release:** [a5be1d5](https://github.com/devopsmakers/terraform-aws-eks/commit/a5be1d5) Update changelog for v10.2.2


<a name="v10.2.1"></a>
## [v10.2.1] - 2020-03-12
### 🐛 Bug Fixes
- [3f81efb](https://github.com/devopsmakers/terraform-aws-eks/commit/3f81efb) Add missing security group rule to allow workers to communicate with the cluster API

### 🔧 Maintenance
- **release:** [a0fcf8a](https://github.com/devopsmakers/terraform-aws-eks/commit/a0fcf8a) Update changelog for v10.2.1


<a name="v10.2.0"></a>
## [v10.2.0] - 2020-03-12
### 🐛 Bug Fixes
- [7491eb9](https://github.com/devopsmakers/terraform-aws-eks/commit/7491eb9) worker group security group id output

### 🔧 Maintenance
- **release:** [919c4a0](https://github.com/devopsmakers/terraform-aws-eks/commit/919c4a0) Update changelog for v10.2.0


<a name="v10.1.1"></a>
## [v10.1.1] - 2020-03-11
### 🐛 Bug Fixes
- [19f40b1](https://github.com/devopsmakers/terraform-aws-eks/commit/19f40b1) Use cluster_name rather than cluster_endpoint for consistency

### 🔧 Maintenance
- **release:** [a697d89](https://github.com/devopsmakers/terraform-aws-eks/commit/a697d89) Update changelog for v10.1.1


<a name="v10.1.0"></a>
## [v10.1.0] - 2020-03-11
### ✨ Features
- [7b2d414](https://github.com/devopsmakers/terraform-aws-eks/commit/7b2d414) Add encryption_config capabilities, default to EKS v1.15

### 🔧 Maintenance
- **release:** [fff4f90](https://github.com/devopsmakers/terraform-aws-eks/commit/fff4f90) Update changelog for v10.1.0


<a name="v10.0.3"></a>
## [v10.0.3] - 2020-03-11
### 🐛 Bug Fixes
- [ae728e4](https://github.com/devopsmakers/terraform-aws-eks/commit/ae728e4) Pass in cluster_endpoint

### 🔧 Maintenance
- **release:** [5a8de60](https://github.com/devopsmakers/terraform-aws-eks/commit/5a8de60) Update changelog for v10.0.3


<a name="v10.0.2"></a>
## [v10.0.2] - 2020-03-11
### 🐛 Bug Fixes
- [addaae3](https://github.com/devopsmakers/terraform-aws-eks/commit/addaae3) Pass wait_for_cluster_cmd from parent module

### 🔧 Maintenance
- **release:** [4a6bfcf](https://github.com/devopsmakers/terraform-aws-eks/commit/4a6bfcf) Update changelog for v10.0.2


<a name="v10.0.1"></a>
## [v10.0.1] - 2020-03-11
### 🐛 Bug Fixes
- [d856d03](https://github.com/devopsmakers/terraform-aws-eks/commit/d856d03) Add wait_for_cluster to aws_auth module

### 🔧 Maintenance
- **release:** [83a62c8](https://github.com/devopsmakers/terraform-aws-eks/commit/83a62c8) Update changelog for v10.0.1


<a name="v10.0.0"></a>
## [v10.0.0] - 2020-03-10
### ✨ Features
- [1db1d2a](https://github.com/devopsmakers/terraform-aws-eks/commit/1db1d2a) Add worker groups submodules
- [392ecfd](https://github.com/devopsmakers/terraform-aws-eks/commit/392ecfd) Enable management of the aws-auth ConfigMap as a module
- **control_plane:** [f1ca63c](https://github.com/devopsmakers/terraform-aws-eks/commit/f1ca63c) Move control plane related resources to their own submodule

### 🐛 Bug Fixes
- [bb9874b](https://github.com/devopsmakers/terraform-aws-eks/commit/bb9874b) Take ami id into account for random_pet keeper
- **kubeconfig:** [2838035](https://github.com/devopsmakers/terraform-aws-eks/commit/2838035) Set sensible file and directory permissions on kubeconfig file

### 🔧 Maintenance
- [f2a4434](https://github.com/devopsmakers/terraform-aws-eks/commit/f2a4434) Add initial submodule files
- [05b7d54](https://github.com/devopsmakers/terraform-aws-eks/commit/05b7d54) Update README with intention
- **release:** [ef0cbc4](https://github.com/devopsmakers/terraform-aws-eks/commit/ef0cbc4) Update changelog for v10.0.0
- **release:** [df29db6](https://github.com/devopsmakers/terraform-aws-eks/commit/df29db6) Update changelog for v10.0.0
- **release:** [565ab90](https://github.com/devopsmakers/terraform-aws-eks/commit/565ab90) Update changelog for v9.0.2


<a name="v9.1.0"></a>
## v9.1.0 - 2020-03-06
### 🔧 Maintenance
- [6338f6d](https://github.com/devopsmakers/terraform-aws-eks/commit/6338f6d) Initial commit


[Unreleased]: https://github.com/devopsmakers/terraform-aws-eks/compare/v11.3.0...HEAD
[v11.3.0]: https://github.com/devopsmakers/terraform-aws-eks/compare/v11.2.3...v11.3.0
[v11.2.3]: https://github.com/devopsmakers/terraform-aws-eks/compare/v11.2.2...v11.2.3
[v11.2.2]: https://github.com/devopsmakers/terraform-aws-eks/compare/v11.2.1...v11.2.2
[v11.2.1]: https://github.com/devopsmakers/terraform-aws-eks/compare/v11.2.0...v11.2.1
[v11.2.0]: https://github.com/devopsmakers/terraform-aws-eks/compare/v11.1.0...v11.2.0
[v11.1.0]: https://github.com/devopsmakers/terraform-aws-eks/compare/v11.0.1...v11.1.0
[v11.0.1]: https://github.com/devopsmakers/terraform-aws-eks/compare/v11.0.0...v11.0.1
[v11.0.0]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.2.3...v11.0.0
[v10.2.3]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.2.2...v10.2.3
[v10.2.2]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.2.1...v10.2.2
[v10.2.1]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.2.0...v10.2.1
[v10.2.0]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.1.1...v10.2.0
[v10.1.1]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.1.0...v10.1.1
[v10.1.0]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.0.3...v10.1.0
[v10.0.3]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.0.2...v10.0.3
[v10.0.2]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.0.1...v10.0.2
[v10.0.1]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.0.0...v10.0.1
[v10.0.0]: https://github.com/devopsmakers/terraform-aws-eks/compare/v9.1.0...v10.0.0

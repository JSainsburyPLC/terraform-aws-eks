
<a name="unreleased"></a>
## [Unreleased]

<a name="v10.2.0"></a>
## [v10.2.0] - 2020-03-12
### 🐛 Bug Fixes
- [7491eb9](https://github.com/devopsmakers/terraform-aws-eks/commit/7491eb9) worker group security group id output


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


[Unreleased]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.2.0...HEAD
[v10.2.0]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.1.1...v10.2.0
[v10.1.1]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.1.0...v10.1.1
[v10.1.0]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.0.3...v10.1.0
[v10.0.3]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.0.2...v10.0.3
[v10.0.2]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.0.1...v10.0.2
[v10.0.1]: https://github.com/devopsmakers/terraform-aws-eks/compare/v10.0.0...v10.0.1
[v10.0.0]: https://github.com/devopsmakers/terraform-aws-eks/compare/v9.1.0...v10.0.0

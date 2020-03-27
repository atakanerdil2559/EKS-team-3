data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}
  
data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}


provider "kubernetes" {
  host = data.aws_eks_cluster.cluster.endpoint 
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token = data.aws_eks_cluster_auth.cluster.token
  load_config_file = false
  version = "~> 1.9"
} 

module "my-cluster" {
  source = "terraform-aws-modules/eks/aws"
  cluster_name = var.cluster_name
  cluster_version = var.cluster_version 
  subnets = [
     data.terraform_remote_state.dev.Private_Subnet1,
     data.terraform_remote_state.dev.Private_Subnet2,
     data.terraform_remote_state.dev.Private_Subnet3
    ]
  vpc_id = var.vpc_id
  worker_groups = [{
    instance_type = var.instance_type 
    asg_max_size = var.asg_max_size 
    asg_min_size = var.asg_min_size
    asg_desired_capacity = var.asg_desired_capacity
       }
    ] 
  }

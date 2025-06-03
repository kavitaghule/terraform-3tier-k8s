module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = var.private_subnets
  vpc_id          = var.vpc_id

  eks_managed_node_groups = {
    default = {
      desired_capacity = var.node_desired_capacity
      max_capacity     = var.node_max_capacity
      min_capacity     = var.node_min_capacity
      instance_types   = var.node_instance_types
      disk_size        = var.node_disk_size
    }
  }

  map_roles = var.map_roles
  map_users = var.map_users

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.29"
}

variable "vpc_id" {
  description = "VPC ID where EKS cluster will be deployed"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for EKS nodes"
  type        = list(string)
}

variable "node_desired_capacity" {
  description = "Desired number of nodes in the EKS managed node group"
  type        = number
  default     = 2
}

variable "node_min_capacity" {
  description = "Minimum number of nodes in the EKS managed node group"
  type        = number
  default     = 1
}

variable "node_max_capacity" {
  description = "Maximum number of nodes in the EKS managed node group"
  type        = number
  default     = 3
}

variable "node_instance_types" {
  description = "EC2 instance types for EKS nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_disk_size" {
  description = "Disk size in GB for EKS nodes"
  type        = number
  default     = 20
}

variable "map_roles" {
  description = "IAM roles to map to Kubernetes RBAC"
  type        = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "map_users" {
  description = "IAM users to map to Kubernetes RBAC"
  type        = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "environment" {
  description = "Deployment environment tag"
  type        = string
}

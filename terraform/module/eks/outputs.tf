output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "node_group_role_arn" {
  description = "IAM role ARN for managed node group"
  value       = module.eks.node_groups_iam_role_arns["default"]
}

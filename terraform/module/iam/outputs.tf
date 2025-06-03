output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}

output "jenkins_role_arn" {
  value = aws_iam_role.jenkins_role.arn
}

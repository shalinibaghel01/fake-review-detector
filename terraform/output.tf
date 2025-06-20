
output "cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Kubernetes API Endpoint"
  value       = module.eks.cluster_endpoint
}

output "node_group_role_arn" {
  description = "IAM Role ARN for Node Group"
  value       = module.eks.node_groups["dev"].iam_role_arn
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

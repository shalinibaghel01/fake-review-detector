variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "fake-review-cluster"
}

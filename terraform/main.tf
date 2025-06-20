module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.31.2"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  subnet_ids         = module.vpc.public_subnets         # ✅ Public subnet to allow public IP
  vpc_id             = module.vpc.vpc_id
  enable_irsa        = true

  eks_managed_node_groups = {
    dev = {
      desired_capacity   = 1
      max_capacity       = 1
      min_capacity       = 1

      instance_types     = ["t3.micro"]                 # ✅ Free-tier
      subnet_ids         = module.vpc.public_subnets
      create_public_ip   = true                         # ✅ Public IP for EC2 node

      tags = {
        Name        = "eks-node-dev"
        Environment = "dev"
      }
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

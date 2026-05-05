module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "shoestore-eks"
  cluster_version = "1.30"

  vpc_id = aws_vpc.main.id

  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  eks_managed_node_groups = {
    nodegrp = {
      desired_size   = 2
      min_size       = 1
      max_size       = 3
      instance_types = ["t3.medium"]

      iam_role_additional_policies = {
        admin = "arn:aws:iam::aws:policy/AdministratorAccess"
      }
    }
  }

  enable_cluster_creator_admin_permissions = true
}
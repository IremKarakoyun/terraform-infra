module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "my-vpc"
  cidr = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

output private_subnets {
    value = module.vpc.private_subnets
}

output public_subnets {
    value = module.vpc.public_subnets
}

output vpc_id {
    value = module.vpc.vpc_id
}

output launch_template_arn {
    value = module.vpc.launch_template_arn
}

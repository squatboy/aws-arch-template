terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-2"
  shared_credentials_files = ["{YOUR WORKSPACE}/.aws/credentials"]
  profile = "admin"
}


# Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

#----------------------------------
# subnet
# public
resource "aws_subnet" "pub_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "pub-sbt-a"
  }
}

resource "aws_subnet" "pub_c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "pub-sbt-c"
  }
}

# private
resource "aws_subnet" "pri_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "pri-sbt-a"
  }
}

# db
resource "aws_subnet" "db_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "db-sbt-a"
  }
}

resource "aws_subnet" "db_c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "db-sbt-c"
  }
}

# security_group.tf
resource "aws_security_group" "web" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ec2.tf
resource "aws_instance" "web" {
  vpc_security_group_ids = [aws_security_group.web.id]
  # ... 기존 설정 유지
}
variable "cidr_block" {
  description = "The VPC CIDR Block"
  type        = string
}

variable "resource_prefix" {
  description = "Prefix added to resource names"
  type        = string
}

resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = {
    Name = "${var.resource_prefix}-vpc"
  }
}

resource "aws_subnet" "this" {
  vpc_id = aws_vpc.this.id
  cidr_block = cidrsubnet(
    aws_vpc.this.cidr_block,
    26 - split("/", aws_vpc.this.cidr_block)[1],
    0
  )

  tags = {
    Name = "${var.resource_prefix}-subnet"
  }
}

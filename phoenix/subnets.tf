data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {  
  count = length(data.aws_availability_zones.available.names)
  vpc_id = aws_vpc.primary.id
  cidr_block = "10.100.5${count.index}.0/24"
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name       = "${var.prefix}-${var.env}-public-subnet-${count.index+1}"
    Owner      = var.owner
    CostCenter = "IT"

  }

}

resource "aws_subnet" "bastion" {
  vpc_id = aws_vpc.primary.id
  cidr_block = "10.100.5.0/24"
  tags = {
    Name       = "${var.prefix}-${var.env}-bastion-subnet"
    Owner      = var.owner
    CostCenter = "IT"

  }

}

resource "aws_subnet" "web" {
  vpc_id = aws_vpc.primary.id
  cidr_block = "10.100.15.0/24"
  tags = {
    Name       = "${var.prefix}-${var.env}-web-subnet"
    Owner      = var.owner
    CostCenter = "IT"

  }

}



resource "aws_subnet" "app" {
  vpc_id = aws_vpc.primary.id
  cidr_block = "10.100.25.0/24"
  tags = {
    Name       = "${var.prefix}-${var.env}-app-subnet"
    Owner      = var.owner
    CostCenter = "IT"

  }

}


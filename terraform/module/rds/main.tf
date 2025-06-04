
resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-rds-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name        = "${var.environment}-rds-subnet-group"
    Environment = var.environment
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.environment}-rds-sg"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-rds-sg"
    Environment = var.environment
  }

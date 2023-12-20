variable "db_storage" {
  description = "provide value for db storage"
  type        = number


}

variable "storage_type" {
  description = "provide storagetype value"
  type        = string


}
variable "db_name" {
  description = "db name"
  type        = string


}

variable "engine" {
  description = "db engine"
  type        = string

}

variable "engine_version" {
  description = "db_engine_version"
  type        = string

}

variable "skip_final_snapshot" {
  description = "enable or disable final_snapshot"
  type        = bool

}

variable "instance_class" {
  description = "db_instance_type"
  type        = string

}

variable "username" {
  description = "db_username"
  type        = string

}

variable "password" {
  description = "username password"
  type        = string

}
variable "parameter_group_name" {
  description = "group_name"
  type        = string

}

variable "ami" {
  description = "amazone machine image"
  type        = string

}

variable "instance_type" {
  description = "specific type of instance"
  type        = string

}

variable "availability_zone" {
  description = "choice of availability zone"
  type        = string

}

variable "key_name" {
  description = "main key name"
  type        = string

}
variable "vpc_cidr_block" {
  description = "aws_vpc cidr block"
  type = string
}

variable "priv_subnet_cidr" {
  description = "private subnet cidr block"
  type = string
}

variable "availability_zone_prs" {
    description = "availability zone for private subnet"
    type = string
}

variable "pub_subnet_cidr" {
    description = "public subnet cidr block"
    type = string
}

variable "availability_zone_pus" {
  description = "availability zone for public subnet"
  type = string
}

variable "pub_rt_cidr" {
    description = "public route table cidr block"
    type = string
}

variable "priv_rt_cidr" {
    description = "private route table cidr block"
    type = string
}

variable "allow_tls_name" {
    description = "allow tls security group name"
    type = string
}

variable "web_tags_name" {
    description = "tag name for the aws_instance named web"
    type = string
}

variable "aws_vpc_tags_name" {
    description = "aws_vpc tags name"
    type = string
}

variable "priv_subnet_tags" {
  description = "private subnet tags name"
  type = string
}

variable "pub_subnet_tags" {
    description = "public subnet tags name"
    type = string
}

variable "pub_rt_tags" {
  description = "public route table tags name"
  type = string
}

variable "igw_tags" {
  description = "internet gateway tags name"
  type = string
}

variable "nat_gateway_tags" {
  description = "nat gateway tags name"
  type = string
}

variable "priv_rt_tags" {
  description = "private route table tags name"
  type = string
}


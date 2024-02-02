#!/bin/bash

# Variables
vpc_name="VPC-SALMONES"
instance_name="Proxy"
key_pair_name="RetoASIR"
ami_id="ami-0c7217cdde317cfec"  # ID de la AMI que deseas usar
instance_type="t2.medium"
subnet_id="subnet-008e1bf73f80629fd"  # Cuando creas la subred con el otro script hay que cambiar el id de la subred con el que se te haya creado.

# Obtener la ID de la VPC
vpc_id=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=$vpc_name" --query 'Vpcs[0].VpcId' --output text)

# Obtener la ID de la clave (key pair)
key_pair_id=$(aws ec2 describe-key-pairs --key-names $key_pair_name --query 'KeyPairs[0].KeyPairId' --output text)

# Crear instancias EC2
instance_ids=$(aws ec2 run-instances --image-id $ami_id --count 1 --instance-type $instance_type --key-name $key_pair_name --subnet-id $subnet_id --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance_name}]" --query 'Instances[*].InstanceId' --output text)

echo "Instancias EC2 lanzadas con éxito:"
echo "ID de la VPC: $vpc_id"
echo "ID de las instancias: $instance_ids"

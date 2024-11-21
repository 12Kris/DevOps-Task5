aws ec2 run-instances \
--image-id ami-053b0d53c279acc90 \
--count 1 \
--instance-type t2.micro \
--key-name key \
--security-group-ids sg-001fd82968af5db51 \
--subnet-id subnet-0e56a302aaa7f74e9 \
--iam-instance-profile Name=EC2_default \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=Hometask_5}]" \
--user-data file://user_data.sh

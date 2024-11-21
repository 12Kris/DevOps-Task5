# DevOps-Task5

Step-by-Step Instructions:
1. Create EC2 instance using run_EC2.sh
2. Verify the systemd service is running sudo systemctl status move-files.service
3. Verify if folder1 folder2 exists 
4. Create a test file in folder1 touch testfile
5. Check if the file appears in folder2 ls /home/ubuntu/folder2
6. Restart the service (if needed) sudo systemctl restart move-files.service

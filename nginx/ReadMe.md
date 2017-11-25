* sudo yum install -y nginx

Furthermore the nginx must be allowed by selinux, run the following command for [your_host] that install nginx:

* Step 1: run "sudo yum install policycoreutils-python" if not installed (used for allow2audit)
* Step 2: run "sudo cat /var/log/audit/audit.log | grep nginx | grep denied | audit2allow -M mynginx"
* Step 3: run "sudo semodule -i mynginx.pp"
* Note: apply the above step 2 and step 3 only when nginx configuration failed
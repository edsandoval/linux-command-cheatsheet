# Preparation 

## step 1: install nginx 

* sudo yum install -y nginx

Furthermore the nginx must be allowed by selinux, run the following command for [your_host] that install nginx:

* Step 1: run "sudo yum install policycoreutils-python" if not installed (used for allow2audit)
* Step 2: run "sudo cat /var/log/audit/audit.log | grep nginx | grep denied | audit2allow -M mynginx"
* Step 3: run "sudo semodule -i mynginx.pp"
* Note: apply the above step 2 and step 3 only when nginx configuration failed

# Setup SSL with letsencrypt

## step 1: configure the .well-known folder for the nginx root

ssh to the [your_host] and run the following commands:

* sudo yum install -y certbot
* cd /usr/share/nginx/html
* sudo mkdir .well-known
* sudo chmod 755 .well-known

## step 2: configure nginx to allow letsencrypt write to [your_host]/.well-known/acme-challenge/ web directory

After the nginx is installed on [your_host] with its default configuration /etc/nginx/nginx.conf, put the following block into /etc/nginx/nginx.conf (can be above "location /" in the server 80 block):

<pre>
        location ^~ /.well-known/acme-challenge/ {
            allow all;
            alias /usr/share/nginx/html/.well-known/acme-challenge/;
        }
</pre>
   
## step 3: generate the certificates using letsencrypt webroot plugin

Next run the following command:
* sudo certbot certonly -a webroot --webroot-path=/usr/share/nginx/html -d [your_host_domain_name_with_www]

## step 4: Verify expected result

If step 3 is successful, you should see something like to the following:

<pre>
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at
   /etc/letsencrypt/live/[your_host_domain_name_with_www]/fullchain.pem. Your cert will
   expire on yyyy-MM-dd. To obtain a new or tweaked version of this
   certificate in the future, simply run certbot again. To
   non-interactively renew *all* of your certificates, run "certbot
   renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

</pre>

Next run the following commands to ensure the pem files are created:

* sudo ls -l /etc/letsencrypt/live/[your_host_domain_name_with_www]

## step 5: renew letencrypts

```bash
sudo certbox renew
sudo service nginx restart
sudo service nginx reload
```

## step 5: configure letencrypts to auto-renew

To configure for auto-renew, run the following command to test whether auto-renew works on the VM:

* sudo certbot renew --dry-run

If everything ok, run the following command to create a cron job the runs the auto-renew:

* crontab -e

In the vi editor that opens, add the following line if not there (which means the cron will run at 1AM and 1PM):

<pre>
0 1,13 * * * certbot renew --quiet
5 1,13 * * * systemctl reload nginx.service
</pre>





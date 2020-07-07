# secure nginx, see https://cipherli.st/

#ssl_protocols TLSv1.3; # Requires nginx >= 1.13.0 else use TLSv1.2
ssl_protocols TLSv1.2; # We use TLSv1.2 because current stable nginx release don't support TLSv1.3 yet
ssl_prefer_server_ciphers on;
ssl_dhparam /etc/nginx/dhparam.pem; # openssl dhparam -out /etc/nginx/dhparam.pem 4096
ssl_ciphers EECDH+CHACHA20:EECDH+AES;
ssl_ecdh_curve X25519:prime256v1:secp521r1:secp384r1;
ssl_session_cache shared:SSL:10m;
ssl_session_tickets off; # Requires nginx >= 1.5.9
ssl_stapling on; # Requires nginx >= 1.3.7
ssl_stapling_verify on; # Requires nginx => 1.3.7
resolver 8.8.8.8 8.8.4.4 valid=300s;
resolver_timeout 90s;


# https://hstspreload.org
add_header Strict-Transport-Security "max-age=63072000" always; 
# By default, HSTS header is not added to subdomain requests. If you have subdomains and want
# HSTS to apply to all of them, you should add the includeSubDomains variable like this:
#add_header Strict-Transport-Security "max-age=63072000; includeSubDomains" always;

add_header X-Frame-Options DENY;
add_header X-Content-Type-Options nosniff;
add_header X-XSS-Protection "1; mode=block";
add_header X-Robots-Tag none;
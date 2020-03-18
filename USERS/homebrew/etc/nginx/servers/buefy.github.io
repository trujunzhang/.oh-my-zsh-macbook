server {
  listen 8020 default_server;
  listen [::]:8020 default_server;
  root /Users/djzhang/Documents/Organizations/__LinkKeep/NGNIX/buefy.github.io;
  index index.html;
  server_name buefy.github.io www.buefy.github.io.com;
  location / {
    try_files $uri $uri/ =404;
  }
}
# ln -s /usr/local/etc/nginx/sites-available/mediawiki.dev /usr/local/etc/nginx/sites-enabled/

# ln -s /usr/local/etc/nginx/sites-available/mediawiki.dev /usr/local/etc/nginx/sites-enabled/

# sudo ln -s /usr/local/etc/nginx/sites-available/example.dev /usr/local/etc/nginx/sites-enabled/


ln -s /usr/local/etc/nginx/sites-available/php.dev /usr/local/etc/nginx/sites-enabled/



sudo brew services restart nginx


curl -IL http://localhost:8080/info.php

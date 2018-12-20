docker run \
--restart=always \
-v /host/upload:/home/foo/upload \
-p 2222:22 -d atmoz/sftp \
foo:pass:1001

#  Create a new group ftpaccess for FTP users.
sudo groupadd ftpaccess

# The below steps must be followed while creating Users for sftp access.
# Create user john with ftpaccess group and /usr/bin/nologin shell.
sudo useradd -m foo -g ftpaccess

# Passwd the user.
sudo passwd foo

# Change ownership for the home directory.
sudo chown root /home/foo

# Create a folder inside home directory for writing and change ownership of that folder.
sudo mkdir /home/foo/upload
sudo chown foo:ftpaccess /home/foo/upload
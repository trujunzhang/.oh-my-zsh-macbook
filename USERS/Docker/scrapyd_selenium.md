* chromedriver(pending)
  $ browserless/chrome
  $ https://hub.docker.com/r/browserless/chrome/
  $ https://docs.browserless.io/docs/docker-quickstart.html

  $ docker pull browserless/chrome
     docker run \
          --restart=always\
	  -p 3000:3000 \
	  --name mybrowserless \
	  browserless/chrome 


* Docker with google
  $ https://github.com/joyzoursky/docker-python-chromedriver/blob/master/py-debian/3.6-selenium/Dockerfile

  Setting up google-chrome-stable (86.0.4240.111-1) ...
  update-alternatives: using /usr/bin/google-chrome-stable to provide /usr/bin/x-www-browser (x-www-browser) in auto mode
  update-alternatives: using /usr/bin/google-chrome-stable to provide /usr/bin/gnome-www-browser (gnome-www-browser) in auto mode
  update-alternatives: using /usr/bin/google-chrome-stable to provide /usr/bin/google-chrome (google-chrome) in auto mode
  

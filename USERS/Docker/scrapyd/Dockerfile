FROM python:3.6
MAINTAINER Fuxing


# install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# install chromedriver
# RUN apt-get install -yqq unzip
# RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
# RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# set display port to avoid crash
ENV DISPLAY=:99

COPY requirements.txt /root/requirements.txt
COPY .newspoliticl /root/.newspoliticl

RUN pip install 'scrapyd==1.2.1'

RUN mkdir -p /etc/scrapyd/

COPY scrapyd.conf /etc/scrapyd/scrapyd.conf

EXPOSE 6800
CMD ["scrapyd"]



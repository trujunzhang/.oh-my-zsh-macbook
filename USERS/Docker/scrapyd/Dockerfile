FROM python:3.5
MAINTAINER Fuxing

COPY requirements.txt /root/requirements.txt
COPY .newspoliticl /root/.newspoliticl

RUN pip install 'scrapyd==1.2.0'
RUN mkdir -p /etc/scrapyd/

COPY scrapyd.conf /etc/scrapyd/scrapyd.conf

EXPOSE 6800
CMD ["scrapyd"]



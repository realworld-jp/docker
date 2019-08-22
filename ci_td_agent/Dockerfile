FROM centos:7

RUN yum install -y sudo epel-release \
    && yum install -y pip install python-pip

RUN curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent3.sh | sh

RUN pip install pip --upgrade \
    && pip install awscli

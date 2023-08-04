FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y --no-install-recommends curl ca-certificates 
RUN apt-get install -y --no-install-recommends pkg-config
RUN apt-get install -y --no-install-recommends mercurial git
RUN apt-get install -y --no-install-recommends python3 
RUN apt-get install -y --no-install-recommends build-essential
RUN apt-get install -y --no-install-recommends libpq5 libmysqlclient21 
RUN apt-get install -y --no-install-recommends python3-dev python3-venv libffi-dev libpq-dev libmysqlclient-dev
RUN apt-get install -y --no-install-recommends libsasl2-dev libldap2-dev libssl-dev
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y --no-install-recommends nodejs
RUN curl -sL https://bootstrap.pypa.io/get-pip.py | python3 - "setuptools < 58.0"

ARG KALLITHEA_REV=default
WORKDIR /work/src
RUN hg clone --rev "$KALLITHEA_REV" https://kallithea-scm.org/repos/kallithea .
RUN pip install --upgrade -e . -r dev_requirements.txt python-ldap python-pam

COPY ./assets  /work/assets

CMD ["bash", "/work/assets/startup.sh"]

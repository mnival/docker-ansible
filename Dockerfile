#FROM python:latest
FROM python:slim

RUN apt update && \
	apt full-upgrade -y && \
	apt install -y --no-install-recommends openssh-client && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/alternatives.log /var/log/dpkg.log /var/log/apt/ /var/cache/debconf/*-old

RUN pip install --no-cache-dir pip --upgrade

RUN pip install --no-cache-dir ansible

WORKDIR /work

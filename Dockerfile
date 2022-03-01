FROM python:3.10.2-slim as base

RUN apt update && \
	apt full-upgrade -y && \
	apt install -y --no-install-recommends openssh-client && \ 
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/alternatives.log /var/log/dpkg.log /var/log/apt/ /var/cache/debconf/*-old

RUN pip install --no-cache-dir pip --upgrade

FROM base as builder

RUN python -m venv /opt/venv

ENV PATH="/opt/venv/bin:${PATH}"

RUN pip install --no-cache-dir ansible

FROM base

COPY --from=builder /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:${PATH}"

WORKDIR /work

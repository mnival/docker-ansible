FROM python:3.11.5-slim as base

RUN apt update && \
	apt full-upgrade -y && \
	apt install -y --no-install-recommends openssh-client && \ 
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/alternatives.log /var/log/dpkg.log /var/log/apt/ /var/cache/debconf/*-old

FROM base as builder

ENV PATH="/opt/venv/bin:${PATH}"

RUN python -m venv /opt/venv && \
  pip install --no-cache-dir pip --upgrade && \
  pip install --no-cache-dir ansible

FROM base

COPY --from=builder /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:${PATH}"

WORKDIR /work

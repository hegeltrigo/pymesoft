FROM python:3.7
RUN apt-get update -qq && \
    apt-get install -yq git

# Install AWS AND EB
COPY docker/compose/deployment/entrypoint.sh /entrypoint.sh
COPY docker/compose/deployment/requirements.txt /requirements.txt

RUN pip install --upgrade pip && \
    pip install -r /requirements.txt

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

FROM python:3.12

WORKDIR /app
COPY . .

RUN pip install pdm && \
    pdm install --no-self

ENV XDG_CONFIG_HOME=/config
ENV XIAOGPT_PORT=9527
VOLUME /config
EXPOSE 9527

# --- Auto-Generated Entrypoint Configuration ---
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN mkdir -p /var/log && touch /var/log/app.log
EXPOSE 9527
ENTRYPOINT ["/entrypoint.sh"]

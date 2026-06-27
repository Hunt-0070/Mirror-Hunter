FROM rjriajul/wzmlx:v3
WORKDIR /usr/src/app
RUN apt-get update && apt-get install -y qbittorrent-nox && \
    ln -sf $(which qbittorrent-nox) /usr/local/bin/pkgupd && \
    rm -rf /var/lib/apt/lists/*
RUN chmod 777 /usr/src/app
RUN uv venv --system-site-packages
COPY requirements.txt .
RUN uv pip install --no-cache-dir -r requirements.txt
COPY . .
RUN sed -i 's/\r$//' start.sh
CMD ["bash", "start.sh"]
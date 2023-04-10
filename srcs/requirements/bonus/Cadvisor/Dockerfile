FROM  debian:buster

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://github.com/google/cadvisor/releases/download/v0.38.7/cadvisor -o /usr/bin/cadvisor && \
    chmod +x /usr/bin/cadvisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 6060
CMD ["/usr/bin/cadvisor"]

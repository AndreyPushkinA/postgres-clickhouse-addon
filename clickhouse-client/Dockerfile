FROM yandex/clickhouse-client:latest

RUN apt-get update && apt-get install -y ttyd

EXPOSE 5050

CMD ["ttyd", "-p", "5050", "/bin/bash"]

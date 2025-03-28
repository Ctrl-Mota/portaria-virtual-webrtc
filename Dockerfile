# Usa a imagem oficial do Asterisk
FROM andrius/asterisk:latest

# Instala dependências para WebRTC
RUN apt-get update && apt-get install -y \
    libssl-dev \
    uuid-dev \
    libjansson-dev \
    libxml2-dev \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copia arquivos de configuração para o container
COPY configs/pjsip.conf /etc/asterisk/pjsip.conf
COPY configs/http.conf /etc/asterisk/http.conf
COPY configs/rtp.conf /etc/asterisk/rtp.conf

# Define ponto de entrada para iniciar o Asterisk
CMD ["asterisk", "-fvvv"]

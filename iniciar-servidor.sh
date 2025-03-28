#!/bin/bash

echo "Iniciando o servidor de Portaria Virtual..."

# Criar diretório para os certificados, caso não exista
mkdir -p ./configs/keys

# Verificar se o Docker está em execução
if ! docker info > /dev/null 2>&1; then
  echo "Erro: Docker não está em execução. Por favor, inicie o Docker e tente novamente."
  exit 1
fi

# Parar e remover o container anterior se existir
docker-compose down

# Iniciar o container
docker-compose up -d

# Verificar se o container está rodando
if docker ps | grep -q asterisk-webrtc; then
  echo "Servidor iniciado com sucesso!"
  echo "⭐ Cliente web disponível em: http://localhost/"
  echo "⭐ Servidor SIP disponível em: localhost:5060"
  echo "⭐ Servidor WebRTC disponível em: wss://localhost:8089/ws"
  echo ""
  echo "Para ver os logs do servidor:"
  echo "docker logs -f asterisk-webrtc"
else
  echo "Erro: Falha ao iniciar o servidor."
  echo "Verifique os logs com: docker logs asterisk-webrtc"
fi 
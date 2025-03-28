# Certificados para WebRTC

Os arquivos necessários para habilitar WebRTC seguro são:
- `asterisk.key` - Chave privada
- `asterisk.crt` - Certificado SSL

## Geração automática pelo Asterisk

O Asterisk pode gerar certificados automaticamente quando a opção `dtls_auto_generate_cert=yes` está configurada no `pjsip.conf`. Neste caso, não é necessário criar os certificados manualmente.

## Geração manual (Alternativa)

Se precisar gerar os certificados manualmente, use os comandos abaixo dentro do container:

```bash
# Acesse o container
docker exec -it asterisk-webrtc /bin/bash

# Gere a chave e o certificado auto-assinado (validade de 365 dias)
cd /etc/asterisk/keys
openssl req -x509 -days 365 -nodes -newkey rsa:2048 -out asterisk.crt -keyout asterisk.key -subj "/CN=asterisk"

# Ajuste as permissões
chown asterisk:asterisk asterisk.key asterisk.crt
chmod 600 asterisk.key
```

## Notas importantes

- Para ambiente de produção, considere obter certificados válidos de uma autoridade certificadora
- Os navegadores podem exibir avisos de segurança para certificados auto-assinados
- Se estiver usando HTTPS, será necessário aceitar o certificado auto-assinado no navegador antes de tentar usar o WebRTC 
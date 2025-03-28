# Projeto Portaria Virtual com Asterisk e WebRTC

Este projeto implementa um sistema de portaria virtual que permite a comunicação entre um dispositivo facial Hikvision, uma portaria e um cliente WebRTC em navegador.

## Visão Geral

O sistema permite que:

1. Um dispositivo Hikvision detecte visitantes e inicie uma chamada para a portaria
2. A portaria atenda e transfira a chamada para um cliente WebRTC
3. O cliente WebRTC possa conversar com o visitante pelo navegador

## Estrutura do Projeto

```
phonehouse/
├── configs/                 # Configurações do Asterisk
│   ├── pjsip.conf          # Configuração dos endpoints SIP
│   ├── extensions.conf     # Plano de discagem
│   ├── http.conf           # Configuração do servidor HTTP/WebSocket
│   ├── rtp.conf            # Configuração de mídia RTP
│   └── confbridge.conf     # Configuração da sala de conferência
├── web_client/             # Cliente WebRTC
│   ├── index.html          # Interface do usuário
│   └── docs/               # Documentação
│       ├── hikvision_setup.md   # Guia de configuração do dispositivo Hikvision
│       └── portaria_cliente.md  # Manual de uso do cliente WebRTC
├── docker-compose.yml      # Configuração do container
└── README.md               # Este arquivo
```

## Requisitos

- Docker e Docker Compose
- Dispositivo Hikvision com suporte a SIP
- Navegador moderno com suporte a WebRTC (Chrome, Firefox, Edge, Safari)

## Instalação e Execução

1. Clone este repositório
2. Execute o container Docker:

```bash
docker-compose up -d
```

3. Acesse o cliente WebRTC em `http://IP_DO_SERVIDOR/web_client/`

## Configuração

### Servidor Asterisk
O servidor Asterisk já está configurado com:
- Suporte a WebRTC via WebSockets seguros
- Endpoints para dispositivo Hikvision, portaria e cliente WebRTC
- Plano de discagem para chamadas e transferências

### Dispositivo Hikvision
Consulte o guia detalhado em `web_client/docs/hikvision_setup.md` para configurar o dispositivo Hikvision.

### Cliente WebRTC
Consulte o manual de uso em `web_client/docs/portaria_cliente.md` para instruções sobre como utilizar o cliente WebRTC.

## Fluxo de Comunicação

```
Dispositivo Hikvision → Portaria → Cliente WebRTC
        (2001)            (3001)       (1001)
           │                │            │
           │     Liga       │            │
           │───────────────>│            │
           │   para 9000    │            │
           │                │            │
           │                │  Transfere │
           │                │───────────>│
           │                │  para 8000 │
           │                │            │
           │<───────────────────────────>│
           │      Comunicação direta     │
```

## Notas de Segurança

Este projeto é um protótipo para ambiente local e não inclui medidas de segurança robustas. Não utilize em ambiente de produção sem implementar:

- Autenticação forte
- Criptografia de ponta a ponta
- Proteção contra ataques de rede
- Validação de entradas nos formulários

## Solução de Problemas

Se encontrar problemas:

1. Verifique os logs do container Docker:
```bash
docker logs asterisk-webrtc
```

2. Verifique a conexão SIP do dispositivo Hikvision
3. Consulte os logs do cliente WebRTC na interface do usuário # portaria-virtual-webrtc

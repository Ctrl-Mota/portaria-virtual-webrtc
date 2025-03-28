# Manual de Uso - Cliente WebRTC Portaria

Este guia descreve como utilizar o cliente WebRTC para receber e gerenciar chamadas da portaria.

## Requisitos

- Navegador moderno com suporte a WebRTC (Chrome, Firefox, Edge, Safari)
- Microfone e câmera funcionando no computador
- Conexão estável à rede local

## Iniciando o Cliente

1. Abra o navegador e acesse o cliente WebRTC (geralmente em `http://IP_DO_SERVIDOR/web_client/`)
2. A interface mostrará o painel principal com o status "Sistema Pronto"

## Configuração Inicial

1. Verifique os campos de configuração na parte inferior da tela:
   - **Servidor WebSocket**: Endereço do servidor WebRTC (formato `wss://IP_DO_SERVIDOR:8089/ws`)
   - **Extensão**: Seu número de extensão (padrão: `1001`)

2. Clique no botão "Conectar ao Servidor" para registrar-se no Asterisk
3. Se a conexão for bem-sucedida, o status mudará para "Conectado ao Servidor"

## Recebendo Chamadas

Quando o dispositivo Hikvision detectar um visitante e ligar para a portaria:

1. O porteiro pode atender a chamada normalmente
2. Para encaminhar a chamada para o cliente WebRTC, o porteiro disca `8000`
3. No cliente WebRTC, você verá uma notificação de chamada recebida
4. O status mudará para "Chamada Recebida" com animação piscante
5. Clique no botão "Atender Chamada" para aceitar a comunicação

## Durante a Chamada

1. O vídeo do visitante (da câmera Hikvision) aparecerá na tela principal
2. Seu vídeo aparecerá em uma janela menor no canto
3. Utilize o botão "Encerrar Chamada" para finalizar a comunicação

## Testando o Sistema

Para testar o sistema sem um visitante real:

1. Clique no botão "Testar Chamada" para ligar diretamente para a portaria
2. Você pode simular o processo completo de comunicação entre a portaria e o cliente WebRTC

## Solução de Problemas

- **Falha na Conexão**: Verifique se o servidor WebSocket está correto e se o servidor Asterisk está em execução
- **Não consegue ver/ouvir o visitante**: Verifique se o codec de vídeo H.264 está habilitado no navegador
- **Não consegue transmitir áudio/vídeo**: Verifique se você deu permissão para o navegador acessar câmera e microfone

## Logs do Sistema

Na parte inferior da tela, há uma seção de logs que mostra eventos importantes:

- Tentativas de conexão
- Chamadas recebidas/realizadas
- Erros de comunicação

Estes logs são úteis para diagnosticar problemas de comunicação. 
# Configuração do Dispositivo Hikvision para Integração com Asterisk

Este guia descreve os passos necessários para configurar um dispositivo facial Hikvision para se comunicar com o servidor Asterisk via SIP.

## Requisitos

- Dispositivo facial Hikvision com suporte a SIP
- Acesso à interface de administração do dispositivo
- Servidor Asterisk configurado conforme especificações deste projeto

## Passos para Configuração

### 1. Acessar Interface de Administração

1. Abra um navegador e digite o endereço IP do dispositivo Hikvision
2. Faça login com credenciais de administrador

### 2. Configurar Parâmetros SIP

1. Navegue até **Configuração > Rede > Configurações Avançadas > SIP**
2. Configure os seguintes parâmetros:
   - **Ativar SIP**: Selecionado/Ativado
   - **Versão do Protocolo**: Selecione "SIP"
   - **Servidor SIP**: Endereço IP do servidor Asterisk
   - **Porta do Servidor**: 5060
   - **ID do Usuário**: hikvision
   - **Senha**: hikvision123
   - **ID de Autenticação**: hikvision
   - **Porta Local SIP**: 5060
   - **Intervalo de Registro**: 3600 (ou valor preferido)

### 3. Configurar Parâmetros de Áudio/Vídeo

1. Navegue até **Configuração > Vídeo/Áudio > Configurações de Vídeo**
2. Configure o formato de vídeo para "H.264" para compatibilidade
3. Configure a resolução para 720p ou menor para melhor desempenho com WebRTC

### 4. Configurar Regras de Chamada

1. Navegue até **Configuração > Intercom > Configurações de Chamada**
2. Configure o número de destino para "9000" (que é o número da portaria no nosso plano de discagem)
3. Configure a duração máxima de chamada (recomendado: 120 segundos)

### 5. Configuração de Eventos para Chamadas Automatizadas

1. Navegue até **Configuração > Evento > Detecção Facial**
2. Habilite "Iniciar Chamada SIP" quando um evento de detecção facial ocorrer
3. Configure para discar para o número "9000"

## Testando a Integração

1. Force um evento de detecção facial ou use o botão de chamada no dispositivo
2. Verifique se a chamada está sendo recebida na portaria
3. A portaria pode então transferir a chamada para o cliente WebRTC discando 8000

## Solução de Problemas

- **Falha no Registro SIP**: Verifique as credenciais e confirme se a porta 5060 UDP está acessível
- **Sem Áudio/Vídeo**: Verifique as configurações de codecs no dispositivo e no Asterisk
- **Chamadas não sendo encaminhadas**: Verifique o plano de discagem no Asterisk 
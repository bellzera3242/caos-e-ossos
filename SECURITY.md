# Modelo de segurança

- Sem bibliotecas, fontes, imagens ou scripts externos.
- A política CSP limita scripts, mídia, imagens e conexões à própria origem e permite somente o JavaScript/CSS inline necessário ao jogo atual.
- Os nomes de personagem devem ser tratados como dados locais; não inclua informações pessoais.
- Os arquivos de save estão em `localStorage` e podem ser editados/apagados pelo usuário ou navegador.
- A senha do Boss Rush é validada no cliente e não constitui segredo criptográfico nem autenticação contra alguém que leia o código.
- Não há serviço de conta, pagamentos, telemetria ou upload de dados.

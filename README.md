# Caos & Ossos — Edição de Lançamento (PC + Mobile)

RPG 2D isométrico de fantasia sombria, construído em HTML5 Canvas e JavaScript sem frameworks, CDN ou scripts de terceiros. A mesma build é responsiva para desktop e celular.

## PC (Windows)
1. Extraia o ZIP completo para uma pasta.
2. Abra `INICIAR_JOGO.bat` ou `index.html`.
3. Os vídeos do menu devem permanecer ao lado de `index.html`.

## Android / iPhone
A instalação como app requer hospedagem HTTPS (por exemplo, GitHub Pages). Abra o site no navegador do celular e use “Adicionar à tela inicial” / “Add to Home Screen”. Os controles de toque aparecem automaticamente em telas touch. Após a primeira visita e o cache do Service Worker, o app pode iniciar offline.

## Controles
- PC: clique esquerdo ataca; clique direito move; Q/W/E/R usa habilidades; F interage/usa; I abre mochila; Esc pausa fora do Boss Rush.
- Mobile: toque no terreno move; botões de ataque, habilidades e uso ficam na parte inferior.
- Boss Rush: senha `teste`. Durante uma run não há botão de saída; a run termina por derrota/fim do desafio.

## Publicar no GitHub Pages
1. Crie um repositório vazio chamado `caos-e-ossos` na sua conta GitHub.
2. Descompacte o pacote, abra um terminal nessa pasta e execute `git init`, `git add .`, `git commit -m "Release: Caos & Ossos PC e Mobile"`, `git branch -M main`, `git remote add origin https://github.com/SEU_USUARIO/caos-e-ossos.git` e `git push -u origin main`.
3. O workflow `.github/workflows/pages.yml` publica a pasta raiz no GitHub Pages após o push. Em Settings → Pages, escolha GitHub Actions se o GitHub pedir.

## Segurança e limitações
- A build não carrega código de terceiros nem envia dados do jogo para servidores. Saves e configurações ficam no armazenamento local do navegador.
- A senha `teste` é uma barreira de acesso no lado do cliente, não uma autenticação segura: qualquer pessoa com acesso ao arquivo pode inspecionar o código. Não use nela nem no save dados pessoais ou segredos.
- Navegadores, sistema operacional, extensões e o próprio dispositivo ainda podem interromper uma partida. Bloqueio de navegação impede a saída pelo menu do jogo, mas não impede fechar o navegador ou desligar o aparelho.
- Esta é uma build de lançamento candidata. Teste em diferentes dispositivos antes de anunciar como versão final estável.

## Arquivos
- `index.html`: jogo PC/mobile.
- `manifest.webmanifest`, `sw.js`, `icons/`: instalação PWA e cache offline.
- `gameplay_vila_e_exploracao.mp4`, `gameplay_floresta_ossos.mp4`, `gameplay_montanhas_neve.mp4`, `gameplay_boss_dragao_cinzas.mp4`, `gameplay_vulcao_rei_rabugento.mp4`: cinco clipes de gameplay capturados do motor do jogo em áreas e combates diferentes.
- `.github/workflows/pages.yml`: implantação no GitHub Pages.


## Publicação no repositório GitHub

A conexão remota pode ser somente leitura. Para enviar os arquivos, no Windows instale Git for Windows, extraia este pacote e execute `PUBLICAR_NO_GITHUB.bat`. Cole a URL HTTPS do repositório `https://github.com/bellzera3242/caos-e-ossos`. O script clona primeiro o repositório e copia a build por cima, preservando o histórico existente, antes de criar o commit e enviar. Não informe senhas ou tokens no chat; autentique-se na janela oficial do Git quando for solicitado.

Depois, abra a aba **Actions** e espere o workflow **Deploy static game to GitHub Pages** terminar. Se necessário, em **Settings → Pages**, selecione **GitHub Actions** como origem.

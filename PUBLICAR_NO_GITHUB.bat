@echo off
setlocal EnableExtensions
cd /d "%~dp0"
where git >nul 2>nul || (
  echo Git nao encontrado. Instale Git for Windows: https://git-scm.com/download/win
  pause
  exit /b 1
)
set /p REPOURL=Cole a URL HTTPS do seu repositorio: 
if "%REPOURL%"=="" (
  echo URL vazia.
  pause
  exit /b 1
)
set "WORKDIR=%TEMP%\Caos_e_Ossos_GitHub_Publish"
if exist "%WORKDIR%" rmdir /s /q "%WORKDIR%"
echo [1/4] Clonando o repositorio para preservar o historico existente...
git clone "%REPOURL%" "%WORKDIR%"
if errorlevel 1 (
  echo Nao foi possivel clonar. Confira o link e entre na sua conta GitHub quando solicitado.
  pause
  exit /b 1
)
echo [2/4] Copiando os arquivos da edicao de lancamento...
robocopy "%~dp0" "%WORKDIR%" /E /R:2 /W:1 /XD .git
if errorlevel 8 (
  echo A copia falhou. Nenhum push foi executado.
  pause
  exit /b 1
)
pushd "%WORKDIR%"
echo [3/4] Preparando o commit...
git add -A
git diff --cached --quiet
if errorlevel 1 git commit -m "Release candidate: Caos & Ossos PC e Mobile"
if errorlevel 1 (
  echo O commit falhou. Confira nome e email do Git configurados no Git.
  popd
  pause
  exit /b 1
)
echo [4/4] Enviando para o GitHub...
git push origin HEAD
if errorlevel 1 (
  echo Envio falhou. Confira as permissoes de escrita da sua conta GitHub.
  popd
  pause
  exit /b 1
)
popd
echo.
echo Arquivos enviados. Abra Actions no GitHub e acompanhe o workflow Deploy static game to GitHub Pages.
echo Quando terminar, o site costuma ficar em https://SEU-USUARIO.github.io/caos-e-ossos/
echo Se necessario, entre em Settings ^> Pages e selecione GitHub Actions como origem.
pause
endlocal

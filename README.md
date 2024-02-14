# Script de Desinstalação de Bloatwares do Windows

Este script PowerShell permite desinstalar diversos aplicativos pré-instalados do Windows, comumente chamados de "bloatwares". Ele utiliza o Winget (Windows Package Manager) para desinstalar os aplicativos.

## Como usar

> [!IMPORTANT] 
> Para o Windows 10 é necessário instalar o Winget. No script abaixo possui uma forma automazida de instalá-lo, porém recomendo que você abra a Microsoft Store e busque por "Instalador de Pacotes".

1. Abra o PowerShell como administrador.
2. Execute o comando abaixo para permitir a execução de scripts externos:
   
    ```powershell
    Set-ExecutionPolicy Unrestricted -Force
    ```
3. Confirme todas as verificações com "Sim".  
4. Execute o código abaixo para baixar e iniciar o script:

    ```powershell
    iwr "https://raw.githubusercontent.com/gustjose/wingetRemoveBloatwares/main/DesinstalarBloatwares.ps1" -o desinstalarbloatwares.ps1; desinstalarbloatwares.ps1
    ```

5. Siga as instruções apresentadas no console para desinstalar os aplicativos desejados.
6. Se o Winget não estiver instalado, o script oferecerá a opção de instalá-lo automaticamente.
7. Ao finalizar, pressione qualquer tecla para sair do script.

## Lista de aplicativos desinstalados

A lista de aplicativos que este script pode desinstalar inclui:

- Microsoft Outlook
- Microsoft Power Automate Desktop
- Microsoft Windows Feedback Hub
- Microsoft Windows Sound Recorder
- Microsoft Xbox Gaming Overlay
- Microsoft Quick Assist
- Microsoft Get Started
- Microsoft Your Phone
- Windows Camera
- Microsoft OneDrive
- Microsoft Zune Video
- Microsoft Zune Music
- Microsoft Todos
- Microsoft People
- Microsoft Get Help
- Microsoft Gaming App
- Microsoft Bing Weather
- Microsoft Bing News
- Microsoft Cortana
- Clipchamp Clipchamp
- Microsoft Windows Photos
- Microsoft Windows Alarms
- Microsoft Windows Communications Apps
- Microsoft Windows Maps
- Microsoft Windows Communications Apps
- Microsoft Microsoft Office Hub
- Microsoft Wallet
- Microsoft Mixed Reality Portal
- Microsoft Microsoft Family
- 3D Builder
- 3D Viewer
- Microsoft Teams
- Skype

## Observações

- Este script deve ser executado como administrador para desinstalar os aplicativos corretamente.
- Certifique-se de revisar a lista de aplicativos antes de executar o script, pois alguns podem ser úteis para você.
- Este script não desinstala todos os aplicativos do Windows, apenas aqueles listados no código. Se houver outros aplicativos que você deseja remover, você pode adicionar seus identificadores na lista de aplicativos.
- Referência dos principais boatwares tiradas do canal [WINchester](https://www.youtube.com/@winchestercanal) no vídeo https://youtu.be/D6h-aveKM7U?si=G4FJIAuWeeq4E3pk.


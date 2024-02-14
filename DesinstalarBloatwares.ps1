function Write-FancyTitle {
    param (
        [string]$Title
    )

    $titleColor = "Cyan"
    $dashColor = "Gray"

    Write-Host ""
    Write-Host ("{0,-40}" -f ("-" * 40)) -ForegroundColor $dashColor
    Write-Host ("{0,-40}" -f $Title) -ForegroundColor $titleColor
    Write-Host ("{0,-40}" -f ("-" * 40)) -ForegroundColor $dashColor
    Write-Host ""
}

# Lista de aplicativos a serem desinstalados
$applications = @(
    "Microsoft.OutlookForWindows_8wekyb3d8bbwe",
    "Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe",
    "Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe",
    "Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe",
    "Microsoft.XboxGamingOverlay_8wekyb3d8bbwe",
    "MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe",
    "Microsoft.Getstarted_8wekyb3d8bbwe",
    "Microsoft.YourPhone_8wekyb3d8bbwe",
    "WindowsCamera_8wekyb3d8bbwe",
    "Microsoft.OneDrive",
    "Microsoft.ZuneVideo_8wekyb3d8bbwe",
    "Microsoft.ZuneMusic_8wekyb3d8bbwe",
    "Microsoft.Todos_8wekyb3d8bbwe",
    "Microsoft.People_8wekyb3d8bbwe",
    "Microsoft.GetHelp_8wekyb3d8bbwe",
    "Microsoft.GamingApp_8wekyb3d8bbwe",
    "Microsoft.BingWeather_8wekyb3d8bbwe",
    "Microsoft.BingNews_8wekyb3d8bbwe",
    "Microsoft.549981C3F5F10_8wekyb3d8bbwe", # Cortana
    "Clipchamp.Clipchamp_yxz26nhyzhsrt",
    "Microsoft.Windows.Photos_8wekyb3d8bbwe",
    "Microsoft.WindowsAlarms_8wekyb3d8bbwe",
    "microsoft.windowscommunicationsapps_8wekyb3d8bbwe",
    "microsoft.WindowsMaps_8wekyb3d8bbwe",
    "microsoft.windowscommunicationsapps_8wekyb3d8bbwe",
    "Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe",
    "Microsoft.Wallet_8wekyb3d8bbwe",
    "Microsoft.MixedReality.Portal_8wekyb3d8bbwe",
    "MicrosoftCorporationII.MicrosoftFamily_8wekyb3d8bbwe",
    "9WZDNCRFJ3T6", # 3D Builder
    "9NBLGGH42THS", # 3D Viewer
    "9WZDNCRFJBMP", # Microsoft Teams
    "9WZDNCRFJ364" # Skype
)

function Uninstall-AppWithMessage {
    param (
        [string]$AppName
    )

    if ($installedApps -match $AppName) {
        winget uninstall $AppName

        if ($LASTEXITCODE -eq 0) {
            Write-Host "Desinstalacao de $AppName concluida com sucesso." -ForegroundColor Green
        } else {
            Write-Host "Erro ao desinstalar $AppName." -ForegroundColor Red
        }
    } else {
        Write-Host "$AppName nao esta instalado." -ForegroundColor Yellow
    }
}

Clear-Host
Write-FancyTitle -Title "Desisntalando Aplicativos Windows"
Write-Host "Verificando WinGet..."

# Verificar se o comando 'winget' esta disponivel
if (Get-Command winget -ErrorAction SilentlyContinue) {
    Write-Host "O Winget esta instalado." -ForegroundColor Green
    Write-Host
    Write-Host "Iniciando desinstalacao..."
    Write-Host

    $installedApps = winget list

    # Loop para desinstalar cada aplicativo
    foreach ($app in $applications) {
        Uninstall-AppWithMessage -AppName $app
    }

    Write-Host
    Write-Host "Script Concluido!"
} else {
    Write-Host "O Winget não está instalado neste sistema." -ForegroundColor Red
    $confirm = Read-Host "Você deseja instalar o Winget agora? (S/N)"
    if ($confirm -eq "S" -or $confirm -eq "s") {
        Write-Host
        Write-Host "Instalando o Winget..."
        Write-Host

        # Comando para instalar o winget
        Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle" -OutFile "$env:temp\winget.appxbundle"
        Add-AppxPackage -Path "$env:temp\winget.appxbundle"
        
        Write-Host "Winget foi instalado com sucesso." -ForegroundColor Green
        Start-Sleep -Seconds 2
        & $PSCommandPath
    } elseif ($confirm -eq "N" -or $confirm -eq "n") {
        Write-Host "Operação cancelada pelo usuário." -ForegroundColor Yellow
    } else {
        Write-Host "Entrada inválida. Operação cancelada." -ForegroundColor Yellow
    }
}

Write-Host "Pressione qualquer tecla para continuar..."
Read-Host

@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

set "logFile=conversion_times.log"

rem Inicializa o log
echo Conversion Times Log > "%logFile%"
echo --------------------- >> "%logFile%"

for %%f in (*.mov) do (
    echo Processing: %%f
    set "baseName=%%~nf"
    set "outputFile=!baseName!.mp4"

    rem Executa PowerShell para obter timestamp, converter, medir tempo, logar e definir timestamp
    powershell -nologo -command ^
        "$inputFile = '%%f'; " ^
        "$outputFile = '!outputFile!'; " ^
        "$logFile = '%logFile%'; " ^
        "try { " ^
        "    Write-Host ('Processing: ' + $inputFile); " ^
        "    $originalTimestamp = (Get-Item -LiteralPath $inputFile).LastWriteTime; " ^
        "    $ffmpegCmd = { & ffmpeg -y -accurate_seek -i $inputFile -ss 0.5 -c:v copy -af 'volume=10dB' -c:a aac -b:a 320k -ar 32000 -ac 1 -map_metadata 0 -movflags use_metadata_tags $outputFile }; " ^
        "    $duration = Measure-Command { Invoke-Command $ffmpegCmd }; " ^
        "    if ($LASTEXITCODE -ne 0) { throw ('ffmpeg failed with exit code: ' + $LASTEXITCODE) }; " ^
        "    $logMsg = '{0} - {1:N3} seconds' -f $inputFile, $duration.TotalSeconds; " ^
        "    Add-Content -Path $logFile -Value $logMsg; " ^
        "    Write-Host $logMsg; " ^
        "    (Get-Item -LiteralPath $outputFile).LastWriteTime = $originalTimestamp; " ^
        "} catch { " ^
        "    $errorMsg = 'ERROR processing {0}: {1}' -f $inputFile, $_.Exception.Message; " ^
        "    Write-Host $errorMsg -ForegroundColor Red; " ^
        "    Add-Content -Path $logFile -Value $errorMsg; " ^
        "}"

    rem Não é mais necessário: copy tempfile, robocopy, del tempfile
)

echo.
echo All done.
echo Check the %logFile% file for conversion times and errors.
pause
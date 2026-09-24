$ErrorActionPreference = "Stop"

Write-Host "ClippingTool - OpenShorts local installer" -ForegroundColor Cyan

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw "Git is required. Install Git for Windows, then run this script again." }
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) { throw "Docker Desktop is required. Install Docker Desktop with WSL2, then run this script again." }

$engine = Join-Path $PSScriptRoot "engine"
if (-not (Test-Path $engine)) {
  Write-Host "Downloading OpenShorts engine..." -ForegroundColor Yellow
  git clone https://github.com/mutonby/openshorts.git $engine
} else {
  Write-Host "OpenShorts engine already exists; updating..." -ForegroundColor Yellow
  git -C $engine pull --ff-only
}

Set-Location $engine
if (-not (Test-Path ".env")) {
  if (Test-Path ".env.example") { Copy-Item ".env.example" ".env" } else { New-Item ".env" -ItemType File | Out-Null }
}

Write-Host "Starting OpenShorts..." -ForegroundColor Green
docker compose up --build -d
Write-Host "Dashboard: http://localhost:5175" -ForegroundColor Green
Write-Host "Next: secure phone access through Cloudflare Tunnel." -ForegroundColor Green

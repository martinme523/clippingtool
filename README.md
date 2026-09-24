# ClippingTool

Personal self-hosted AI video clipping workstation built around OpenShorts.

## Goal

YouTube/local video -> AI moment detection -> 9:16 shorts -> captions -> MP4 downloads.

This repository intentionally uses the proven OpenShorts processing engine instead of reimplementing the AI/video pipeline.

## Quick start (Windows)

Requirements: Windows 10/11, Docker Desktop with WSL2, Git, and 8 GB RAM minimum.

Run PowerShell from this repository:

    powershell -ExecutionPolicy Bypass -File .\setup.ps1

Then open http://localhost:5175.

The setup script downloads the MIT-licensed OpenShorts core into .\engine and starts it with Docker Compose.

## Remote phone access

After local processing is verified, expose port 5175 through a Cloudflare Tunnel. Do not open router ports directly. The PC must remain powered on for local processing.

## Licensing

The OpenShorts core is MIT licensed. This wrapper does not copy the upstream cloud/billing directory. See the upstream repository for its current license and third-party dependency terms.

Upstream: https://github.com/mutonby/openshorts

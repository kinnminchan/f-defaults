@echo off
title FXServer - Recommended
cd ../
:start
chcp 65001
powershell "%~dp0..\server\artifacts\latest_recommended\FXServer +set citizen_dir %~dp0..\server\artifacts\latest_recommended\citizen\ %* +exec ./server/configs/server_options.cfg +exec ./server/configs/server_permissions.cfg +exec ./server/configs/server_resources.cfg | tee ./server/logs/log-console/$(Get-Date -f yyyy-MM-dd-HHmm).log"
goto start
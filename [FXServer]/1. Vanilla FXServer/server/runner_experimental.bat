@echo off
title FXServer - Experimental
cd ../
:start
chcp 65001
powershell "%~dp0..\server\artifacts\latest_experimental\FXServer +set citizen_dir %~dp0..\server\artifacts\latest_experimental\citizen\ %* +exec ./server/configs/server_options.cfg +exec ./server/configs/server_permissions.cfg +exec ./server/configs/server_resources.cfg | tee ./server/logs/log-console/$(Get-Date -f yyyy-MM-dd-HHmm).log"
goto start
@echo off
title OTserv Auto-restarter
echo :: =========================================
echo :: --- Auto-Restarter ---
echo :: =========================================
echo ::
:begin
otservbr-global-x64.exe
echo ::
echo :: =========================================
echo :: --- Server CrAsH ---
echo :: =========================================
echo ::
goto begin
:goto begin
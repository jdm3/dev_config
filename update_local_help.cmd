@echo off
pushd "%userprofile%\vimfiles\pack\plugins\start"
for /f %%a in ('dir /ad /b *') do vim -c ":helptags ~/vimfiles/pack/plugins/start/%%a/doc" -c q
cd ..\opt
for /f %%a in ('dir /ad /b *') do vim -c ":helptags ~/vimfiles/pack/plugins/start/%%a/doc" -c q
popd

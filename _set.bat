        @echo off
        for %%a in ("%CD%") do set "PARENT_FOLDER=%%~nxa" :: selects parent folder by iterating through list
	:: %%~nxa => echo filename + ext //weird way
        title %PARENT_FOLDER%
        set GITBRANCH=
        for /f "tokens=2" %%I in ('git.exe branch 2^> NUL ^| findstr /b "* "') do set GITBRANCH=%%I
        if "%GITBRANCH%" == "" (
            prompt $E[30;104m$S$E[0m$E[30;104m$P$S$E[0m$E[1;94m$E[0m$S
        ) else (
            prompt $E[30;104m$S$E[0m$E[30;104m$P$S$E[0m$E[1;94;43m$S$E[0m$E[30;43m%GITBRANCH%$S$E[0m$E[33m$E[0m$S
        )

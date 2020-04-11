gmt begin
   gmt coast -Rg -JG%MOVIE_FRAME%/20/%MOVIE_WIDTH% -Gmaroon -Sturquoise -Bg -X0 -Y0
gmt end

REM 下面一行脚本单独执行
REM gmt movie globe.bat -Nglobe -T10 -Agif+l -C6ix6ix100 -Lf

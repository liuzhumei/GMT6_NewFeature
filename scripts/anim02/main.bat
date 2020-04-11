set /a last=%MOVIE_FRAME%*10

gmt begin
	
	rem	画蓝色函数线
	gmt convert sin_curve.txt -Z0:%last% | gmt plot -W1p,blue -R0/360/-1.2/1.6 -JX3.5i/1.65i -X0.35i -Y0.25i
	rem 画深红色点
	gmt convert sin_point.txt -Z0:%MOVIE_FRAME% | gmt plot -Sc0.1i -Gdarkred
	
	rem 最新的点用亮红色再画一次
	echo %MOVIE_COL0% %MOVIE_COL1% | gmt plot -Sc0.1i -Gred 
	echo 0 1.6 a = %MOVIE_COL0% | gmt text -F+f14p,Helvetica-Bold+jTL -N -Dj0.1i/0.05i

gmt end

REM 下面一行脚本单独执行
REM gmt movie main.bat -Sbpre.bat -C4ix2ix125 -Tsin_point.txt -Z -Ncurve -D5 -A+l
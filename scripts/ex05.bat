REM GMT ex33
gmt begin ex05 png 
	gmt grdcut @earth_relief_01m -R118W/107W/49S/42S -Gspac_33.nc
    gmt makecpt -Crainbow -T-5000/-2000
    gmt grdimage spac_33.nc -JQ6i -I+a15+ne0.75 -B -C -Xc --FORMAT_GEO_MAP=ddd.xF
    gmt colorbar -C -DJBC -B -By+lkm

    REM 绘脊线
    (echo -111.6 -43.0 & echo -113.3 -47.5) > ridge.txt
    gmt plot ridge.txt -W2p,blue
    gmt plot ridge.txt -Sc0.1i -Gblue 

    REM 每条纵断面长400km，每隔2km一个采样，断面之间间距10km,自西向东记录格网采样数据
    gmt grdtrack ridge.txt -Gspac_33.nc -C400k/2k/10k+v -Sm+sstack.txt >table.txt
    gmt plot table.txt -W0.5p

    REM 获取所有切线上采样数据的最大值和最小值画剖面图
    gmt convert stack.txt -o0,5 > env.txt
    gmt convert stack.txt -o0,6 -I -T>> env.txt
    gmt plot env.txt -R-200/200/-3500/-2000 -JX6i/3i -Bxafg1000+l"Distance from ridge(km)" -Byaf+l"Depth(m)" -BWSne -Glightgray -Y7i
    gmt plot stack.txt -W3p 
    echo 0 -2000 MEDIAN STACKED PROFILE | gmt text -F+jTC+f14p -Dj0.1i 

    del env.txt table.txt stack.txt ridge.txt spac_33.nc
gmt end
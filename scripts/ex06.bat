REM GMT ex013
gmt begin ex06 png
    gmt set FONT_HEADING 40p,Times-Italic
    REM z=x·exp(-x^2-y^2)
    gmt grdmath -R-2/2/-2/2 -I0.1 X Y R2 NEG EXP X MUL = z.nc
    gmt grdmath z.nc DDX = dzdx.nc
	gmt grdmath z.nc DDY = dzdy.nc
    gmt grd2cpt z.nc -Crainbow -T-0.5/0.5/0.01

    REM 绘制2x2的子图 整张图宽6i高6i，每个子图大小一致，间隔0.01i 只最后一行子图有x轴,左右第一列左边有y轴
    REM gmt subplot begin 2x2 -Ff6i/6i -M0.1i -A(1)+p0.5p+gwhite+o0.1i+jLB+v -BWSen -T"z(x,y) = x@~\327@~exp(-x@+2@+-y@+2@+)"
    REM 绘制2x2的子图 整张图宽6i高6i，每个图大小不一致，两列宽度分别是（3,1），两行高度分别是（1,2）
    REM gmt subplot begin 2x2 -Ff6i/6i+f3,1/1,2 -M0.05i -BWSne -T"z(x,y) = x@~\327@~exp(-x@+2@+-y@+2@+)"
    REM 绘制2x2的子图 每个图5cx5c
    gmt subplot begin 2x2 -Fs3i/3i -SCb -SRl -BWStr -T"z(x,y) = x@~\327@~exp(-x@+2@+-y@+2@+)"

        gmt subplot set 0 
        REM gmt grdimage z.nc -C 
        gmt grdimage -JX5.7i/3i z.nc -C
        gmt colorbar -C -Ba -Dx5.8i/0+w3i/0.1i --MAP_ANNOT_OFFSET_PRIMARY=2p

        gmt subplot set 2
        gmt grdcontour z.nc -C0.05 -A0.1 -S4 -T+d0.1i/0.03i -Gd2i

        gmt subplot set 3 
        gmt grdcontour z.nc -C0.05 -Gd2i -S4
        gmt grdvector dzdx.nc dzdy.nc -I0.2 -Q0.1i+e+n0.25i+h0.5 -Gblack -W1p -S5i 

        REM gmt subplot set 3 
        REM gmt grdimage z.nc -C 
        REM gmt grdcontour z.nc -C0.05 -Gd2i -S4
        REM gmt grdvector dzdx.nc dzdy.nc -I0.2 -Q0.1i+e+n0.25i+h0.5 -Gblack -W1p -S5i 

    gmt subplot end
    gmt colorbar -R0/6/0/6 -JX6i -DJBC+w4i/0.15i+h -C -Ba
    del z.nc dzdx.nc dzdy.nc 
gmt end show
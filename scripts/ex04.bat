REM GMT ex44
REM GMT5==========================================
REM 绘制澳大利亚的海岸线
REM gmt pscoast -R110E/170E/44S/9S -JM6i -Ba -Dl -N2/1p -BWSne -Wfaint -EAU+gbisque -Gbrown -Sazure1 -K --FORMAT_GEO_MAP=dddF> ex04.ps
		
REM REM 在右上角绘制insert box
REM gmt psbasemap -R -J -DjTR+w1.5i+o0.15i+t -F+gwhite+p1p+c0.1c+s -O -K>> ex04.ps
REM REM 在insert box内绘制全球地图，并突出显示澳大利亚。
REM gmt pscoast -Rg -JG120/30S/1.5i -Dl -Gbrown -Bg -Wfaint -EAU+gbisque -O -K>> ex04.ps
REM gmt psbasemap -Rg -JG120/30S/1.5i -D110E/170E/44S/9S -F -O -K>> ex04.ps

REM echo 140E 40S text | gmt pstext -R -J -O >> ex04.ps
REM gmt psconvert ex04.ps -Tg -A -P
REM del gmt.*

REM GMT5===========================================

REM GMT6绘制澳大利亚的海岸线
gmt begin ex04_1 png
    gmt coast -R110E/170E/44S/9S -JM6i -Ba -BWSne -N2/1p -Wfaint -EAU+gbisque -Gbrown -Sazure1 --FORMAT_GEO_MAP=dddF
    
    REM 在右上角绘制 insert box
    gmt inset begin -DjTR+w1.5i+o0.15i/0.1i -F+gwhite+p1p+c0.1c+s
        gmt coast -JG120/30S/? -Rg -Bg -Wfaint -Gbrown -EAU+gbisque
        echo 110E 9S 170E 44S | gmt plot -Sr+s -W1p,blue
    gmt inset end

    echo 120E 40S text | gmt text

gmt end
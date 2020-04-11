gmt begin 
  gmt convert "https://earthquake.usgs.gov/fdsnws/event/1/query.csv?starttime=2018-01-01%%2000:00:00&endtime=2018-12-31%%2000:00:00&minmagnitude=5&orderby=time-asc" -i2,1,3,4+s50,0 -hi1 > q.txt
  gmt makecpt -Cred,green,blue -T0,70,300,10000
  
  REM 颜色表示深度，震级*50表示大小 时间单位：day 当前绘制时间 2018.5.1
  gmt figure ex07 png
  gmt events -Rg -JG200/5/6i -Baf q.txt -SE- -C --TIME_UNIT=d -T2018-05-01T00:00:00 -Es+r2+p2 -Ms5+c0.5 -Mi1+c-0.6 -Mt+c0

  gmt figure ex07_1 png
  gmt plot q.txt -Rg -JG200/5/6i -SE- -C -Ba
  gawk "{if(($5>=\"2018-04-29T00:00:00\")&&($5<=\"2018-05-03T00:00:00\"))print $1,$2,$3,$4}" q.txt | gmt plot -Rg -JG200/5/6i -SE- -C -B

  gmt colorbar -DJBC+w2i/0.2i+h -L  
  del q.txt query.csv

gmt end
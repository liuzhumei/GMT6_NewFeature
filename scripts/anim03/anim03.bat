REM ==========1. ���ص���Ŀ¼
set SITE=https://earthquake.usgs.gov/fdsnws/event/1/query.csv
set STIME=starttime=2018-01-01%%2000:00:00
set ETIME=endtime=2018-12-31%%2000:00:00
set MAG=minmagnitude=5
set ORDER=orderby=time-asc
set URL="%SITE%?%STIME%&%ETIME%&%MAG%&%ORDER%"

REM ȡ���ȡ�γ�ȡ���ȣ�������ɫ�����𼶣����Ŵ�С����ʱ��
gmt convert %URL% -i2,1,3,4+s50,0 -hi1 > quakes.txt
REM ������ɫ����Դ��Ⱦ���
gmt makecpt -Cred,green,blue -T0,70,300,10000 > movie_dem.cpt

REM ==========2. ���㴫�������ÿ֡����������(MOVIE_COL0)��ͶӰ���Ĳ���(MOVIE_COL1)
REM ʱ�䣬 [-1,1] * 40 + 200
gmt math -T2018-01-01T/2018-12-31T/1 --TIME_UNIT=d TNORM 40 MUL 200 ADD = times.txt
REM ==========3. �趨������
set SCRIPT=main.bat
echo gmt begin > %SCRIPT%
echo     gmt coast -Rg -JG%%MOVIE_COL1%%/5/6i -Gburlywood -Sgray -Xc -Yc -A500 >> %SCRIPT%
echo     gmt plot @ridge.txt -W0.5p,red >> %SCRIPT%
echo     gmt events  quakes.txt -SE- -Cmovie_dem.cpt --TIME_UNIT=d -T%%MOVIE_COL0%% -Es+r2+d6 -Ms5+c0.5 -Mi1+c-0.6 -Mt+c0 >> %SCRIPT%
echo gmt end >> %SCRIPT%

REM ===========4. ��������
REM ����6ix6i��С 100DPU ��ɫΪ��ɫ��mp4���������ֱ�עΪ���ڣ���дhhmmss����ͬʱ����gif�ļ���ÿ2֡һ����ѭ������
gmt movie main.bat -C6ix6ix100 -Ttimes.txt -Nquakes -Gblack -H2 -Fmp4 -A+l+s2 --FONT_TAG=20p,Helvetica,white --TIME_UNIT=d --FORMAT_CLOCK_MAP=-
del quakes.txt query.csv movie_dem.cpt times.txt main.bat

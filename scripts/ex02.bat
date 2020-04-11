gmt begin ex02 png  
    gmt makecpt -Cdem1 -T-5000/2000/500 
    gmt grdimage @earth_relief_30s.grd -RTW+r1 -C -I
    gmt coast -Wthin -BWSne -B    
    gmt colorbar -DJBC -B -By+lkm -C 
gmt end show
gmt begin ex1 png
    gmt coast -Rg -JN15c -B -Gwheat -Slightblue
    echo 180 0 Hello world | gmt text 
    REM gmt plot CN-border-L1.dat
gmt end show

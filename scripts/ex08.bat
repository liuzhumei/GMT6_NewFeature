gmt begin ex08 png
    gmt plot -R0/7/3/7 -Jx1i -B @Table_5_11.txt -Sc0.15i -Glightgreen -Wfaint -lApples+n3
    gmt plot @Table_5_11.txt -St0.15i -Gorange -lorange
    gmt plot @Table_5_11.txt -W2.5p,gray -l"My Lines" 
    gmt legend -DjTR+w3.2i+o0.1i -F+p1p+gwhite
gmt end 
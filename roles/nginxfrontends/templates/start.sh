#!/bin/bash

{{ nuvoled_base_dir}}/{{ java_dir_version_name }}/bin/java -jar {{ nuvoled_base_dir}}/{{ jar_name }} -h
{{ nuvoled_base_dir}}/{{ java_dir_version_name }}/bin/java -jar {{ nuvoled_base_dir}}/{{ jar_name }} -px 1 -py 2  -br 0.6 -s 0 

#usage: java -jar nuvoled.jar
# -b,--bind                bind to interface 169.254
# -br,--brightness <0.6>   brightness value with 0.x -1.x
# -h,--help                Help Message
# -px,--panelsx <1>        Number of Panels horizontal
# -py,--panelsy <1>        Number of Panels vertical
# -r,--rotation <0>        rotation degree 0/90/180/270
# -s,--sleep <15>          sleep ime in ms
# -sn,--screennr <0>       number of screen
# -sx,--startx <0>         Pixel start horizontal
# -sy,--starty <0>         Pixal start vertical


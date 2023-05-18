#!/bin/bash

{{ nuvoled_base_dir}}/{{ java_dir_version_name }}/bin/java -jar {{ nuvoled_base_dir}}/{{ jar_name }} -h
{{ nuvoled_base_dir}}/{{ java_dir_version_name }}/bin/java -jar {{ nuvoled_base_dir}}/{{ jar_name }} -px 1 -py 2  -br 0.6 -s 0 

#usage: java -jar nuvoled.jar
# -a,--artnet <<ip>>                  enables artnet
# -ac,--artnetChannel << 0 - 513 >>   artnet channel
# -ad,--artnetDebug                   enables artnet debug
# -as,--artnetSubnet << 0 - 16 >>     artnet subnet
# -au,--artnetUniverse << 0 - 16 >>   artnet universe
# -b,--bind                           bind to interface 169.254
# -br,--brightness <0.6>              brightness value with 0.x -1.x
# -h,--help                           Help Message
# -l,--list                           list available webcams
# -o,--offset <0>                     offset (Contrast)
# -px,--panelsx <1>                   Number of Panels horizontal
# -py,--panelsy <1>                   Number of Panels vertical
# -r,--rotation <0>                   rotation degree 0/90/180/270
# -s,--sleep <0>                      sleep ime in ms
# -sn,--screennr <0>                  number of screen
# -sx,--startx <0>                    Pixel start horizontal
# -sy,--starty <0>                    Pixal start vertical
# -w,--webcam <<webcam name>>         use webcam as input



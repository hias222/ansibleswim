#!/usr/bin/env python3

import subprocess

a = subprocess.run(['ifconfig'], capture_output=True, shell=False, text=True)
print("a:",a.stdout)

b = subprocess.run(['java', '--version'], capture_output=True, shell=True,text=True)
print("b:",b.stdout)

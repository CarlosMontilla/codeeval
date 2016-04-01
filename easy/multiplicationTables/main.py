#!/usr/bin/env python
for i in range(1,13):
    print i,
    for j in range(2,13):
        print '%3.0d' % (i * j),
    print

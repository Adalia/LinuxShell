#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
Created on 2016.11.8

@author: Administrator
'''

import string
import sys

def count(file = None):
    if file == None:
        if len(sys.argv)==2:
            file = sys.argv[1]
        else:
            print "please input a txt file, whitch output by 'ifstat -i Eth  -bnt"
    #print file
    try:
        file = open(file,'r')
        filelines= file.readlines()
        nrows=len(filelines)
        print nrows
        print filelines[6]
        #计算用变量
        count = 0
        totalflows=0.00
        outflows = []
        outflow = 0.00
        #遍历所有行
        for row in range(0,nrows,60):  #间隔60行统计一次
            str=filelines[row]
            #print len(str)
            #print str.split(" ")
            data=str.split(" ")[len(str.split(" "))-1]  #8.05e+06
            #print "data = "+data
            if (data == "out" or data == "0.00" or data== "\n"):  #跳过信息行
                print "continue"
            else:
                if "+" in data :
                   # print "科学计数"
                    a = data.split("e+")[0]
                    e = data.split("e+")[1][1]
                    #print a + " " + e
                    outflow = float(a)
                    #print int(e)
                    for i in range(int(e)):
                        outflow = outflow*10.0
                    #print outflow
                    outflows.append(outflow)
                else:
                    #print data.split(".")
                    data = float(data.split(".")[0]) + float(data.split(".")[1])/100
                    #print "我不是科学计数" 
                    outflows.append(data)
                    
            totalflows = totalflows + outflow
            print "sum = ", totalflows
            count=count+1
        print "sum of line count:",count   
        print "average = ",totalflows/count/1024/1024

    except Exception,e:
        print str(e)


if __name__ == '__main__':
    count()

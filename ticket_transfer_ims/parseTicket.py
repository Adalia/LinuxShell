#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
import xlwt
default_encoding="utf-8"

if __name__ == '__main__':
    filename = ''
    print sys.argv[1]
    if(len(sys.argv)==2):
	filename = sys.argv[1]
      	print filename
    else:
       print("Please input filename-path after program name.")
    #filename = "2017011610ticket.txt"
    ticketfile = open(filename)
    ticket = ticketfile.readlines()
    print len(ticket)
    ticket_field = open("ticket_field.txt").readlines()
    savePath =  filename.split(".")[0]+"_parse.xls"
    book = xlwt.Workbook(encoding='utf-8')
    sheet1=book.add_sheet('sheet1')


    for i in range(0,len(ticket)):
	print i
   	ticket_list = ticket[i].split("|")
  	print ticket_list
        sheet1.col(i*2).width=256*20
        sheet1.col(i*2+1).width=256*20
   	for col in range(0,len(ticket_field)): 
         	sheet1.write(col,i*2,ticket_field[col])
         	if ticket_list[col]==" " or ticket_list[col]=="":
                	sheet1.write(col,i*2+1,"None")
           	else:
                	sheet1.write(col,i*2+1,ticket_list[col])
   	if (len(ticket_list)-len(ticket_field)>0):
        	for col in range(len(ticket_field),len(ticket_list)):
           		 sheet1.write(col,i*2+1,ticket_list[col])
    
    book.save(savePath)              
    print "The result is saved successful, the file is " + savePath

    
   
   
   
   
   
   
   
   
   
   
   
   
   

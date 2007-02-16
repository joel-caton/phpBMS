INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (1,2,'id','clients.id','center','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (2,2,'type','if(clients.type=\"prospect\",\"<span style=\'color:red;\'>P</span>\",\"<b>C</b>\")','center','',1,NULL,0,'','noencoding');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (12,2,'name / company','if(clients.lastname!=\"\",concat(clients.lastname,\", \",clients.firstname,if(clients.company!=\"\",concat(\" (\",clients.company,\")\"),\"\")),clients.company)','left','',2,'',0,'100%',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (16,2,'city','clients.city','left','',4,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (17,2,'state','clients.state','left','',5,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (18,2,'zip','clients.postalcode','left','',6,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (44,3,'id','invoices.id','left','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (45,3,'type','invoices.type','left','',1,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (134,3,'status','invoices.status','left','',2,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (46,3,'date','if(invoices.type=\"Invoice\",invoices.invoicedate,invoices.orderdate)','left','',4,'',0,'','date');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (47,3,'client name / company','concat(\"<strong>\",if(clients.lastname!=\"\",concat(clients.lastname,\", \",clients.firstname,if(clients.company!=\"\",concat(\" (\",clients.company,\")\"),\"\")),clients.company),\"</strong>\")','left','',5,NULL,0,'100%','noencoding');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (139,5,'id','lineitems.id','left','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (48,3,'total','if(invoices.type!=\"VOID\",invoices.totalti,\"-----\")','right','sum(if(invoices.type!=\"VOID\",invoices.totalti,0))',6,'if(invoices.type!=\"VOID\",invoices.totalti,0)',0,'','currency');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (49,3,'due','if(invoices.type!=\"VOID\",invoices.totalti-invoices.amountpaid,\"-----\")','right','sum(if(invoices.type!=\"VOID\",(invoices.totalti-invoices.amountpaid),0))',7,'if(invoices.type!=\"VOID\",invoices.totalti-invoices.amountpaid,0)',0,'','currency');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (51,5,'invoice id','lineitems.invoiceid','left','',1,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (52,5,'part #','products.partnumber','left','',4,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (53,5,'name','products.partname','left','',5,'',1,'100%',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (54,5,'unit price','concat(\"$\",format(lineitems.unitprice,2))','right','concat(\"$\",format(sum(lineitems.unitprice),2))',6,'lineitems.unitprice',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (55,5,'qty','format(lineitems.quantity,2)','center','format(sum(lineitems.quantity),2)',7,'lineitemd.quantity',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (56,5,'price ext.','lineitems.unitprice*lineitems.quantity','right','sum(lineitems.unitprice*lineitems.quantity)',8,'',0,'','currency');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (57,5,'cost ext.','lineitems.unitcost*lineitems.quantity','right','sum(lineitems.unitcost*lineitems.quantity)',9,'',0,'','currency');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (58,5,'total wt.','format((lineitems.unitweight*lineitems.quantity),2)','right','format(sum(lineitems.unitweight*lineitems.quantity),2)',11,'lineitems.unitweight*lineitems.quantity',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (59,6,'id','tax.id','center','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (60,6,'name','concat(\"<strong>\",tax.name,\"</strong>\")','left','',1,NULL,0,'','noencoding');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (61,6,'percentage','concat(tax.percentage,\"%\")','left','',2,'tax.percentage',0,'98%',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (62,4,'id','products.id','center','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (63,4,'part number','products.partnumber','left','',1,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (64,4,'name','products.partname','left','',2,'',1,'100%',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (65,4,'category','productcategories.name','right','',3,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (66,4,'status','products.status','center','',5,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (67,4,'unit price','products.unitprice','right','',6,'',0,'','currency');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (68,7,'id','productcategories.id','center','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (69,7,'name','productcategories.name','left','',1,'',0,'100%',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (70,7,'date created','productcategories.creationdate','left','',2,'productcategories.creationdate',0,'','datetime');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (71,8,'id','prerequisites.id','center','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (72,8,'part number','products.partnumber','left','',1,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (73,8,'name','products.partname','left','',2,'',1,'50%',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (74,8,'dependent part num.','childproducts.partnumber','left','',3,'',0,'50%',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (75,18,'id','clients.id','center','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (76,18,'type','if(clients.type=\"prospect\",\"<span style=\'color:red;\'>P</span>\",\"<b>C</b>\")','left','',1,NULL,0,'','noencoding');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (77,18,'company / name','if(clients.lastname!=\"\",concat(clients.lastname,\", \",clients.firstname,if(clients.company!=\"\",concat(\" (\",clients.company,\")\"),\"\")),clients.company)','left','',2,'',1,'100%',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (79,18,'city','clients.city','left','',3,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (80,18,'state','clients.state','center','',4,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (81,18,'postal code','clients.postalcode','left','',5,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (102,2,'e-mail','clients.email','left','',3,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (103,22,'name','clientemailprojects.name','left','',2,'',0,'100%',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (104,22,'user','if(clientemailprojects.userid=0,\"<b>global</b>\",concat(users.lastname,\", \",users.firstname))','left','',1,NULL,0,'','noencoding');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (105,22,'last run','clientemailprojects.lastrun','right','',3,'',0,'','datetime');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (106,22,'id','clientemailprojects.id','left','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (136,25,'id','discounts.id','left','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (135,3,'web','invoices.weborder','center','',3,'',0,'','boolean');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (108,5,'type','invoices.type','left','',2,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (109,5,'date','if(invoices.type=\"Invoice\",invoices.invoicedate,invoices.orderdate)\r\n','left','',3,'',1,'','date');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (132,4,'type','products.type','center','',4,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (133,5,'tax','lineitems.taxable','center','',10,'',0,'','boolean');
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (137,25,'type','discounts.type','left','',1,'',0,'',NULL);
INSERT INTO `tablecolumns` (`id`, `tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (138,25,'name','discounts.name','left','',2,'',0,'100%',NULL);
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`,`wrap`, `size`, `format`) VALUES (300,'name','shippingmethods.name','left','',1,'',0,'99%',NULL);
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`,`wrap`, `size`, `format`) VALUES (300,'estimate','shippingmethods.canestimate','center','',2,'',0,'','boolean');
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`,`wrap`, `size`, `format`) VALUES (300,'priority','shippingmethods.priority','right','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (301,'name','paymentmethods.name','left','',1,'',0,'99%',NULL);
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (301,'type','paymentmethods.type','left','',2,'',0,'',NULL);
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (301,'id','paymentmethods.id','center','',0,'',0,'',NULL);
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (301,'priority','paymentmethods.priority','center','',3,'',0,'',NULL);
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (301,'online process','paymentmethods.onlineprocess','center','',4,'',0,'','boolean');
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (302,'name','invoicestatuses.name','left','',0,'',1,'99%',NULL);
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (302,'priority','invoicestatuses.priority','right','',1,'',0,'',NULL);
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`) VALUES (302,'inactive','invoicestatuses.inactive','center','',2,'',0,'','boolean');
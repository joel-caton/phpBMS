INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (200,'Client','',0,0,1,1,NOW(),NOW(),20);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (201,'Quick View','modules/bms/quickview.php',200,0,1,1,NOW(),NOW(),20);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (202,'Clients/Prospects','search.php?id=2',200,10,1,1,NOW(),NOW(),10);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (203,'Check for Duplicates','search.php?id=18',200,20,1,1,NOW(),NOW(),10);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (204,'Sales','',0,1,1,1,NOW(),NOW(),10);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (205,'Orders/Invoices','search.php?id=3',204,0,1,1,NOW(),NOW(),10);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (206,'Item Analysis','search.php?id=5',204,1,1,1,NOW(),NOW(),30);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (207,'Discounts/Promotions','search.php?id=25',204,10,1,1,NOW(),NOW(),30);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (208,'Tax Areas','search.php?id=6',204,20,1,1,NOW(),NOW(),50);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (209,'Product','',0,2,1,1,NOW(),NOW(),10);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (210,'Products','search.php?id=4',209,0,1,1,NOW(),NOW(),10);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (211,'Product Categories','search.php?id=7',209,1,1,1,NOW(),NOW(),30);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (212,'Prerequisites','search.php?id=8',209,2,1,1,NOW(),NOW(),20);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (213,'Shipping Methods','search.php?id=300',204,30,1,1,NOW(),NOW(),30);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (214,'Payment Methods','search.php?id=301',204,40,1,1,NOW(),NOW(),30);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (215,'----','',204,15,1,1,NOW(),NOW(),30);
INSERT INTO `menu` (`id`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES (216,'invoice statuses','search.php?id=302',204,50,1,1,NOW(),NOW(),30);

ALTER TABLE `addresses` ENGINE=INNODB;
ALTER TABLE `addresstorecord` ENGINE=INNODB;
ALTER TABLE `aritems` ENGINE=INNODB;
ALTER TABLE `clientemailprojects` ENGINE=INNODB;
ALTER TABLE `clients` ENGINE=INNODB;
ALTER TABLE `discounts` ENGINE=INNODB;
ALTER TABLE `attachments` ENGINE=INNODB;
ALTER TABLE `invoices` ENGINE=INNODB;
ALTER TABLE `invoicestatuses` ENGINE=INNODB;
ALTER TABLE `invoicestatushistory` ENGINE=INNODB;
ALTER TABLE `lineitems` ENGINE=INNODB;
ALTER TABLE `paymentmethods` ENGINE=INNODB;
ALTER TABLE `prerequisites` ENGINE=INNODB;
ALTER TABLE `products` ENGINE=INNODB;
ALTER TABLE `productcategories` ENGINE=INNODB;
ALTER TABLE `receiptitems` ENGINE=INNODB;
ALTER TABLE `receipts` ENGINE=INNODB;
ALTER TABLE `shippingmethods` ENGINE=INNODB;

--ADD UUID--
ALTER TABLE `addresses` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `clientemailprojects` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `clients` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `discounts` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `invoices` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `invoicestatuses` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `paymentmethods` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `productcategories` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `products` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `receipts` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `shippingmethods` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `tax` ADD COLUMN `uuid` varchar(64) NOT NULL AFTER `id`;
ALTER TABLE `clients` ADD COLUMN `taxid` VARCHAR(64) default NULL AFTER `webaddress`;
--END ADD UUID--

ALTER TABLE `receipts` MODIFY COLUMN `paymentmethodid` INTEGER NOT NULL DEFAULT 0;
INSERT INTO `settings` (`name`, `value`) VALUES ('company_taxid', '');
UPDATE `tabledefs` SET `deletebutton` = 'inactivate' WHERE `id` IN (6, 7);
UPDATE `tabledefs` SET `importfile` = 'modules/bms/clients_import.php' WHERE `id` = 2;
UPDATE `tabledefs` SET `defaultcriteriafindoptions` = 'Active Records', `defaultcriteriaselection` = 'name' WHERE `id` = 25;
UPDATE `tabledefs` SET `deletebutton` = 'inactivate' WHERE `displayname` = 'Tax Areas';
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('2', 'import', '1', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('3', 'import', '0', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('4', 'import', '1', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('5', 'import', '0', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('6', 'import', '1', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('7', 'import', '1', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('8', 'import', '0', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('18', 'import', '0', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('22', 'import', '0', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('25', 'import', '1', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('300', 'import', '1', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('301', 'import', '1', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('302', 'import', '1', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('303', 'import', '0', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('304', 'import', '0', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('305', 'import', '0', '0', '0', '-100', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('306', 'import', '0', '0', '0', '-100', '0');
UPDATE `tableoptions` SET `needselect` = 0 WHERE `tabledefid` = 2 AND `name` = 'massEmail';
UPDATE `tableoptions` SET `needselect` = 0 WHERE `tabledefid` = 303 AND `name` = 'run_aging';
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('25', 'Active Records', 'discounts.inactive=0', '0', '0');
UPDATE `tablefindoptions` SET `displayorder` = 0 WHERE `tabledefid` = 25 AND `name` = 'all records';
UPDATE `tablefindoptions` SET `search`= 'clients.firstname=dclients.firstname AND clients.lastname=dclients.lastname AND addresses.postalcode = daddresses.postalcode AND clients.lastname != \'\' AND clients.firstname != \'\' AND addresses.postalcode != \'\' AND clients.id<>dclients.ID' WHERE `name` = 'match names and postal code' AND `tabledefid` = '18';
UPDATE `tablefindoptions` SET `search`= 'addresses.address1=daddresses.address1 AND clients.id<>dclients.id' WHERE `name` = 'match addresses' AND `tabledefid` = '18';
UPDATE `tablecolumns` SET `column`='IF(receipts.paymentmethodid = -1,concat( concat("Other... (", receipts.paymentother), ")"), paymentmethods.name)' WHERE `tabledefid` = '304' AND `name` = 'payment';
--report updates--
UPDATE `reports` SET `uuid`='reports:bac1d6eb-b2bb-9aa0-77c0-ff7f9046ca75' WHERE `name`='Invoice';
UPDATE `reports` SET `uuid`='reports:a34dd4b5-6942-2b14-4a58-74345dce48de' WHERE `name`='Work Order';
UPDATE `reports` SET `uuid`='reports:34a69580-6fbc-d04c-ed3e-f0e497a9a9b2' WHERE `name`='Packing List';
UPDATE `reports` SET `uuid`='reports:07f58303-d6e9-a032-01ad-0097d59b3c04' WHERE `name`='Labels - Folder';
UPDATE `reports` SET `uuid`='reports:030e7d95-4542-b37c-3cac-a18ff5f4b8ff' WHERE `name`='Labels - Mailing';
UPDATE `reports` SET `uuid`='reports:c4a34fa0-16b5-dd85-cf63-5c8b543bb9c3' WHERE `name`='Labels - Shipping' AND `tabledefid`='2';
UPDATE `reports` SET `uuid`='reports:a502aa38-4ae8-9aa7-2795-4a05a4814637' WHERE `name`='Labels - Shipping' AND `tabledefid`='3';
UPDATE `reports` SET `uuid`='reports:e3ef15d4-1bf5-36a1-cc05-ee44025ad619' WHERE `name`='Totals - Custom' AND `tabledefid`='3';
UPDATE `reports` SET `uuid`='reports:5ec9b1fb-f3c6-26c7-f1bc-bec4ac8448fd' WHERE `name`='Totals - Amt. w/  Invoices';
UPDATE `reports` SET `uuid`='reports:960ec744-4955-81d1-8170-e56251603e4b' WHERE `name`='Totals - Amt. w/ Invoices + Line Items';
UPDATE `reports` SET `uuid`='reports:47407854-cb7f-f1e3-bc44-1b3979eae9b0' WHERE `name`='Totals - Grouped by Acct. Manager';
UPDATE `reports` SET `uuid`='reports:05de9afc-c82c-ed66-9403-184aa3f07a1c' WHERE `name`='Totals - Grouped by Shipping Method';
UPDATE `reports` SET `uuid`='reports:60c71b67-5cf1-6d1b-6d96-a4dfe9bbd651' WHERE `name`='Totals - Grouped by Payment Method';
UPDATE `reports` SET `uuid`='reports:7a7672ef-f11c-9a6a-5640-708c50cadd29' WHERE `name`='Totals - Grouped by Invoice Lead Source';
UPDATE `reports` SET `uuid`='reports:49c0907c-9253-4fcb-0717-37952dd0ef4e' WHERE `name`='Quote';
UPDATE `reports` SET `uuid`='reports:a278af28-9c34-da2e-d81b-4caa36dfa29f' WHERE `name`='Sales History';
UPDATE `reports` SET `uuid`='reports:1908b03c-cacc-f03a-6d22-21fdef123f65' WHERE `name`='Purchase History';
UPDATE `reports` SET `uuid`='reports:858702da-1b85-3a62-c20f-6b1593140a64' WHERE `name`='Totals - Custom' AND `tabledefid`='5';
UPDATE `reports` SET `uuid`='reports:28cf69cb-60de-bbed-df15-ea98842b6924' WHERE `name`='Totals - Product Categories';
UPDATE `reports` SET `uuid`='reports:274d3dfa-ec52-74d2-630f-0c432a6e1ea5' WHERE `name`='Totals - Product';
UPDATE `reports` SET `uuid`='reports:68b6258a-6902-f705-19f5-d2707bd78b35' WHERE `name`='Totals - Lead Source';
UPDATE `reports` SET `uuid`='reports:b552c34f-64b9-5a89-15b3-c5d717644b81' WHERE `name`='Client Notes Summary';
UPDATE `reports` SET `uuid`='reports:aca42dbe-68c9-e966-c174-ed938e9b880a' WHERE `name`='Totals - Tax';
UPDATE `reports` SET `uuid`='reports:e54cee32-b3c9-82cc-50c8-14848ece8e90' WHERE `name`='Receipt';
INSERT INTO `reports` (`uuid`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES ('reports:0df82ecf-5f05-56bd-18c3-e7cb27c0cf8a', 'Client Statements', 'PDF Report', '303', '10', '80', 'modules/bms/report/aritems_clientstatement.php', 'Client AR statement balances and activity.', 1, NOW(), 1, NOW());
INSERT INTO `reports` (`uuid`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES ('reports:e25bdb7a-93be-b1d6-a292-cdec89c0c9fc', 'Summary', 'report', '303', '10', '80', 'modules/bms/report/aritems_summary.php', 'Items grouped and totaled by clients, with grand totals.', 1, NOW(), 1, NOW());
INSERT INTO `reports` (`uuid`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES ('reports:916f34d8-0997-162c-4350-d93c3d283241', 'Payment Type Totals', 'report', '304', '10', '80', 'modules/bms/report/receipts_pttotals.php', 'Totals grouped by payment method.', 1, NOW(), 1, NOW());
INSERT INTO `reports` (`uuid`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES ('reports:4851c350-4343-4dc3-4b7b-74c287de011b', 'Incoming Cash Flow', 'report', '3', '55', '50', 'modules/bms/report/incoming_cashflow.php', 'This report shows total incoming monies for a time period from both posted sales orders AND posted receipts. It can be grouped by week, month, quarter and year.\r\n\r\nThis report runs is unaffected by selected records, search or sort parameters.  It requires input of its own start and end dates.', 1, NOW(), 1, NOW());
--end report updates
--role updates--
UPDATE `roles` SET `uuid`='role:3403a7e0-adb1-4d0b-3c6e-6d6bbe177d52' WHERE `id`='10';
UPDATE `roles` SET `uuid`='role:de7e6679-8bb2-29ee-4883-2fcd756fb120' WHERE `id`='20';
UPDATE `roles` SET `uuid`='role:259ead9f-100b-55b5-508a-27e33a6216bf' WHERE `id`='30';
UPDATE `roles` SET `uuid`='role:8f5fb368-e7d9-5010-d8f6-b4a78adc0520' WHERE `id`='50';
UPDATE `roles` SET `uuid`='role:c9439c3c-499b-7bcc-ee14-fec5bfcf5fc2' WHERE `id`='80';
--end role updates--
--shippingmethods updates--
UPDATE `shippingmethods` SET `uuid`='shp:f34a3e10-e782-2675-f041-71f5c88f5aa9' WHERE `id`='1';
UPDATE `shippingmethods` SET `uuid`='shp:e2e43816-667a-fdf3-6bec-4456bcf8bef0' WHERE `id`='2';
UPDATE `shippingmethods` SET `uuid`='shp:0f07f7fd-0352-8df7-8294-a57e5e375808' WHERE `id`='3';
UPDATE `shippingmethods` SET `uuid`='shp:6ef11711-7335-3e90-cf27-df5ea23c1480' WHERE `id`='4';
UPDATE `shippingmethods` SET `uuid`='shp:1a0c53bd-6754-7d9f-4bea-bad57628187a' WHERE `id`='5';
UPDATE `shippingmethods` SET `uuid`='shp:9e0bad1f-0545-6b09-3900-4e5943629037' WHERE `id`='6';
UPDATE `shippingmethods` SET `uuid`='shp:ba131229-fb3d-d328-91c8-323480831b03' WHERE `id`='7';
--end shippingmethods updates--
--tabs update--
UPDATE `tabs` SET `uuid`='tab:becfca94-ae25-a42c-7909-247d5324e4b5' WHERE `id`='6';
UPDATE `tabs` SET `uuid`='tab:ef895fc0-bbea-9bf5-47ac-4913c6dace13' WHERE `id`='7';
UPDATE `tabs` SET `uuid`='tab:19e34181-65f0-bfcf-6e09-99d0575ebd74' WHERE `id`='8';
UPDATE `tabs` SET `uuid`='tab:d8e888af-d147-98ae-6849-a159a7c9daae' WHERE `id`='9';
UPDATE `tabs` SET `uuid`='tab:17346362-261b-4d1d-fa77-99e84cfd9b8a' WHERE `id`='10';
UPDATE `tabs` SET `uuid`='tab:9bfc7eea-5abb-f5d8-763f-f78fe499464d' WHERE `id`='11';
UPDATE `tabs` SET `uuid`='tab:cd09d4a1-7d32-e08a-bd6e-5850bc9af88e' WHERE `id`='12';
UPDATE `tabs` SET `uuid`='tab:4c853d8b-8895-a8c5-8ff6-1128e6e1a798' WHERE `id`='13';
UPDATE `tabs` SET `uuid`='tab:d62cf7eb-fd2a-948a-6279-8a61d02390ae' WHERE `id`='14';
UPDATE `tabs` SET `uuid`='tab:20276b44-9cfa-403e-4c2a-ac6f0987ae20' WHERE `id`='15';
UPDATE `tabs` SET `uuid`='tab:809d644e-fa40-5ad3-0426-3d84cf15b32e' WHERE `id`='16';
UPDATE `tabs` SET `uuid`='tab:23687374-5c14-04af-74ac-0f74342e1019' WHERE `id`='17';
UPDATE `tabs` SET `uuid`='tab:c4cbfabf-a00e-7b82-b411-0e442205360a' WHERE `id`='18';
UPDATE `tabs` SET `uuid`='tab:5a6ef814-2689-4e3b-2609-db43fb3cc001' WHERE `id`='300';
UPDATE `tabs` SET `uuid`='tab:625192d0-00e6-ae2c-5b8c-f433bbf6e546' WHERE `id`='303';
--end tabs update--
INSERT INTO `widgets` (`uuid`, `type`, `title`, `file`, `roleid`, `moduleid`, `default`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES ('wdgt:c0a56726-d855-7443-66a2-7b84f443a84c', 'big', 'New Sales Orders', '../bms/widgets/recentsalesorders/class.php', '20', '2', '1', 1, NOW(), 1, NOW());
INSERT INTO `widgets` (`uuid`, `type`, `title`, `file`, `roleid`, `moduleid`, `default`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES ('wdgt:26936c27-7b7c-07fc-1f35-97d2410688b5', 'big', 'New Clients', '../bms/widgets/recentclients/class.php', '20', '2', '1', 1, NOW(), 1, NOW());
INSERT INTO `widgets` (`uuid`, `type`, `title`, `file`, `roleid`, `moduleid`, `default`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES ('wdgt:06a30e04-55ad-75da-7bd6-0c4203210ac8', 'little', 'Accounts Receivable Statistics', '../bms/widgets/arstats/class.php', '80', '2', '1', 1, NOW(), 1, NOW());
UPDATE `tabledefs` SET `canpost` = 1 WHERE id IN(3, 304);
CREATE TABLE `postingsessions` (`id` int(11) NOT NULL auto_increment,`sessiondate` datetime NOT NULL default '0000-00-00 00:00:00',`source` varchar(64) NOT NULL default '',`recordsposted` int(11) NOT NULL default '0', `userid` int(11) NOT NULL default '0', UNIQUE KEY `theid` (`id`)) ENGINE=INNODB;
INSERT INTO `tabledefs` (`id`, `displayname`, `type`, `moduleid`, `maintable`, `querytable`, `editfile`, `editroleid`, `addfile`, `addroleid`, `importfile`, `importroleid`, `searchroleid`, `advsearchroleid`, `viewsqlroleid`, `deletebutton`, `canpost`, `defaultwhereclause`, `defaultsortorder`, `defaultsearchtype`, `defaultcriteriafindoptions`, `defaultcriteriaselection`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES ('307', 'Posting Sessions', 'table', '2', 'postingsessions', '(postingsessions INNER JOIN users ON postingsessions.userid = users.id)', 'N/A', '0', 'N/A', '0', NULL, '-100', '50', '-100', '-100', 'NA', '0', 'YEAR(postingsessions.sessiondate) = YEAR(NOW()) AND MONTH(postingsessions.sessiondate) = MONTH(NOW())', 'postingsessions.sessiondate DESC', NULL, NULL, NULL, 1, NOW(), 1, NOW());
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`, `roleid`) VALUES ('307', 'id', 'postingsessions.id', 'left', '', '0', '', '0', '', NULL, '0');
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`, `roleid`) VALUES ('307', 'date', 'postingsessions.sessiondate', 'left', '', '1', '', '0', '', 'datetime', '0');
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`, `roleid`) VALUES ('307', 'source', 'postingsessions.source', 'left', '', '2', '', '0', '', NULL, '0');
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`, `roleid`) VALUES ('307', 'user', 'concat(users.firstname,\" \",users.lastname) ', 'left', '', '3', '', '1', '100%', NULL, '0');
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`, `roleid`) VALUES ('307', 'records', 'postingsessions.recordsposted', 'right', '', '4', '', '0', '', NULL, '0');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('307', 'All Records', 'postingsessions.id!=-1', '2', '0');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('307', 'This Month\'s Sessions', 'YEAR(postingsessions.sessiondate) = YEAR(NOW()) AND MONTH(postingsessions.sessiondate) = MONTH(NOW())', '0', '0');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('307', 'Last Month\'s Sessions', 'YEAR(postingsessions.sessiondate) = YEAR(DATE_SUB(NOW(),INTERVAL 1 MONTH)) AND MONTH(postingsessions.sessiondate) = MONTH(DATE_SUB(NOW(),INTERVAL 1 MONTH))', '1', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('307', 'new', '0', '0', '0', '0', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('307', 'edit', '0', '1', '0', '0', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('307', 'printex', '1', '0', '0', '0', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('307', 'select', '1', '0', '0', '0', '0');
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `needselect`, `othercommand`, `roleid`, `displayorder`) VALUES ('307', 'import', '0', '0', '0', '-100', '0');
INSERT INTO `tablesearchablefields` (`tabledefid`, `field`, `name`, `displayorder`, `type`) VALUES ('307', 'postingsessions.id', 'id', '2', 'field');
INSERT INTO `tablesearchablefields` (`tabledefid`, `field`, `name`, `displayorder`, `type`) VALUES ('307', '(users.lastname LIKE \"{{value}}%\" OR users.firstname LIKE \"{{value}}%\")', 'user', '1', 'whereclause');
ALTER TABLE `invoices` ADD COLUMN `postingsessionid` int(11) default NULL;
ALTER TABLE `receipts` ADD COLUMN `postingsessionid` int(11) default NULL;
INSERT INTO `relationships` (`tofield`, `name`, `fromfield`, `fromtableid`, `totableid`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`, `inherint`) VALUES ('id', 'posting sessions', 'postingsessionid', '3', '307', 1, NOW(), 1, NOW(), '0');
INSERT INTO `relationships` (`tofield`, `name`, `fromfield`, `fromtableid`, `totableid`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`, `inherint`) VALUES ('id', 'posting sessions', 'postingsessionid', '304', '307', 1, NOW(), 1, NOW(), '0');
INSERT INTO `relationships` (`tofield`, `name`, `fromfield`, `fromtableid`, `totableid`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`, `inherint`) VALUES ('postingsessionid', 'sales orders', 'id', '307', '3', 1, NOW(), 1, NOW(), '0');
INSERT INTO `relationships` (`tofield`, `name`, `fromfield`, `fromtableid`, `totableid`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`, `inherint`) VALUES ('postingsessionid', 'receipts', 'id', '307', '304', 1, NOW(), 1, NOW(), '0');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:7261b6a1-6424-77a6-6a02-eada540ec092', 'Client', '', '0', '0', 1, 1, NOW(), NOW(), '20');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:42d221f6-37ef-c755-e335-39d00e3fda58', 'Quick View', 'modules/bms/quickview.php', 'menu:7261b6a1-6424-77a6-6a02-eada540ec092', '0', 1, 1, NOW(), NOW(), '10');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:d080b1a3-6fac-ae6e-2457-b969a8d67996', 'Clients', 'search.php?id=2', 'menu:7261b6a1-6424-77a6-6a02-eada540ec092', '10', 1, 1, NOW(), NOW(), '10');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:96809579-305c-19c3-042b-405e7763a000', 'Check for Duplicates', 'search.php?id=18', 'menu:7261b6a1-6424-77a6-6a02-eada540ec092', '20', 1, 1, NOW(), NOW(), '10');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:8cf7d073-72b9-93db-6d07-14578e2a694f', 'Sales', '', '0', '1', 1, 1, NOW(), NOW(), '10');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:652204a6-c0c3-e0b7-d0e4-919c3f3f64f9', 'Sales Orders', 'search.php?id=3', 'menu:8cf7d073-72b9-93db-6d07-14578e2a694f', '10', 1, 1, NOW(), NOW(), '10');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:23960b0a-316e-0070-8d64-0834aa443187', 'Item Analysis', 'search.php?id=5', 'menu:8cf7d073-72b9-93db-6d07-14578e2a694f', '55', 1, 1, NOW(), NOW(), '30');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:7cc050a6-9742-ca54-3a19-3d08867e7cf7', 'Discounts', 'search.php?id=25', 'menu:8cf7d073-72b9-93db-6d07-14578e2a694f', '40', 1, 1, NOW(), NOW(), '30');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:e7bb833c-a3ac-0619-88d2-990ab53e63e6', 'Tax Areas', 'search.php?id=6', 'menu:8cf7d073-72b9-93db-6d07-14578e2a694f', '70', 1, 1, NOW(), NOW(), '50');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:6f119c0c-241e-4dd8-42c9-c7321e9d5b53', 'Product', '', '0', '2', 1, 1, NOW(), NOW(), '10');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:4d49690e-980b-c705-271e-376339dde62f', 'Products', 'search.php?id=4', 'menu:6f119c0c-241e-4dd8-42c9-c7321e9d5b53', '0', 1, 1, NOW(), NOW(), '10');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:24861935-096d-ed0b-98ce-2273da3054c6', 'Product Categories', 'search.php?id=7', 'menu:6f119c0c-241e-4dd8-42c9-c7321e9d5b53', '1', 1, 1, NOW(), NOW(), '30');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:8f14c059-2ff4-0ca6-21ec-7204c3cddb20', 'Prerequisites', 'search.php?id=8', 'menu:6f119c0c-241e-4dd8-42c9-c7321e9d5b53', '2', 1, 1, NOW(), NOW(), '20');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:9352a813-3c5a-efd4-71dc-a5b8bcac2e3d', 'Shipping Methods', 'search.php?id=300', 'menu:8cf7d073-72b9-93db-6d07-14578e2a694f', '80', 1, 1, NOW(), NOW(), '30');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:23c6a92e-932b-4861-1050-561b5f35f3a1', 'Payment Methods', 'search.php?id=301', 'menu:8cf7d073-72b9-93db-6d07-14578e2a694f', '90', 1, 1, NOW(), NOW(), '30');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:48d55385-ce5e-53ca-34c2-1861da882442', '----', 'N/A', 'menu:8cf7d073-72b9-93db-6d07-14578e2a694f', '50', 1, 1, NOW(), NOW(), '30');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:96171e3f-2499-9e75-248e-45d637df9128', 'Invoice Statuses', 'search.php?id=302', 'menu:8cf7d073-72b9-93db-6d07-14578e2a694f', '80', 1, 1, NOW(), NOW(), '30');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:f020a94f-f78f-c1f9-cd32-133089704403', 'Email Projects', 'search.php?id=22', 'menu:7261b6a1-6424-77a6-6a02-eada540ec092', '100', 1, 1, NOW(), NOW(), '-100');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:abd768e4-10b4-607c-a760-ee58366437e6', 'AR Items', 'search.php?id=303', 'menu:8cf7d073-72b9-93db-6d07-14578e2a694f', '20', 1, 1, NOW(), NOW(), '0');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:279a030f-75b5-27bc-68fa-9f6597f785d8', 'Receipts', 'search.php?id=304', 'menu:8cf7d073-72b9-93db-6d07-14578e2a694f', '30', 1, 1, NOW(), NOW(), '80');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:94c0a95d-3244-107f-2c85-f4207e5cec94', '----', 'N/A', 'menu:1e23c59e-c429-fec5-cc94-99b53c4fc6b0', '100', 1, 1, NOW(), NOW(), '50');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:1b9973a9-b1c7-8cf6-a5ea-ba041a19ac06', 'Post Records', 'modules/bms/post.php', 'menu:1e23c59e-c429-fec5-cc94-99b53c4fc6b0', '110', 1, 1, NOW(), NOW(), '50');
INSERT INTO `menu` (`uuid`, `name`, `link`, `parentid`, `displayorder`, `createdby`, `modifiedby`, `creationdate`, `modifieddate`, `roleid`) VALUES ('menu:07b85ffa-178b-f20f-36db-c2ca99274124', 'Posting Sessions', 'search.php?id=307', 'menu:1e23c59e-c429-fec5-cc94-99b53c4fc6b0', '120', 1, 1, NOW(), NOW(), '50');
ALTER TABLE `addresses` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
ALTER TABLE `clients` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
ALTER TABLE `lineitems` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
ALTER TABLE `discounts` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
ALTER TABLE `invoicestatuses` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
ALTER TABLE `productcategories` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
ALTER TABLE `products` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
ALTER TABLE `receipts` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
ALTER TABLE `invoices` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
ALTER TABLE `shippingmethods` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
ALTER TABLE `paymentmethods` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
ALTER TABLE `tax` ADD COLUMN `custom1` DOUBLE, ADD COLUMN `custom2` DOUBLE, ADD COLUMN `custom3` DATETIME, ADD COLUMN `custom4` DATETIME, ADD COLUMN `custom5` VARCHAR(255), ADD COLUMN `custom6` VARCHAR(255), ADD COLUMN `custom7` TINYINT(1) DEFAULT 0, ADD COLUMN `custom8` TINYINT(1) DEFAULT 0;
-- Preping Product Categories to be more shopping cart synchronization friendly --
ALTER TABLE `productcategories` ADD COLUMN `parentid` int(11) NOT NULL DEFAULT 0 AFTER `name`, ADD COLUMN `displayorder` INT(11) NOT NULL DEFAULT 0 AFTER `parentid`;

--Update tabledefs--
UPDATE `tabledefs` SET `hascustomfields` = 1 WHERE `id` IN(306, 2, 5, 25, 302, 7,4, 304,3, 300, 6, 301);
UPDATE `tabledefs` SET `querytable` = '(productcategories LEFT JOIN productcategories AS `parents` ON productcategories.parentid = parents.id)' WHERE id = 7;
UPDATE `tabledefs` SET `uuid`='tbld:6d290174-8b73-e199-fe6c-bcf3d4b61083' WHERE `id`='2';
UPDATE `tabledefs` SET `uuid`='tbld:62fe599d-c18f-3674-9e54-b62c2d6b1883' WHERE `id`='3';
UPDATE `tabledefs` SET `uuid`='tbld:7a9e87ed-d165-c4a4-d9b9-0a4adc3c5a34' WHERE `id`='4';
UPDATE `tabledefs` SET `uuid`='tbld:31423480-a9b0-f0ff-749e-b3b5e18ca93c' WHERE `id`='5';
UPDATE `tabledefs` SET `uuid`='tbld:c9ff2c8c-ce1f-659a-9c55-31bca7cce70e' WHERE `id`='6';
UPDATE `tabledefs` SET `uuid`='tbld:3342a3d4-c6a2-3a38-6576-419299859561' WHERE `id`='7';
UPDATE `tabledefs` SET `uuid`='tbld:8179e105-5487-5173-d835-d9d510cc7f1b' WHERE `id`='8';
UPDATE `tabledefs` SET `uuid`='tbld:f993cf23-ad4a-047b-e920-d45fee1dc08e' WHERE `id`='18';
UPDATE `tabledefs` SET `uuid`='tbld:157b7707-5503-4161-4dcf-6811f8b0322f' WHERE `id`='22';
UPDATE `tabledefs` SET `uuid`='tbld:455b8839-162b-3fcb-64b6-eeb946f873e1' WHERE `id`='25';
UPDATE `tabledefs` SET `uuid`='tbld:fa8a0ddc-87d3-a9e9-60b0-1bab374b2993' WHERE `id`='300';
UPDATE `tabledefs` SET `uuid`='tbld:380d4efa-a825-f377-6fa1-a030b8c58ffe' WHERE `id`='301';
UPDATE `tabledefs` SET `uuid`='tbld:d6e4e1fb-4bfa-cb53-ab9c-1b3e7f907ae2' WHERE `id`='302';
UPDATE `tabledefs` SET `uuid`='tbld:c595dbe7-6c77-1e02-5e81-c2e215736e9c' WHERE `id`='303';
UPDATE `tabledefs` SET `uuid`='tbld:43678406-be25-909b-c715-7e2afc7db601' WHERE `id`='304';
UPDATE `tabledefs` SET `uuid`='tbld:e3ce122f-7c43-cfca-fd32-11c663567a2a' WHERE `id`='305';
UPDATE `tabledefs` SET `uuid`='tbld:27b99bda-7bec-b152-8397-a3b09c74cb23' WHERE `id`='306';
UPDATE `tabledefs` SET `uuid`='tbld:97760a4f-1c1a-a108-d05f-5fc4ec59583c' WHERE `id`='307';
--end Update tabledefs--

DELETE FROM `tablecolumns` WHERE `tabledefid` = 7;
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`, `roleid`) VALUES ('7', 'name', 'if(productcategories.description, concat(\'[b]\', productcategories.name,\'[/b][br]\',productcategories.description), concat(\'[b]\', productcategories.name,\'[/b]\'))', 'left', '', '1', 'productcategories.name', '0', '100%', 'bbcode', '0');
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`, `roleid`) VALUES ('7', 'parent category', 'if(parents.name, parents.name, \'No Parent\')', 'left', '', '2', '', '0', '', NULL, '0');
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`, `roleid`) VALUES ('7', 'display order', 'productcategories.displayorder', 'right', '', '3', '', '0', '', NULL, '0');
INSERT INTO `tablecolumns` (`tabledefid`, `name`, `column`, `align`, `footerquery`, `displayorder`, `sortorder`, `wrap`, `size`, `format`, `roleid`) VALUES ('7', 'web', 'productcategories.webenabled', 'center', '', '0', '', '0', '', 'boolean', '0');
CREATE TABLE `productstoproductcategories` (
  `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `productid` INTEGER UNSIGNED NOT NULL,
  `productcategoryid` INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(`id`)
) ENGINE=INNODB;
UPDATE `tabledefs` SET `querytable` = '(products LEFT JOIN productcategories ON products.categoryid = productcategories.id)' WHERE `id`=4;
--update/insert smartsearches--
UPDATE `smartsearches` SET `uuid`='smrt:5cf171f7-2284-1492-62bb-872bc222eaef' WHERE `id`='1';
UPDATE `smartsearches` SET `uuid`='smrt:1b16f1e8-edf2-332e-e61b-3759f7020d41' WHERE `id`='3';
UPDATE `smartsearches` SET `uuid`='smrt:5634f7fb-a0c8-7e10-4c96-8bb043e7f478' WHERE `id`='4';
UPDATE `smartsearches` SET `uuid`='smrt:32f76377-1822-17f5-674c-118b678378d4' WHERE `id`='6';
UPDATE `smartsearches` SET `uuid`='smrt:a18ca9d4-58aa-7a47-faa7-1ad0ed5ba8c6' WHERE `id`='7';
UPDATE `smartsearches` SET `uuid`='smrt:3b48afbf-f18f-a18d-8aa8-f51f27008750' WHERE `id`='8';
INSERT INTO `smartsearches` (`uuid`, `name`, `fromclause`, `valuefield`, `displayfield`, `secondaryfield`, `classfield`, `searchfields`, `filterclause`, `rolefield`, `tabledefid`, `moduleid`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES ('smrt:eed8c810-f9c8-077b-4b3e-9aef451f8057 ', 'Pick Product Category For Product', 'productcategories', 'productcategories.id', 'productcategories.name', '\'\'', '\'\'', 'productcategories.name', 'productcategories.inactive = 0', '\'\'', '7', '2', 1, NOW(), 1, NOW());
--end smartsearches --
-- Adding UUID prefix for BMS tables --
UPDATE `tabledefs` SET `prefix` = 'tax' WHERE id = 6;
UPDATE `tabledefs` SET `prefix` = 'smtd' WHERE id = 300;
UPDATE `tabledefs` SET `prefix` = 'cli' WHERE id = 2;
UPDATE `tabledefs` SET `prefix` = 'rcpt' WHERE id = 304;
UPDATE `tabledefs` SET `prefix` = 'prod' WHERE id = 4;
UPDATE `tabledefs` SET `prefix` = 'pcat' WHERE id = 7;
UPDATE `tabledefs` SET `prefix` = 'sord' WHERE id = 3;
UPDATE `tabledefs` SET `prefix` = 'paym' WHERE id = 301;
UPDATE `tabledefs` SET `prefix` = 'inst' WHERE id = 302;
UPDATE `tabledefs` SET `prefix` = 'dsct' WHERE id = 25;
UPDATE `tabledefs` SET `prefix` = 'arit' WHERE id = 303;
UPDATE `tabledefs` SET `prefix` = 'addr' WHERE id = 306;

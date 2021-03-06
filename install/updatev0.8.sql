UPDATE `tablefindoptions` SET  `search` = 'log.id!=-1' WHERE `search`='lg.id!=-1';
ALTER TABLE `tabs` MODIFY COLUMN `displayorder` INTEGER NOT NULL DEFAULT 0, MODIFY COLUMN `enableonnew` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0, MODIFY COLUMN `roleid` INTEGER NOT NULL DEFAULT 0;
INSERT INTO `settings` (`name`, `value`) VALUES ('persistent_login','0');
INSERT INTO `settings` (`name`, `value`) VALUES ('login_refresh','2');
ALTER TABLE `tablecolumns` ADD COLUMN `roleid` INTEGER UNSIGNED NOT NULL DEFAULT 0;
INSERT INTO `tabs` (`id`,`name`, `tabgroup`, `location`, `displayorder`, `enableonnew`, `roleid`, `tooltip`, `notificationsql`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (100,'groupings','tabledefs entry','modules/base/tabledefs_groupings.php',25,0,-100,'',NULL,1,NOW(),1,NOW());
CREATE TABLE `tablegroupings` (`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT, `tabledefid` INTEGER UNSIGNED NOT NULL, `field` TEXT NOT NULL, `displayorder` INTEGER UNSIGNED NOT NULL DEFAULT 0, `ascending` TINYINT UNSIGNED NOT NULL DEFAULT 0, `name` VARCHAR(64), `roleid` INTEGER UNSIGNED NOT NULL DEFAULT 0, PRIMARY KEY(`id`));
INSERT INTO `tableoptions` (`tabledefid`, `name`, `option`, `othercommand`, `roleid`) VALUES (16,'printex','1',0,0);
INSERT INTO `reports` (`name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES ('SQL Export', 'export', '0', '0', '-100', 'report/general_sql.php', 'Generate SQL INSERT statements for records.', 1, NOW(), 1, NOW());
INSERT INTO `tablegroupings` (`tabledefid`, `field`, `displayorder`, `ascending`, `name`, `roleid`) VALUES (203,'tabs.tabgroup',1,1,'Group',0);
INSERT INTO `tablegroupings` (`tabledefid`, `field`, `displayorder`, `ascending`, `name`, `roleid`) VALUES (11,'modules.name',1,0,'module',0);
INSERT INTO `tablegroupings` (`tabledefid`, `field`, `displayorder`, `ascending`, `name`, `roleid`) VALUES (19,'if(menu.parentid=0,concat( lpad(menu.displayorder,3,\"0\"), \" - \" ,menu.name )  , concat( lpad(parentmenu.displayorder,3,\"0\") , \" - \",parentmenu.name))',1,1,'',0);
INSERT INTO `tablegroupings` (`tabledefid`, `field`, `displayorder`, `ascending`, `name`, `roleid`) VALUES (16,'if(tabledefs.displayname is null,\"global\",tabledefs.displayname)',1,1,'',0);
INSERT INTO `tablegroupings` (`tabledefid`, `field`, `displayorder`, `ascending`, `name`, `roleid`) VALUES (10,'fromtable.displayname',1,1,'from table',0);
function onUpdateDatabase()
	print("> Updating database to version 3 (account refactor)")

	db.query([[
		CREATE TABLE IF NOT EXISTS `coins_transactions` (
			`id`          int(11)       UNSIGNED NOT NULL AUTO_INCREMENT,
			`account_id`  int(11)       UNSIGNED NOT NULL,
			`type`        tinyint(1)    UNSIGNED NOT NULL,
			`amount`      int(12)       UNSIGNED NOT NULL,
			`description` varchar(3500) NOT NULL,
			`timestamp`   timestamp     DEFAULT CURRENT_TIMESTAMP,
			INDEX `account_id` (`account_id`),
			CONSTRAINT `coins_transactions_pk` PRIMARY KEY (`id`),
			CONSTRAINT `coins_transactions_account_fk`
			  FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
			  ON DELETE CASCADE
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	]])

	db.query([[
		ALTER TABLE `accounts`
			MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
			MODIFY `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
			MODIFY `coins` int(12) UNSIGNED NOT NULL DEFAULT '0',
			MODIFY `creation` int(11) UNSIGNED NOT NULL DEFAULT '0'
		;
	]])

	return true
end

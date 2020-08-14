# myaac
MyAAC is a free and open-source Automatic Account Creator (AAC) written in PHP. It is a fork of the [Gesior](https://github.com/gesior/Gesior2012) project. It supports only MySQL databases.

Official website: https://my-aac.org

### REQUIREMENTS

	- PHP 5.5 or later
	- MySQL database
	- PDO PHP Extension
	- XML PHP Extension
	- ZIP PHP Extension
	- (optional) mod_rewrite to use friendly_urls

### INSTALLATION AND CONFIGURATION

	Just decompress and untar the source (which you should have done by now,
	if you're reading this), into your webserver's document root.

	MyAAC needs proper permissions to handle files correctly.
	If you're using apache2, then your directory needs to have owner set to: www-data, you can do it by using following command:
		chown -R www-data.www-data /var/www/*
			(or any other path your MyAAC installation is located at..)

	  Note: Linux only
		If you're under linux use these commands to set proper permissions:
			chmod 660 config.local.php
			chmod 660 images/guilds
			chmod 660 images/houses
			chmod 660 images/gallery
			chmod -R 770 system/cache

	Visit http://your_domain/install (http://localhost/install) and follow instructions in the browser.

### KNOWN PROBLEMS

	- none -

### OTHER NOTES

	If you have a great idea or want contribute to the project - visit our website at https://www.my-aac.org

### LICENSING

	This program and all associated files are released under the GNU Public
	License, see LICENSE for details.

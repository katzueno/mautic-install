# Mautic Install Shell Script for Cloud9

This is simple shell script to install Mautic on [Cloud9](https://c9.io/c/t3lGIvLecba). Cloud9 is the cloud service to provide online code editor and Ubuntu server. They offer a free account!

I made this shell script for [Mautic Meetup Nagoya](http://www.meetup.com/Mautic-Meetup-Nagoya/) workshops, and creating a quick demo.

Currently, this script downloads and deploy Mautic version 2.1.1.

## STEP 1: Create a worksplace

- Sign up and create an account at [Cloud9](https://c9.io/c/t3lGIvLecba).
- Create a workspace on Cloud9 using Apache+MySQL+PHP template

## STEP 2: Initiate MySQL

Copy the following texts and paste onto the Cloud9 bash terminal window to start MySQL and create user and password.

```
mysql-ctl start
mysql-ctl cli
CREATE USER 'mautic'@'127.0.0.1' IDENTIFIED BY 'mautic';
GRANT ALL PRIVILEGES ON *.* TO 'mautic'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit;

```

## STEP 3: Install PHP 7 onto Cloud9

Copy the following text one by one and paste on to the Cloud9 bash terminal window to install PHP ver 7

```
sudo apt-get update
sudo apt-get install libmcrypt-dev
sudo apt-get install php-mcrypt
sudo apt-get install php-curl
wget -O - https://raw.githubusercontent.com/GabrielGil/c9-lemp/master/install.sh | bash
```

## STEP 4: Start LEMP

From now on, you will need to use the following commands to start and stop nignx.
You CANNOT use the start and stop menu any more.


Start the services
```
lemp start
```

Stop the services
```
lemp stop
```

## STEP 5: Download & run the script

Copy the following text and paste onto the Cloud9 terminal window to download and initiate Mautic install.


```
curl https://raw.githubusercontent.com/katzueno/mautic-install-shell/master/install-mautic-cloud9.bash | bash

```

## STEP 6: Launch your browser, and proceed to browser installation

- Click "Run" to start running apache
- Click "Preview" - "Preview Running Application" to launch cloud9 installation page
- Proceed to installation

Use the following MySQL information during `STEP 1: Mautic Installation - Database Setup`.

Type              | Content
------------------|-----
Database Driver   | MySQL PDO
Database Host     | 127.0.0.1
Database Port     | 3306
Database Name     | c9
Database Table Prefix | -- (blank)
Database Username | mautic
Database Password | mautic

Enter the rest of the required information as you wish.

# Pull request is welcome!

I just made this shell script really quick in 30min. I encourage you to suggest new feature and send me a pull request to add more feature and options.

# Credit

@katzueno (concret5 Japan, Inc.)

concrete5 Japan, Inc. is helping various company's concrete5 & Mautic project. Please feel free to contact us at any time for your project needs. We can work internationally.

https://concrete5.co.jp/

# License

This shell script is released under MIT License.


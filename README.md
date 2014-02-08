#Code Online Judge (CodeOJ)

 CodeOJ is a judge system used to test correctness and efficiency of programs written for various programming languages in coding contests,Recruiters can conduct Hiring Challenges and for intra-inter college coding competitions.
 CodeOJ aims to build an environment for the people, specifically students,around the world to interact, practice and improve their programming skills.

##Core Technologies Used 
 
 Why Choose Java : Java makes the Application platform Independent .“Write Once, Run Anywhere”


- Java for Standard Edition (J2SE)
- Java for Enterprise Edition (J2EE)
- Object Relational Mapping (ORM) using Hibernate Framework 3 by JBOSS : Hibernate makes the Judge Database Independent
- Java Beans
- Java Mail,JSTL,JUNIT for Unit Testing
- Python for Judge Script
- Twitter Bootstrap,Ajax,jQuery,JSON,CSS,HTML (Frontend)
- Database : Mysql
- Sandboxing : chroot(jail) 

##Features

- Automatic Judging
- Web Interface for Portability and simplicity

	+ Beginners Corner : Contains problems for beginners
	+ Practice Corner :  Contains problems of previous contests
	+ Live Programming Contests (Past contest,Current and Upcoming) 
	+ Admin Panel : to set the contests & problems & Rate the User

- Designed keeping security in mind
- All code run in private mode
- Judge and project run inside chroot (in linux)
- Has been used for live contest


##Sandboxing : to prevent hackers to shutdown your server

you can configure chroot(jail) on your system read chroot.txt (if interested)

- code is frequently buggy and potentially malicious.
- Code must run in a restricted environment (sandbox) to prevent it from damaging the system.
- Resources (particularly, CPU time and memory) must be restricted.
- Programs must be limited to a single thread.
Programs must not be permitted to spawn other processes.
- Programs must not be permitted to initiate system calls.
- Programs must not be able to communicate through TCP/IP Sockets.



##Pre-requisites and Configuration

- Download and install Netbeans 7.1 : Quickly and easily develop desktop, mobile and web applications
with Java, JavaScript, HTML5, PHP, C/C++ and more.NetBeans IDE is FREE, open source, and has a worldwide community of users and developers. 

	+ Select Platform Linux x64 & all section
	+ https://netbeans.org/downloads/

	+In terminal,navigate to download directory & run
```
	sh netbeans-8.1-linux.sh
```
	+ select tomcat server instead of glassfish during installation


- Update your system : Ubuntu Source list generator: https://repogen.simplylinux.ch/generate.php

```
	sudo apt-get update
	sudo apt-get upgrade
```

- Install MySQL

```
	sudo apt-get install mysql-server
```

	+ Start/Stop Mysql server 
	
	```
		sudo service mysql start
		sudo service mysql stop
	```

	+ To log in to MySQL as the root user:
	
	```
		mysql -u root -p
	```

	+ Create a New MySQL User and Database

	```
		create database testdb;
		create user 'testuser'@'localhost' identified by 'password';
		grant all on testdb.* to 'testuser';
	```




- Install phpmyadmin : phpMyAdmin is a web application that provides a GUI to aid in MySQL database administration

	+ Step 1: Install Apache2, PHP and MySQL. We assume you already have installed LAMP on your system.

		- Install Apache 
		```
			sudo apt-get install apache2
			sudo service apache2 restart
		```

		- Install PHP

		```
			sudo apt-get install php5
		```
				
		-If you need MySQL support also install php5-mysql
		
		```
			sudo apt-get install php5-mysql
		```

	+ Step 2: Install phpMyAdmin.

	```
		sudo apt-get install phpmyadmin
	```

		- After the installation has completed, add phpmyadmin to the apache configuration.
		```
			sudo vi /etc/apache2/apache2.conf
		```

		- Add the phpmyadmin config to the file.
		```
			Include /etc/phpmyadmin/apache.conf
		```

		- Restart apache:
		```
			sudo service apache2 restart
		```

#Configuration

- Download the repository in Extract to NetBeansProjects folder of your home directory

- Open Netbeans and import project 

- Change path in src/java/connection/Path.java
	``` 
    	static String path = "/home/<YOUR_PC_USERNAME>/NetBeansProjects/codeoj/web";
	```

-Give permission to codeoj folder for creating directories & codefiles
```
	chmod -R 777 codeoj
```


##Install packages

	```
		sudo apt-get install python-psutil
		sudo apt-get install python-mysqldb
	```

	- Install the compilers of  programming languages you need on your system with sudo apt-get
	- Languages : Java, C, C++, Pascal,PHP, Perl, Ruby and Python,Haskell,Pike etc.





##Database 

- Goto http://localhost/phpmyadmin
- Create database named "code_online_judge"

- Change user and pass in src/java/connection/Config.java
```
    String url = "jdbc:mysql://localhost:3306/code_online_judge";
    String user = "<YOUR_MYSQL_USER>";
    String pass = "<YOUR_MYSQL_PASSWORD>";
```    

- Open judge.py in web folder & change line 72 and line 316 with your database username and password
```
        db = MySQLdb.connect("localhost","db_user","db_pass","code_online_judge")
```



##To Run : 

- Right click on Project codeoj & select deploy to run the project
- No need to import the database as hibernate framework will take care of it.
- Add username & password(md5) in Admin Table for admin panel access

```
	goto http://localhost/codeoj/ap/adminpanel.jsp
```

- Add Entry with integer 1 in id Table for unique codefilename generator

- Goto admin panel to set a contest: 
	
	+ Contest Code(without spaces)
	+ Contest Name
	+ Contest Timing,Poster,no. of problems and instructions for contest

- Set problems : 
	
	+ problem code (should be in format CONTESTCODE<s.no>) e.g TEST1,TEST2 (if contest name is TEST)
	+ Problems name,setter,tester,timelimit(should be integer in seconds)
	+ Problems Description and Number of TEST FILES(should be in format in<s.no>.txt and out<s.no>.txt) e.g in1.txt,in2.txt,out1.txt,out2.txt 

- During Contest User should register for contest on: 

```
	http://localhost/codeoj/index.jsp
```
	+ User can View problems,Comment on problems,View his submissions and LeaderBoard
	+ To Submit, select language and paste your code in the editor itself or browse the codefile & Judge will return the verdict in a while.


- After Contest Ends : 
	
	+ Make solutions public by clicking on "Make public" tab
	+ Update the Ratings of the Users participated in contest (ELO Algorithm is used to calculate Ratings)


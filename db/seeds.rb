# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Article.create!(title: "wechat", subtitle: "You know what to do", body: "", stamp: "link") if Article.find_by(title: "wechat") == nil
Article.find_by(title: "wechat").update(body: "	![](http://a2.qpic.cn/psb?/V14aEuir4EVGZU/D7hr7NBesSOU7pkHeDjbjKQss0LQCc2OpVVl9StNGHY!/c/dF0BAAAAAAAA&ek=1&kp=1&pt=0&bo=AAIAAgAAAAABACc!&sce=0-12-12&rf=0-18)")

Article.create!(title: "Zephyr Sails", subtitle: "This is my résumé", body: "", stamp: "link") if Article.find_by(title: "Zephyr Sails") == nil
Article.find_by(title: "Zephyr Sails").update(body: %(## Zephyr Sails
South China University of Technology, Panyu District, Guangzhou, P.R.China, 510006
+86 136-6025-8612, zephyrsails@gmail.com

----

### ACADEMIC INFORMATION
- Bachelor of Engineering in Software Engineering
- Date of Graduation: July 2016
- South China University of Technology, Guangzhou, China
- GPA: 3.69/4.00
- Ranking in department: 12/239

----

### TECHNICAL EXPERIENCE
#### Backend developer (intern)
- September                 2015 - Now
- Guangzhou Midia Information Technology Limited, Guangzhou, China.
- Used Technique: Ruby on Rails
- Under the guidance of my supervisor, implementing a new middleware system between company’s primary backend and SMS third parties, to offer reliable SMS service for primary backend via APIs. The system will implement a buffer system to queue incoming SMS request, then dispatch them to multiple third parties to launch the SMS message. There will be a retry and acknowledge mechanism to make sure the message being delivered successfully. This system will be launched online before “double eleven” (November 11th), the largest online shopping day in China.


#### Pedometer Application for Android
- June – July 			    2015
- Used Techniques: Data Analysis, Android Development
- Lead four students to design an algorithm to count step according to accelerometer data. Then deploy the algorithm to Android smartphone. The algorithm can recognize if the phone is placed in pocket, and distinguish the movement of different legs. The accuracy is over 95% in experimental data and over 90% in practice. Using BaiduMap API, the application can also record walking track, and label the walking speed by different colors.


#### P2P based education & conference system
- September 2014 – May      2015
- National Undergraduate Scientific and Technological Innovation Project
- Used Techniques: JavaScript, html5
- In charge of the development of an interactive sketchpad. Sketchpad is designed to make it easy-to-use. Using a buffer system to store the data, every graph user create can be rearranged. Via interface developed by my teammates, the sketchpad acquire P2P features, so the user can manipulate the sketchpad with other people at the same time.


#### Master the Mainframe IBM national contest
- September - November 	    2014
- Used Techniques: COBOL, DB2
- A contest held annually by IBM, including a series of subjects followed by a final challenge. In the final challenge, I build a retail management system using COBOL and DB2. To make the output data more readable, I reconstructed the system’s original output format, to let it print bar chart in IBM console.


#### Smart Pot
- July					    2014
- Used Techniques: python, C++
- Built a backend service to connect website and an embedded device (smart pot). The device can be controlled via a website (irrigation or illumination). The service can track pot’s status, including light intensity, humidity, and temperature, and adjust light intensity and humidity automatically.


#### Administration System for Android
- April – June		        2014
- Used Techniques: PHP, MySQL
- Lead 5 students to build an Android application. Apart from management responsibilities, my technical job is to implement 3NF database and interface for Android client.


#### Waterway publishing website frontend
- May – September	        2013
- Used Techniques: html5, Bootstrap, JavaScript
- SRP project, work as frontend developer. The website is designed to publish waterway information.


#### Warehouse Management program
- July – August		        2013
- Used Technique: C#
- Built a warehouse management program for my association (Association of Career Development for Students). The cargo list is displayed like inventory list in computer game, which you can add or delete or drag around item easily.

----

### HONORS
- Hua Wei Scholarship
	- December 		        2014
- Master the Mainframe Global Contest Bronze Prize
	- November 		        2014
- The Second Prize Scholarship
	- September 		    2013

----

### LEADERSHIP
- Volunteer Teacher of Robotics
	- August 			    2014
	- Guangdong Science Center – Robotics Summer Camp
- Monitor	of class
	- Sophomore year	    2013-2014
- Administration staff
	- Freshman year 	    2012-2013
	- Association of Career Development for Students
- Commissary in charge of studies
	- Freshman year	        2012-2013
- Master of Ceremonies (in multiple events)
	- Freshman year	        2012-2013

----

### INTERESTS
- Landscape Painting & Photographing
- Turn based computer game
))

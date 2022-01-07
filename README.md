# SQLZoo-Neeps-Database

This data is based on [Neeps database from SQLzoo](https://sqlzoo.net/wiki/Neeps_medium_questions) 

* The "Neeps" database includes details of all teaching events in the School of Computing at Napier University in Semester 1 of the 2000/2001 academic year.

* The timetable database contains the following tables:

staff
id	    name
co.ACg	Cumming, Andrew
co.ACr	Crerar, Dr Alison
co.AFA	Armitage, Dr Alistair
... Result truncated.

The staff table simply gives the unique identifier for each member of staff together with their full name.

student
id	      name	                sze	  parent
co1.BAe	  BAe	15	
co1.CO	  Computing 1st Year	  150	
co1.CO.a	Computing 1st Year a	20	  co1.CO
co1.CO.c	Computing 1st Year c	20	  co1.CO
co1.CO.d	Computing 1st Year d	20	  co1.CO
... Result truncated.

Each entry in the student table represents a group of students who follow the same timetable. The parent field is used to maintain a hierachy of groups. A student in group co1.CO.a is also in group co1.CO

room
id	          name	capacity	parent
co.117+118		      32	
co.117		          16	      co.117+118
co.118		          16	      co.117+118
co.B7		            40	
... result truncated

All classrooms are listed in the room table. The parent relation is used to maintain groupings. The row co.117+118 represents a pair of rooms - sometimes these rooms are used for a single event.


event
id	        modle	    kind	dow	      tod	    duration	room
co12004.L01	co12004	  L	    Wednesday	11:00	    1	      cr.SMH
co12004.L02	co12004	  L	    Monday	  17:00	    1	      cr.B13
co12004.T01	co12004	  T	    Monday	  11:00	    2	      co.G78+G82
co12004.T02	co12004	  T 	  Tuesday	  15:00	    2	      co.B7
co12004.T03	co12004	  T	    Tuesday	  13:00	    2	      co.G78+G82
... Result truncated.

Every event is associated with a single modle (deliberately mis-spelled version of module - which is a reserved word in one of engines). An event occurs on a particular day of the week (dow) at a particular time of day (tod). Every event has a duration specified as a whole number of hours.

attends
student	      event
co1.BAe	      co12004.L01
co1.CO	      co12004.L01
co1.IS	      co12004.L01
co1.SE.pt	    co12004.L02
co1.CO.a	    co12004.T01
... Result truncated.

The attends table links event to student. It realises the many to many relation.

teaches
staff	    event
co.AMn	  co12004.L01
co.RK	    co12004.L01
co.SRM	  co12004.L01
co.RK	    co12004.L02
co.SRM	  co12004.L02
... Result truncated.

The teaches table links event to staff.

occurs
event	      week
co12004.L01	01
co12004.L01	02
co12004.L01	03
co12004.L01	04
co12004.L01	05
... Result truncated.

Most events occur on weeks 01 to 13. This table records exactly which weeks are part of the plan for each event.

modle
id	    name
co12001	Rapid Application Development
co12002	Software Development 1A
co12003	Professional Skills
co12004	Applications Workshop
... Result truncated.

By the 21st century, the Gradgrindians had completed their assimilation of Education. The process of "modularisation" was just one of their crimes against learning.

week

id	wkstart
01	02/10/00
02	09/10/00
03	16/10/00
...Result truncated



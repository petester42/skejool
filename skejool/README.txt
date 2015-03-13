Before you do anything else, you should load the database with some data using the SQL file available in the the "sql" folder located in the root of the trunk.
From MySQL Workbench and open the Student.sql file select the schema (double-click soen341 schema) and run the script.
Student.sql is a temporary bootstrap script. We'll have to modify it as the work on the app progresses.

To compile and run the program in a Jetty server execute the following commands in the application’s root directory (where the POM is located):

	1.mvn clean install
	2.mvn jetty:run-war

Once the application is running you can make a soap request with the following Curl invocation (providing you have MySQL installed and student table configured):

	curl -v http://localhost:8080/skejool/students/9020955

or just open a browser and make the following request:

	http://localhost:8080/skejool/students/9020955

Retrieves a collection of courses (JSON content) according to the specified program ID.

	http://localhost:8080/skejool/sequence/byProgId/COEN

Retrieves a collection of courses (JSON content) according to the specified sequence ID.

	http://localhost:8080/skejool/sequence/bySequenceId/CompEngrSept


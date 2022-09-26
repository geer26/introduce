CREATE USER testuser WITH ENCRYPTED PASSWORD 'testpassword';
CREATE DATABASE mysite
	WITH OWNER = testuser 
	ENCODING = 'UTF8';
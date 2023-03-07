#BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I HAVE PERFORMED ALL 
#NO ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE 
#OR ONE OF OUR UNDERGRADUATE GRADERS. .  I UNDERSTAND THAT TO DO OTHERWISE
#IS A VIOLATION OF OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY.
#Name: Jason Fong Shen Yik


all: lab6.zip lab6
#zips all the file
lab6.zip: Makefile lab6main.c lab6.s
	zip lab6 lab6main.c lab6.s Makefile

#makes the executable file
lab6:
	gcc lab6.s lab6main.c -o lab6

#builds the c file from here
lab6main.c:
	gcc -ansi -pedantic -g -c lab6main.c

#cleans all the desired file
clean:
	rm -rf lab6
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;::;:::;::;:;:
;;;   The Object-Oriented Adventure Game
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;::;:::;::;::;
;;;        			  
;;; etuna@ku.edu.tr     Mon Dec  5 17:13:31 2016
;;;        			  
;;; Before you start:        			  
;;; * Please read the project handout available on the course
;;;   web site first to get a basic idea about the project and the
;;;   logic behind it, then to find out the details about what
;;;   your tasks are for the rest of the project.
;;;        			  
;;; * The following code should be studied and loaded for this
;;;   project.  Please do not modify these files, put all your work in
;;;   this file.        			  
;;;        			  
;;; - objsys.scm: support for an elementary object system
;;; - objtypes.scm: a few nice object classes
;;; - setup.scm: a bizarre world constructed using these classes
;;;        			  
;;; * Plan your work with pencil and paper before starting to code.
;;;        			  
;;; While you are working:        			  
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Use the procedure names given in the instructions.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code (in this file)
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;;        			  
;;;   *** NOTHING WRITTEN GETS EXCHANGED ***
;;;        			  
;;;        			  
;;; When you are done:        			  
;;; * Perform a final save and submit your work following the instructions.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please send an email comp200-common@ku.edu.tr if you have any questions.
;;; * Make sure your file loads without errors:
;;; ****************************************************************************
;;; ***  Your code should run without any syntactic errors. Projects  causing error will NOT be graded. ***
;;; ****************************************************************************
;;;        			  
;; Do NOT modify or delete the lines below.
(#%require (only racket/base random))
(load "objsys.scm")        			  
(load "objtypes.scm")        			  
(load "setup.scm")        			  
(define nil '())        			  
(define your-answer-here #f)        			  
;;;;;;;;;        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;::;:::;::;:::
;;; PART II. Programming Assignment
;;;        			  
;;; The answers to the computer exercises in Section 5 go in the
;;; appropriate sections below.
;;;        			  
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;::;:::;:::;;;
;;;;;;;;;;;;; Computer Exercise 0: Setting up ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;        			  
;;;;;;;;;;;;; CODES: ;;;;;;;;;;;;;
;;     

;(setup 'Saban)
(ask screen 'deity-mode #t)

        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;::;:::;:::;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;    


#||  
IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
Welcome to DrRacket, version 5.3.1 [3m].
Language: R5RS [custom]; memory limit: 128 MB.
ready
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
> (ask me 'look-around)   ;If I type (ask (ask me 'location) 'name) ,it gives just the location

You are in library            <<<<<<<-----
You are not holding anything. 
You see stuff in the room: engineering-book 
There are no other people around you. 
The exits are in directions: west east ok
> (ask me 'name)           <<<<<<<-----
saban
> (ask me 'say '(Hello World!))           <<<<<<<-----

At library saban says -- hello world! 
> (ask me 'go 'west)           <<<<<<<-----

saban moves from library to gym 
An earth-shattering, soul-piercing scream is heard... 
--- the-clock Tick 0 --- 
You are in gym 
You are not holding anything. 
You see stuff in the room: basketball 
There are no other people around you. 
The exits are in directions: east #t
> (ask me 'take (thing-named 'basketball))           <<<<<<<-----

At gym saban says -- I take basketball from gym 
> (ask me 'toss 'basketball)           <<<<<<<-----

At gym saban says -- I drop basketball at gym 
> (ask me 'die)           <<<<<<<-----

At gym saban says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
saban moves from gym to heaven 
At heaven saban says -- Hi alyssa-p-hacker game-over-for-you-dude
>
IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
|#

;;        			  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;;;::;;;;
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;;;::;;;:
;;;;;; Computer Exercise 1: Understanding installation;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;;;::;;:;
;;        			  
;;;;;;;;;;;;; ANSWER: ;;;;;;;;;;;;;
;;        			  

#|
Louis Reasoner suggests that it would be simpler
if we change the last line of the make-autonomous-person version of the install method (marked ; **) to read:
                    (ask person-part ’INSTALL) ))   ; **
Alyssa points out that this would be a bug. “If you did that,” she says,
“then when you make and install an autonomous person, and this person moves to a new place,
 he’ll be in two places at once!”

----With the expression (delegate person-part self ’INSTALL)))   ; **
1) Delegate teachs self how to install (from person-part)
2) Therefore,when we call install,self will completely be bound to person-part
3) Just after the installation,our newly created object is added to the place(from make-thing 'ADD-THING)
4) When the object moves from one place to another,its deleted from old place and added to the new place


-----With the expression (ask person-part ’INSTALL) ))   ; **
1)Self would be bound to person-part,not becoming autonomous-object completely
2)Then,we would be adding a person instead of autonomous-player to the place
3)Then,there is not going to be a autonomous object(just person-part is here) in the place
4)Because autonomous has not been added to the list,therefore when moving,it would not be deleted from things of place
5)But,after moving autonomous-player would be added to the new place
6)Thus,it will be in two places at once


|#    			  
        			  
;;        			  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;;;::;;::
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;;;::;:;;
;;;;;;;;;;;; Computer Exercise 2: Who just died? ;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;;;::;:;:
;;        			  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;        			  

#|

1-(ask heaven 'things) is the list of objects in the heaven
2-(map (lambda(object)(ask object 'name))(ask heaven 'things)) returns the names of the objects

|#

        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;;;::;::;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;

#|
question:If you know where the victim goes (and assuming you are not in deity-mode), what simple scheme expression can you evaluate to find out who just died?
------> when somebody dies,goes to the heaven therefore we can check up the heaven who is in there   			  



|#

;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;;;::;:::
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;
#|

Welcome to DrRacket, version 6.6 [3m].
Language: R5RS; memory limit: 128 MB.
ready
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
> (ask me 'say '(let me check whether somebody died))

At eng-z21 saban says -- let me check whether somebody died 
> (map (lambda(object)(ask object 'name))(ask heaven 'things))
()
> (ask me 'say '(there is nobody died,let me die))

At eng-z21 saban says -- there is nobody died ,let me die 
> (ask me 'say '( I am going to die now))

At eng-z21 saban says -- i am going to die now 
> (ask me 'die)

At eng-z21 saban says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
saban moves from eng-z21 to heaven game-over-for-you-dude
> (map (lambda(object)(ask object 'name))(ask heaven 'things))
(saban)
>
|#
;;        			  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;;;:::;;;
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;;;:::;;:
;;;;;;;; Computer exercise 3: Having a quick look ;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;:;::;;;;
;;        			  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;

;There is no change in code.
;We can have a quick look by
;(ask me 'go '<a direction>)

		  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;:;::;;;:
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;        			  

;Avatar already looks around when it enters a room
;Therefore,the transcript is following.
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;:;::;;:;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;        			  

#|
Welcome to DrRacket, version 6.6 [3m].
Language: R5RS; memory limit: 128 MB.
ready
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
> (ask me 'look-around)

You are in eng-building 
You are not holding anything. 
There is no stuff in the room. 
There are no other people around you. 
The exits are in directions: south in west north ok
> (ask me 'say '(I am going to go west,and automatically look around))

At eng-building saban says -- i am going to go west ,and automatically look around 
> (ask me 'go 'west)           <<<<<<<-----

saban moves from eng-building to parking-lot 
--- the-clock Tick 0 --- 
You are in parking-lot            <<<<<<<-----           <<<<<<<-----           <<<<<<<-----
You are not holding anything.            <<<<<<<-----           <<<<<<<-----
You see stuff in the room: fancy-cars            <<<<<<<-----           <<<<<<<-----
There are no other people around you.            <<<<<<<-----           <<<<<<<-----
The exits are in directions: east #t           <<<<<<<-----           <<<<<<<-----           <<<<<<<-----
> (ask me 'say '(I entered to parking-lot and had a quick look))

At parking-lot saban says -- i entered to parking-lot and had a quick look 
|#
        			  
;;        			  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;:;::;;::
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;:;::;:;;
;;;;;; Computer exercise 4: But I'm too young to die!! ;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;:;::;:;:
;;        			  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;        			  
        			  
(define (make-person name birthplace) ; symbol, location -> person
  (let ((mobile-thing-part (make-mobile-thing name birthplace))
	(container-part    (make-container))
	(health            3)        			  
	(strength          1)        			  
   (lives             3)
   (lifecounter       3))    ;I defined a lifecounter which has 3 life    			  
    (lambda (message)        			  
      (case message        			  
	((PERSON?) (lambda (self) #T))
	((STRENGTH) (lambda (self) strength))
	((HEALTH) (lambda (self) health))
        ((SAY)        			  
         (lambda (self list-of-stuff)
           (ask screen 'TELL-ROOM (ask self 'location)
                (append (list "At" (ask (ask self 'LOCATION) 'NAME)
                                 (ask self 'NAME) "says --")
                           list-of-stuff))
                  'SAID-AND-HEARD))
	((HAVE-FIT)        			  
	 (lambda (self)        			  
	   (ask self 'SAY '("Yaaaah! I am upset!"))
	   'I-feel-better-now))
        			  
	((PEOPLE-AROUND)	; other people in room...
	 (lambda (self)        			  
	   (let* ((in-room (ask (ask self 'LOCATION) 'THINGS))
		  (people (myfilter (lambda (x) (is-a x 'PERSON?)) in-room)))
	     (delq self people))))
        			  
	((STUFF-AROUND)		; stuff (non people) in room...
	 (lambda (self)        			  
	   (let* ((in-room (ask (ask self 'LOCATION) 'THINGS))
		  (stuff (myfilter (lambda (x) (not (is-a x 'PERSON?))) in-room)))
	     stuff)))        			  
        			  
	((PEEK-AROUND)		; other people's stuff...
	 (lambda (self)        			  
	   (let ((people (ask self 'PEOPLE-AROUND)))
	     (accumulate append '() (map (lambda (p) (ask p 'THINGS)) people)))))
        			  
	((TAKE)        			  
	 (lambda (self thing)        			  
	   (cond ((ask self 'HAVE-THING? thing)  ; already have it
		  (ask self 'SAY (list "I am already carrying"
				       (ask thing 'NAME)))
		  #f)        			  
		 ((or (is-a thing 'PERSON?)
		      (not (is-a thing 'MOBILE-THING?)))
		  (ask self 'SAY (list "I try but cannot take"
				       (ask thing 'NAME)))
		  #F)        			  
		 (else        			  
		  (let ((owner (ask thing 'LOCATION)))
		    (ask self 'SAY (list "I take" (ask thing 'NAME)
					 "from" (ask owner 'NAME)))
		    (if (is-a owner 'PERSON?)
			(ask owner 'LOSE thing self)
			(ask thing 'CHANGE-LOCATION self))
		    thing)))))        			  
        			  
	((LOSE)        			  
	 (lambda (self thing lose-to)
	   (ask self 'SAY (list "I lose" (ask thing 'NAME)))
	   (ask self 'HAVE-FIT)
	   (ask thing 'CHANGE-LOCATION lose-to)))
        			  
	((DROP)        			  
	 (lambda (self thing)        			  
	   (ask self 'SAY (list "I drop" (ask thing 'NAME)
				"at" (ask (ask self 'LOCATION) 'NAME)))
	   (ask thing 'CHANGE-LOCATION (ask self 'LOCATION))))
        			  
        ((GO-EXIT)        			  
         (lambda (self exit)        			  
           (ask exit 'USE self)))
        			  
	((GO)        			  
	 (lambda (self direction) ; person, symbol -> boolean
	   (let ((exit (ask (ask self 'LOCATION) 'EXIT-TOWARDS direction)))
	     (if (is-a exit 'EXIT?)
                 (ask self 'GO-EXIT exit)
		 (begin (ask screen 'TELL-ROOM (ask self 'LOCATION)
			     (list "No exit in" direction "direction"))
			#F)))))
	((SUFFER)        			  
	 (lambda (self hits)        			  
	   (ask self 'SAY (list "Ouch!" hits "hits is more than I want!"))
	   (set! health (- health hits))
	   (if (<= health 0) (ask self 'DIE))
	   health))        			  
        			  
	((DEATH-SCREAM)        			  
	 (lambda (self)        			  
	   (ask screen 'TELL-WORLD
		'("An earth-shattering, soul-piercing scream is heard..."))))
        			  
	((ENTER-ROOM)        			  
	 (lambda (self)        			  
	   (let ((others (ask self 'PEOPLE-AROUND)))
	     (if (not (null? others))
		 (ask self 'SAY (cons "Hi" (names-of others)))))
	   (ask (ask self 'location) 'make-noise self)
	   #T))        			  
        			  
	;; Here is the original DIE method
   #|        			  
	 ((DIE)        			  
	  (lambda (self)        			  
	    (ask self 'SAY '("SHREEEEK!  I, uh, suddenly feel very faint..."))
	    (for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION)))
	 	     (ask self 'THINGS))
	    (ask self 'DEATH-SCREAM)
	    (ask death-exit 'USE self)
	    'GAME-OVER-FOR-YOU-DUDE))
   |#        			  
	;; Your version goes here:
        
        ((DIE)        			  
  (lambda (self)
    (let ((location (ask me 'location)))
    (if (not(= lifecounter 0))  ;if I have lives remaining,then lifecounter-- until it gets 0
        (let ((x (- lifecounter 1)))
          (ask self 'SAY '("SHREEEEK!  I, uh, suddenly feel very faint..."))
	    (for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION)))
	 	     (ask self 'THINGS))
	    (ask self 'DEATH-SCREAM)
            (ask death-exit 'USE self)
          (ask me 'CHANGE-LOCATION location)
          
          (ask self 'SAY '(I am too young to die,therefore I am back!))
          (set! lifecounter x))
        (begin     ;when I have no life and I die,I really die.
	    (ask self 'SAY '("SHREEEEK!  I, uh, suddenly feel very faint..."))
	    (for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION)))
	 	     (ask self 'THINGS))
	    (ask self 'DEATH-SCREAM)
            (ask death-exit 'USE self)
        
	    'GAME-OVER-FOR-YOU-DUDE)
    ))))        			  
        			  
	(else (find-method message mobile-thing-part container-part))))))
	 #|	Another version --- (I am born back without being dead)	  
          ((DIE)        			  
  (lambda (self)
    (if (not(= lifecounter 0))  ;if I have lives remaining,then lifecounter-- until it gets 0
        (let ((x (- lifecounter 1)))
          (ask self 'SAY '(I am too young to die,therefore I am back!))
          (set! lifecounter x))
        (let ((y 0))     ;when I have no life and I die,I really die.
	    (ask self 'SAY '("SHREEEEK!  I, uh, suddenly feel very faint..."))
	    (for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION)))
	 	     (ask self 'THINGS))
	    (ask self 'DEATH-SCREAM)
            (ask death-exit 'USE self)
        
	    'GAME-OVER-FOR-YOU-DUDEsss)
    )))        			  
        			  
	(else (find-method message mobile-thing-part container-part))))))
        			  
  |#
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;:;::;::;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;        			  
        			  
#|

In first version
1)I run the program,and then I reinstalled the world by (setup <a new player>)
2)With new player,my code(make-person) started running in Project4.scm flie
3)When I die,I go to heaven,and I change my location by (ask me 'CHANGE-LOCATION <old location>)
4)Until I have lives,it changes location back to old location from heaven
5)When I have no more life,I die,go to heaven,then game over for me


In second version
1)I run the program,and then I reinstalled the world by (setup <a new player>)
2)With new player,my code(make-person) started running in Project4.scm flie
3)In code,I did not die,Just my lives are decreased from 3 to 0
4)if my lives > 0 then I am alive,if they are equal to 0 and I die,I die and go to heaven
5)I added lifecounter to the person class above in let,equal to 3
6)In transcript below,it shows how it is working.

|#
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;:;::;:::
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;        			  
#|

FOR THE FIRST VERSION
Welcome to DrRacket, version 6.6 [3m].
Language: R5RS; memory limit: 128 MB.
#f
#f
#f
#f
#f
#f
#f
> (setup 'me)
ready
> (ask me 'look-around)   <<<<----

You are in soccer-field    <<<<----I am here
You are not holding anything.    <<<<----I am not holding anything
You see stuff in the room: student-riot football 
You see other people: bomby cs-flash-hater qqqqq dddd 
The exits are in directions: south ok
> (ask me 'take (thing-named 'football))   <<<<----   <<<<----   <<<<----

At soccer-field me says -- I take football from soccer-field 
> (ask me 'die)   <<<<----   <<<<----

At soccer-field me says -- SHREEEEK!  I, uh, suddenly feel very faint...    <<<<----dies here
At soccer-field me says -- I lose football    <<<<----lose stuffs
At soccer-field me says -- Yaaaah! I am upset! 
An earth-shattering, soul-piercing scream is heard... 
me moves from soccer-field to heaven    <<<<----I went to heaven here
At soccer-field me says -- i am too young to die ,therefore i am back!    <<<<----I am back
> (ask me 'die)

At soccer-field me says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
me moves from soccer-field to heaven 
At soccer-field me says -- i am too young to die ,therefore i am back! 
> (ask me 'look-around)   <<<<----   <<<<----   <<<<----   <<<<----   <<<<----   <<<<----   <<<<----

You are in soccer-field    <<<<----   <<<<----   <<<<----I am back
You are not holding anything. 
You see stuff in the room: football student-riot 
You see other people: bomby cs-flash-hater qqqqq dddd 
The exits are in directions: south ok
> (ask me 'die)   <<<<----   <<<<----

At soccer-field me says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
me moves from soccer-field to heaven 
At soccer-field me says -- i am too young to die ,therefore i am back! 
> (ask me 'die)   <<<<----   <<<<----

At soccer-field me says -- SHREEEEK!  I, uh, suddenly feel very faint...   <<<<----GAME OVER 
An earth-shattering, soul-piercing scream is heard...    <<<<----
me moves from soccer-field to heaven game-over-for-you-dude   <<<<----



;;----

IN SECOND VERSION

Welcome to DrRacket, version 6.6 [3m].
Language: R5RS; memory limit: 128 MB.
ready
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
> (setup 'me)
ready
> (ask me 'say '(I am very young,I have 3 lives))

At student-center me says -- i am very young ,i have 3 lives said-and-heard
> (ask me 'say '(if I die,I will be right back!,let's try))

At student-center me says -- if i die ,i will be right back! ,let 's try said-and-heard
> (ask me 'die)

At student-center me says -- i am too young to die ,therefore i am back! 
> (ask me 'die)

At student-center me says -- i am too young to die ,therefore i am back! 
> (ask me 'die)

At student-center me says -- i am too young to die ,therefore i am back! 
> (ask me 'say '(I have no more life,If I die,I'll go to heaven))

At student-center me says -- i have no more life ,if i die ,i 'll go to heaven said-and-heard
> (ask me 'die)

At student-center me says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
me moves from student-center to heaven game-over-for-you-dudesss
> (ask me 'look-around)

You are in heaven 
You are not holding anything. 
There is no stuff in the room. 
There are no other people around you. 
There are no exits... you are dead and gone to heaven! ok
>
|#
;;        			  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;:;:::;;;
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;::;;:::;;:;:::;;:
;;; Computer exercise 5: Perhaps to arm oneself against a sea of .... ;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;;;::;;;;
;;        			  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;
(define (make-weapon name location damage)
  (let ((mobile-part (make-mobile-thing name location)))

    (lambda (message)
      (case message
        ((WEAPON?) (lambda(self) #t)) ;it is useful for is-a,filtering
        ((DAMAGE) (lambda(self) damage))
        ((HIT) (lambda(self me to)
                 (let 
                     ((attackdamage (random-number damage)))
                     (ask to 'suffer attackdamage))
                   )
                 )
        
        (else (get-method message mobile-part)))
        )))
(define (create-weapon name location damage)
  (create make-weapon name location damage) (list 'A 'weapon  name 'has 'been 'created 'at  ((location 'name) location)))




;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;;;::;;;:
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;        			  

#|
1) I created a weapon class (make-weapon)
2) The parameters are name,location and damage
3) It inherits from mobile-thing
4) When 'HIT called, a person 'SUFFERs whoever the weapon directs to
5) The damage given to the person is a random-number damage of the weapon
6) I created some messages for weapon,other messages inherit from mobile-thing
|#
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;;;::;;:;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;        			  

#|
Welcome to DrRacket, version 6.6 [3m].
Language: R5RS; memory limit: 128 MB.
#f
#f
#f
#f
#f
#f
#f
#f
> (setup 'me)
ready
> (create-person 'deadborn (ask me 'location))
#<procedure:...ct4/project4.scm:392:4>
> (create-person 'highschoolmathteacher (ask me 'location))
#<procedure:...ct4/project4.scm:392:4>
> (create-person 'womanwhocutmyfootball (ask me 'location))
#<procedure:...ct4/project4.scm:392:4>
> (create-weapon 'pistol (ask me 'location) 2)       <<<<<<<-------------
(a weapon pistol has been created at cici-bufe)       <<<<<<<-------------
> (ask (thing-named 'pistol) 'hit me (thing-named 'deadborn))       <<<<<<<-------------

At cici-bufe deadborn says -- Ouch! 2 hits is more than I want! 1       <<<<<<<-------------
> (ask (thing-named 'pistol) 'hit me (thing-named 'highschoolmathteacher))       <<<<<<<-------------

At cici-bufe highschoolmathteacher says -- Ouch! 2 hits is more than I want! 1       <<<<<<<-------------
> (ask (thing-named 'pistol) 'hit me (thing-named 'womanwhocutmyfootball))       <<<<<<<-------------

At cici-bufe womanwhocutmyfootball says -- Ouch! 2 hits is more than I want! 1       <<<<<<<-------------
> (ask me 'say '( :D haha ))

At cici-bufe me says -- :d haha said-and-heard

|#




        			  
        			  
;;        			  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;;;::;;::
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;;;::;:;;
;;;;;;;; Computer exercise 6: Good thing I'm armed and dangerous ;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;;;::;:;:
;;        			  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;    


(define (make-violent-person freq name birthplace activity miserly )
             (let ((autonomous-part (make-autonomous-player name birthplace activity miserly))
                  (pot (random-number freq)))
               (lambda (message)
                 (case message
                     ((INSTALL) (lambda (self)
                                (ask clock 'ADD-CALLBACK (make-clock-callback 'move-take-act self 'move-take-act))
                                (delegate autonomous-part self 'INSTALL)))
                   ((VIOLENT?) (lambda (self) #t))
            
                   
                   ((VIOLENT-ACT) ;   <<<<----   <<<<----   <<<<----
                    (lambda (self)
                    (let*  (
                          (peoplehere (ask self 'PEOPLE-AROUND))
                          (my-stuff (ask self 'things)))
                      (if(= pot 2)
                         (let* ((one (pick-random peoplehere)) ;picking a person in the room
                               (stuff (pick-random my-stuff))) ;picking a thing from my things
                          (if (and (not (null? one)) (not (null? stuff)))
                              (begin
                              (if (and (is-a one 'PERSON?) (is-a stuff 'WEAPON?)) ;if chosen thing is a weapon,then takes action
                                  (begin
                               (ask self 'say '(GET READY TO DIEEE!))
                               (ask stuff 'HIT self one) ;hits the one
                                (ask self 'say '(I hit YOU!)))
                                ))
                          (ask self 'say '(No wayy....)) ))))))
                   
                   ((MOVE-SOMEWHERE)
                    (lambda (self) 
                      (let ((exit (random-exit (ask self 'location))))
                        (if (not (eqv? #f exit)) (ask self 'GO-EXIT exit)))))
                
                 
                   ((MOVE-TAKE-ACT)
                    (lambda (self)
                 
                 (ask self 'MOVE-SOMEWHERE)
                  (ask self 'TAKE-SOMETHING)
                  (ask self 'VIOLENT-ACT) 
                      'done))
                   (else (get-method message autonomous-part))))))


(define (create-violent-person freq name birthplace activity miserly)
  (create make-violent-person freq name birthplace activity miserly))


        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;;;::;::;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;        			  

#|
1) A violent-person inherits from autonomous player
2) I created some messages for violent-person,other messages inherit from autonomous-player
3) In installation,I added a callback to the clock,and then I delegated installation to autonomous player
4) In violent act,every steps have been explained above.
5) In each callback,player moves and acts violently

|#
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;;;::;:::
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
#|
;;
#f
#f
#f
#f
#f
#f
#f
> (setup 'p)
ready
> (ask clock 'tick)

.....
....
.....
......
......
At great-court qqqqq says -- Hi ggggg yyyyy p 
At great-court qqqqq says -- I take comp200-midterm from great-court 
At great-court qqqqq says -- get ready to dieee!            <<<<<<<<<<<<<<<<------------
At great-court yyyyy says -- Ouch! 3 hits is more than I want!         <<<<<<<<<<<<<<-------
At great-court yyyyy says -- i am too young to die ,therefore i am back!        <<<<<<<<--------
At great-court qqqqq says -- i hit you!                 <<<<<<<<<<<<<<<<<<<---------
asda moves from sos-building to cas-building 
asda moves from cas-building to great-court 
........
.......
......
........
.......
|#
;;        			  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;;;:::;;;
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;;;:::;;:
;;; Computer exercise 7: A good hacker could defuse this situation ;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;:;::;;;;
;;        			  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;        			  

(define (make-bomb name location damage)
         (let ((mobile-part (make-mobile-thing name location))
               (aware-part (make-aware-thing))
               (armed #t))
            
           (lambda (message)
             (case message
               ((BOMB?)(lambda (self) #t))
               ((ARMED?)(lambda(self) armed)) ;it shows whether the bomb is armed or not
               ((ARM)(lambda (self) (set! armed #t))) ; arms the bomb
               ((DISARM)(lambda (self) (set! armed #f))) ;disarms the bomb
               ((TRIGGER)(lambda(self)  (if (eqv? #t armed) (ask self 'ACTIVATE)    ))) ;if the bomb is armed,then activates
               ((AWARE?)(lambda (self) (delegate aware-part self 'AWARE?)))
               ((HEARD-NOISE)(lambda(self whom)
                               (delegate aware-part self 'HEARD-NOISE whom)
                               (ask self 'TRIGGER)))
               ((ACTIVATE)(lambda(self)   ;explodes here,finds people in the room and gives damage.
                            (let* ((things (ask location 'THINGS))
                                  (people (myfilter (lambda(thing) (or (is-a thing 'PERSON?) (is-a thing 'AVATAR?)))
                                               things))
                                  )
                                  (begin
                                    (map (lambda(person) (ask person 'SUFFER damage)) people)
                                 (ask screen 'TELL-WORLD (cons '(BOOOOM! A bomb has exploded!) (list 'It 'damaged damage 'damages 'to 'each 'player 'in 'the 'room)) )
                                  (ask self 'DISARM) 'done))))
               (else (get-method message mobile-part))))))


(define (create-bomb name location damage)
  (create make-bomb name location damage) '(a bomb has been planted))


        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;:;::;;;:
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;        			  

#|
1) A bomb is a class which inherits from mobile-thign and aware-thing.
2) Properties and explanations of messages are given above.
3) If the bomb hears noise,trigger itself then activates(IF ARMED)
4) Then,it explodes. After the explosion,people in the room gets damage.
5) Finally,bomb 'DISARMs itself.

|#
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;:;::;;:;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;
#|
Welcome to DrRacket, version 6.6 [3m].
Language: R5RS; memory limit: 128 MB.
#f
#f
#f
#f
#f
#f
#f
#f
#f
> (setup 'me)
ready
> (ask clock 'tick)

At cici-bufe cici says -- Prepare to suffer, dddd ! 
At cici-bufe dddd says -- Ouch! 1 hits is more than I want! 
suzy moves from suzy-cafe to cici-bufe 
At cici-bufe suzy says -- Hi cici dddd 
At cici-bufe suzy says -- Ouch! 1 hits is more than I want!           <<<<<<<-----
At cici-bufe cici says -- Ouch! 1 hits is more than I want!           <<<<<<<-----
At cici-bufe dddd says -- Ouch! 1 hits is more than I want!           <<<<<<<-----
(boooom! a bomb has exploded!) it damaged 1 damages to each player in the room <<<<<<<-----
At cici-bufe suzy says -- Prepare to suffer, dddd ! 
At cici-bufe dddd says -- Ouch! 3 hits is more than I want! 
At cici-bufe dddd says -- i am too young to die ,therefore i am back! 
bomby moves from  gym to library 
bomby moves from  library to gym 
bomby moves from  gym to library 
bomby moves from  library to gym 
bomby moves from  gym to library 
bomby moves from  library to gym 
bomby moves from  gym to library 
bomby moves from  library to great-court 
bomby moves from  great-court to cas-building 
bomby moves from  cas-building to great-court 
At great-court bomby says -- 1 bombs have been defused. 
redwireman moves from  great-court to graduation-stage 
redwireman moves from  graduation-stage to great-court 
redwireman moves from  great-court to cas-building 
redwireman moves from  cas-building to great-court 
redwireman moves from  great-court to library 
redwireman moves from  library to great-court 
redwireman moves from  great-court to student-center 
redwireman moves from  student-center to great-court 
redwireman moves from  great-court to adm-building 
At adm-building redwireman says -- 0 bombs have been defused. 
ismailyk moves from  divan to cici-bufe 
ismailyk moves from  cici-bufe to computer-club 
ismailyk moves from  computer-club to cici-bufe 
ismailyk moves from  cici-bufe to computer-club 
At computer-club ismailyk says -- 1 bombs have been defused. 
patlamayanseker moves from  student-center to great-court 
patlamayanseker moves from  great-court to graduation-stage 
patlamayanseker moves from  graduation-stage to great-court 
patlamayanseker moves from  great-court to library 
patlamayanseker moves from  library to gym 
patlamayanseker moves from  gym to library 
At library patlamayanseker says -- 1 bombs have been defused. 
bomblover moves from  adm-building to registrar-office 
.......
......
.......
At library lambda-man says -- Hi patlamayanseker ww2 
comp200-student moves from eng-b30 to eng-z21 
At eng-z21 comp200-student says -- Hi cs-flash-hater hhhhh 
comp200-student moves from eng-z21 to deans-office 
comp200-student moves from deans-office to eng-z21 
At eng-z21 comp200-student says -- Hi cs-flash-hater hhhhh 
comp200-student moves from eng-z21 to eng-b30 
At eng-b30 comp200-student says -- Ouch! 7 hits is more than I want!            <<<<<<<-----
At eng-b30 comp200-student says -- i am too young to die ,therefore i am back!            <<<<<<<-----
(boooom! a bomb has exploded!) it damaged 7 damages to each player in the room            <<<<<<<-----
comp200-student moves from eng-b30 to eng-z21 
At eng-z21 comp200-student says -- Hi cs-flash-hater hhhhh 
comp200-student moves from eng-z21 to eng-building 
At eng-building comp200-student says -- Ouch! 4 hits is more than I want!            <<<<<<<-----
At eng-building comp200-student says -- i am too young to die ,therefore i am back!            <<<<<<<-----
(boooom! a bomb has exploded!) it damaged 4 damages to each player in the room            <<<<<<<-----
comp200-student moves from eng-building to eng-z21 
At eng-z21 comp200-student says -- Hi cs-flash-hater hhhhh 
comp200-student moves from eng-z21 to eng-b30 
comp200-student moves from eng-b30 to eng-z21 
At eng-z21 comp200-student says -- Hi cs-flash-hater hhhhh 
comp200-student moves from eng-z21 to deans-office 
.....
.....
...
....
....
....
.....
.....
comp200-student moves from eng-z21 to eng-auditorium 
At eng-auditorium comp200-student says -- Ouch! 11 hits is more than I want!           <<<<<<<----- 
At eng-auditorium comp200-student says -- i am too young to die ,therefore i am b           <<<<<<<-----ack! 
(boooom! a bomb has exploded!) it damaged 11 damages to each player in the room            <<<<<<<-----
comp200-student moves from eng-auditorium to eng-z21 
At eng-z21 comp200-student says -- Hi cs-flash-hater hhhhh 
....
.....
.....
....
.....
|#
        			  
        			  
;;        			  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;:;::;;::
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;:;::;:;;
;;;; Computer exercise 8: Well, maybe only if they have enough time ;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;:;::;:;:
;;        			  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;

(define (make-bomb-with-timer name location damage)
  (let ((bomb-part (make-bomb name location damage))
        (time 3) ;3 clock ticks
        ) 
    
    (lambda (message)
      (case message
        ((INSTALL)(lambda (self) (delegate bomb-part self 'INSTALL)))
        ((ARMED?) (lambda(self)(delegate bomb-part self 'ARMED?)))
        ((ARM) (lambda (self) (set! time 3)  (delegate bomb-part self 'ARM)))
        ((DISARM) (lambda(self) (delegate bomb-part self 'DISARM)))
        ((TRIGGER) (lambda (self)(if (ask self 'ARMED?)
                       (ask clock 'ADD-CALLBACK (make-clock-callback 'timer self 'TIMER))
                     )))
        ((HEARD-NOISE)(lambda (self whom)
                        (delegate bomb-part self 'HEARD-NOISE whom)))
        ((TIMER) (lambda(self) ;counts the time by a connection with clock
                   (let* ((the-time (ask clock 'THE-TIME))
                         (time-required (+ the-time time)))
                     (if (= the-time time-required) 
                         (begin
                           (ask self 'ACTIVATE)
                           (ask clock 'REMOVE-CALLBACK self 'timer))
                         (set! time (- time 1))))))
        ((ACTIVATE)(lambda(self)   ;explodes here,finds people in the room and gives damage.
                            (let* ((things (ask location 'THINGS))
                                  (people (myfilter (lambda(thing) (or (is-a thing 'PERSON?) (is-a thing 'AVATAR?)))
                                               things))
                                  )
                                  (begin
                                    (map (lambda(person) (ask person 'SUFFER damage)) people)
                                 (ask screen 'TELL-WORLD (cons '(BOOOOM! A bomb-with-timer has exploded!) (list 'It 'damaged damage 'damages 'to 'each 'player 'in 'the 'room)) )
                                  (ask self 'DISARM) 'done))))
       (else ( get-method message bomb-part))))))

(define (create-bomb-with-timer name location damage)
  (create make-bomb-with-timer name location damage))
        





        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;:;::;::;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;        			  

#|
1) Bomb-with-timer is subclass of bomb
2) Bomb-with-timer inherits from bomb
3)I put a timer that counts the clock ticks
4) I added a callback to the clock,therefore I counts the ticks
5) When it gets activated,it explodes.
6) After it explodes,it's not armed (<bomb> 'ARMED? --> #f)
7) If we rearm it(<bomb> 'ARM) , it updates the time ( to 3 ticks)

|#
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;:;::;:::
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;


#|
Welcome to DrRacket, version 6.6 [3m].
Language: R5RS; memory limit: 128 MB.
#f
#f
> (setup 'me)
ready
> (ask me 'look-around)

You are in graduation-stage 
You are not holding anything. 
There is no stuff in the room. 
There are no other people around you. 
The exits are in directions: down ok
> (create-bomb-with-timer 'cool-bomb (ask me 'location) 5)      <<<<<----- created
#<procedure:...ct4/project4.scm:1118:4>
> (ask (thing-named 'cool-bomb) 'ARMED?)      <<<<<-----      <<<<<-----
#t      <<<<<-----      <<<<<-----      <<<<<-----
> (ask me 'go 'down)

me moves from graduation-stage to great-court 
lambda-man moves from sos-building to cas-building 
lambda-man moves from cas-building to sos-building 
comp200-student moves from amphitheater to sos-building 
At sos-building comp200-student says -- Hi lambda-man 
comp200-student moves from sos-building to sci-building 
comp200-student moves from sci-building to sos-building 
At sos-building comp200-student says -- Hi lambda-man 
comp200-student moves from sos-building to amphitheater 
comp200-student moves from amphitheater to sos-building 
At sos-building comp200-student says -- Hi lambda-man 
comp200-student moves from sos-building to cas-building 
comp200-student moves from cas-building to great-court 
At great-court comp200-student says -- Hi me 
comp200-student moves from great-court to cas-building 
comp200-student moves from cas-building to sos-building 
At sos-building comp200-student says -- Hi lambda-man 
comp200-student moves from sos-building to cas-building 
comp200-student moves from cas-building to sos-building 
At sos-building comp200-student says -- Hi lambda-man 
comp200-student moves from sos-building to cas-building 
comp200-student moves from cas-building to great-court 
At great-court comp200-student says -- Hi me 
comp200-student moves from great-court to graduation-stage 
comp200-student moves from graduation-stage to great-court 
At great-court comp200-student says -- Hi me 
comp200-student moves from great-court to library 
comp200-student moves from library to gym 
comp200-student moves from gym to library 
comp200-student moves from library to gym 
comp200-student moves from gym to library 
comp200-student moves from library to great-court 
At great-court comp200-student says -- Hi me 
comp200-student moves from great-court to graduation-stage 
comp200-student moves from graduation-stage to great-court 
At great-court comp200-student says -- Hi me 
comp200-student moves from great-court to cas-building 
comp200-student moves from cas-building to great-court 
At great-court comp200-student says -- Hi me 
comp200-student moves from great-court to student-center 
prof-yuret moves from deans-office to eng-z21 
At eng-z21 prof-yuret says -- I take stick-of-chalk from eng-z21 
alyssa-p-hacker moves from computer-club to cici-bufe 
At cici-bufe alyssa-p-hacker says -- Hi ben-bitdiddle 
alyssa-p-hacker moves from cici-bufe to computer-club 
At computer-club alyssa-p-hacker says -- Ouch! 5 hits is more than I want! 
At computer-club alyssa-p-hacker says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
alyssa-p-hacker moves from computer-club to heaven 
At heaven alyssa-p-hacker says -- i am too young to die ,therefore i am back! 
(boooom! a bomb has exploded!) it damaged 5 damages to each player in the room 
ben-bitdiddle moves from cici-bufe to migros 
ben-bitdiddle moves from migros to cici-bufe 
At cici-bufe ben-bitdiddle says -- I take kofte from cici-bufe 
--- the-clock Tick 0 --- 
You are in great-court 
You are not holding anything. 
You see stuff in the room: flag-pole 
There are no other people around you. 
The exits are in directions: up east west south north #t
> (ask me 'go 'up)        <<<<<-----    <<<<<-----THE BOMB GETS TRIGGERRED,TIME LEFT 3 TICKS

me moves from great-court to graduation-stage 
lambda-man moves from sos-building to sci-building 
lambda-man moves from sci-building to eng-building 
At eng-building lambda-man says -- Ouch! 1 hits is more than I want! 
(boooom! a bomb has exploded!) it damaged 1 damages to each player in the room 
comp200-student moves from student-center to great-court 
comp200-student moves from great-court to adm-building 
At adm-building comp200-student says -- Ouch! 4 hits is more than I want! 
At adm-building comp200-student says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
comp200-student moves from adm-building to heaven 
At heaven comp200-student says -- Hi alyssa-p-hacker 
At heaven comp200-student says -- i am too young to die ,therefore i am back! 
(boooom! a bomb has exploded!) it damaged 4 damages to each player in the room 
(boooom! a bomb has exploded!) it damaged 10 damages to each player in the room 
(boooom! a bomb has exploded!) it damaged 11 damages to each player in the room 
prof-yuret moves from eng-z21 to eng-b30 
At eng-b30 prof-yuret says -- Ouch! 2 hits is more than I want! 
(boooom! a bomb has exploded!) it damaged 2 damages to each player in the room 
At eng-b30 prof-yuret says -- Ouch! 7 hits is more than I want! 
At eng-b30 prof-yuret says -- SHREEEEK!  I, uh, suddenly feel very faint... 
At eng-b30 prof-yuret says -- I lose stick-of-chalk 
At eng-b30 prof-yuret says -- Yaaaah! I am upset! 
An earth-shattering, soul-piercing scream is heard... 
prof-yuret moves from eng-b30 to heaven 
At heaven prof-yuret says -- Hi comp200-student alyssa-p-hacker 
At heaven prof-yuret says -- i am too young to die ,therefore i am back! 
(boooom! a bomb has exploded!) it damaged 7 damages to each player in the room 
ben-bitdiddle moves from cici-bufe to divan 
At divan ben-bitdiddle says -- Ouch! 10 hits is more than I want! 
At divan ben-bitdiddle says -- SHREEEEK!  I, uh, suddenly feel very faint... 
At divan ben-bitdiddle says -- I lose kofte 
At divan ben-bitdiddle says -- Yaaaah! I am upset! 
An earth-shattering, soul-piercing scream is heard... 
ben-bitdiddle moves from divan to heaven 
At heaven ben-bitdiddle says -- Hi prof-yuret comp200-student alyssa-p-hacker 
At heaven ben-bitdiddle says -- i am too young to die ,therefore i am back! 
(boooom! a bomb has exploded!) it damaged 10 damages to each player in the room 
--- the-clock Tick 1 ---       <<<<<-----      <<<<<-----TIME REMAINING 2 TICKS
You are in graduation-stage 
You are not holding anything. 
You see stuff in the room: cool-bomb 
There are no other people around you. 
The exits are in directions: down #t
> (ask clock 'tick)

lambda-man moves from eng-building to sci-building 
lambda-man moves from sci-building to eng-building 
--- the-clock Tick 2 ---       <<<<<-----      <<<<<----- TIME REMAINING 1 TICK
> (ask clock 'tick)

lambda-man moves from eng-building to soccer-field 
At soccer-field lambda-man says -- Ouch! 4 hits is more than I want! 
At soccer-field lambda-man says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
lambda-man moves from soccer-field to heaven 
At heaven lambda-man says -- Hi ben-bitdiddle prof-yuret comp200-student alyssa-p-hacker 
At heaven lambda-man says -- i am too young to die ,therefore i am back! 
(boooom! a bomb has exploded!) it damaged 4 damages to each player in the room 
--- the-clock Tick 3 --- 
> (ask clock 'tick)      <<<<<-----      <<<<<----- TIME REMAINING 0 TICKS

At graduation-stage me says -- Ouch! 5 hits is more than I want! 
At graduation-stage me says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
me moves from graduation-stage to heaven 
At heaven me says -- Hi lambda-man ben-bitdiddle prof-yuret comp200-student alyssa-p-hacker 
At graduation-stage me says -- i am too young to die ,therefore i am back! 
(boooom! a bomb-with-timer has exploded!) it damaged 5 damages to each player in the room       <<<<<-----      <<<<<-----      <<<<<-----BOMB HAS EXPLODED
--- the-clock Tick 4 ---       <<<<<-----      <<<<<-----      <<<<<-----      <<<<<-----      <<<<<-----      <<<<<-----
> (ask (thing-named 'cool-bomb) 'ARMED?)      <<<<<-----
#f      <<<<<-----
> (ask (thing-named 'cool-bomb) 'ARM)      <<<<<-----
> (ask (thing-named 'cool-bomb) 'ARMED?)      <<<<<-----
#t      <<<<<-----
> 
|#
        			  
;;        			  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;:;:::;;;
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;;:;:::;;:
;;;;;;;;; Computer Exercise 9: Even you can change the world! ;;;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;:;;::;;;;
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;:;;::;;;:
;;;;;;;;;;;;; DESCRIPTION: ;;;;;;;;;;;;;
;;


#|

1. Object class:
------BOMB-DEFUSER,which is a mobile-object,behaves like autonomous player
------moves and defuses in each clock tick,if there is a bomb in the room he enters
------he moves making NO noise
------therefore bomb can't be aware of him
------If he finds bomb in a room, makes bomb 'DISARM itself. (ARMED? <- #f)

2. Class hierarchy:
------It is a subclass of autonomous-player

3. Class state information:
------It needs to know that it is a subclass of autonomous-player
------Therefore one(general) of the internal states is autonomoous-part
------In each method,there are other internal states.


4. Class methods:
-------INSTALL,MOVE-SOMEWHERE,DEFUSE-BOMB,MOVE-DEFUSE,DEFUSEREXIT (different exit method)
-------DEFUSEREXIT does not contain thing 'ENTER-ROOM,therefore he does not make noise
-------Other messages inherit from autonomous player 

5. Demonstration plan: 
-------It should not make noise. Therefore 'ENTER-ROOM property must be removed
-------I implemented DEFUSEREXIT which provides silent moves(NO ENTER ROOM)
-------In every clock tick,it will move and look for bombs in the room.If there are any bomb in the room,it defuses.
-------Then,it will keep doing these.


|#



;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;:;;::;;:;
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;


(define (make-bomb-defuser name birthplace activity miserly)
  (let ((autonomous-part (make-autonomous-player name birthplace activity miserly)))
    (lambda(message)

      (case message
        ((INSTALL)(lambda (self)
                    (ask clock 'ADD-CALLBACK
                         (make-clock-callback 'move-defuse self 'MOVE-DEFUSE))
                    (delegate autonomous-part self 'INSTALL)))
        
        ((MOVE-SOMEWHERE)(lambda (self)
                           (let* ((exit (random-exit (ask self 'LOCATION))))
                             (if (not (eqv? #f exit)) (ask self 'DEFUSEREXIT exit)
                                 ))))
        ((DEFUSE-BOMB)(lambda(self)
                        (let* ((place (ask self 'location))
                              (things (ask place 'THINGS))
                              (bombs (myfilter (lambda(x) (is-a x 'BOMB?)) things))
                              )
                          (for-each (lambda(bomb) (ask bomb 'DISARM)) bombs)
                          (ask self 'say (cons (length bombs)'(Bombs have been defused.))))))
        ((MOVE-DEFUSE)(lambda(self)
                        (ask self 'MOVE-SOMEWHERE)
                        (ask self 'DEFUSE-BOMB)))
        
        ((DEFUSEREXIT)(lambda (self to)
                        (ask self 'LEAVE-ROOM)

                        (ask screen 'TELL-ROOM (ask self 'location)
                             (list (ask self 'name)
                                   "moves from "
                                   (ask (ask self 'location) 'name)
                                   "to"
                                  (ask (ask to 'TO) 'name)
                                   ))
                        (delegate autonomous-part self 'CHANGE-LOCATION (ask to 'TO))
                        
                        
                        ))
         (else (get-method message autonomous-part))
        ))))


(define (create-bomb-defuser name birthplace activity miserly)
  (create make-bomb-defuser name birthplace activity miserly))







        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;:;;::;;::
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;        			  

#|

1)As given in description,all of the properties have been satisfied.
2)A bomb defuser moves silently,keeps looking for bombs if the room has bomb when he enters the room
3)If there is a bomb / are bombs ,he defuses (makes bombs 'DISARM itself)
4)Then,it keeps doing these steps continously.


|#
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;:;;::;:;;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;
#|


Welcome to DrRacket, version 6.6 [3m].
Language: R5RS; memory limit: 128 MB.
#f
#f
#f
#f
#f
#f
#f
#f
#f
#f
> (setup 'p)
ready
> (ask clock 'tick)

cici moves from cici-bufe to suzy-cafe 
At suzy-cafe cici says -- Hi suzy comp200-student alyssa-p-hacker yyyyy 
At suzy-cafe cici says -- Prepare to suffer, comp200-student ! 
At suzy-cafe comp200-student says -- Ouch! 1 hits is more than I want! 
At suzy-cafe suzy says -- Prepare to suffer, cici ! 
At suzy-cafe cici says -- Ouch! 3 hits is more than I want! 
At suzy-cafe cici says -- i am too young to die ,therefore i am back! 
bomby moves from  amphitheater to sos-building 
bomby moves from  sos-building to sci-building 
bomby moves from  sci-building to eng-building 
bomby moves from  eng-building to sci-building 
bomby moves from  sci-building to sos-building 
bomby moves from  sos-building to cas-building 
At cas-building bomby says -- 0 bombs have been defused. <<<<<<<<<<------------
redwireman moves from  bursar-office to registrar-office 
redwireman moves from  registrar-office to bursar-office 
At bursar-office redwireman says -- 0 bombs have been defused. <<<<<<<<<<------------
ismailyk moves from  computer-club to cici-bufe 
ismailyk moves from  cici-bufe to divan 
ismailyk moves from  divan to cici-bufe 
ismailyk moves from  cici-bufe to suzy-cafe 
ismailyk moves from  suzy-cafe to student-center 
ismailyk moves from  student-center to suzy-cafe 
ismailyk moves from  suzy-cafe to student-center 
ismailyk moves from  student-center to great-court 
ismailyk moves from  great-court to library 
ismailyk moves from  library to gym 
ismailyk moves from  gym to library 
At library ismailyk says -- 1 bombs have been defused. <<<<<<<<<<------------
patlamayanseker moves from  bookstore to suzy-cafe 
patlamayanseker moves from  suzy-cafe to student-center 
patlamayanseker moves from  student-center to suzy-cafe 
patlamayanseker moves from  suzy-cafe to student-center 
At student-center patlamayanseker says -- 2 bombs have been defused. <<<<<<<<<<------------
bomblover moves from  migros to cici-bufe 
bomblover moves from  cici-bufe to computer-club 
bomblover moves from  computer-club to cici-bufe 
bomblover moves from  cici-bufe to divan 
bomblover moves from  divan to cici-bufe 
bomblover moves from  cici-bufe to migros 
At migros bomblover says -- 1 bombs have been defused. <<<<<<<<<<------------
cs-flash-hater moves from  cici-bufe to suzy-cafe 
cs-flash-hater moves from  suzy-cafe to bookstore 
At bookstore cs-flash-hater says -- 1 bombs have been defused. <<<<<<<<<<------------
halflifer moves from  adm-building to registrar-office 
halflifer moves from  registrar-office to adm-building 
At adm-building halflifer says -- 1 bombs have been defused. <<<<<<<<<<------------
son-bomb-bukucu moves from  student-center to suzy-cafe 
son-bomb-bukucu moves from  suzy-cafe to bookstore 
son-bomb-bukucu moves from  bookstore to suzy-cafe 
son-bomb-bukucu moves from  suzy-cafe to cici-bufe 
son-bomb-bukucu moves from  cici-bufe to computer-club 
son-bomb-bukucu moves from  computer-club to cici-bufe 
son-bomb-bukucu moves from  cici-bufe to divan 
son-bomb-bukucu moves from  divan to cici-bufe 
son-bomb-bukucu moves from  cici-bufe to divan 
son-bomb-bukucu moves from  divan to cici-bufe 
son-bomb-bukucu moves from  cici-bufe to divan 
At divan son-bomb-bukucu says -- 1 bombs have been defused. <<<<<<<<<<------------
lambda-man moves from computer-club to cici-bufe 
At cici-bufe lambda-man says -- Hi p hhhhh 
lambda-man moves from cici-bufe to suzy-cafe 
At suzy-cafe lambda-man says -- Hi cici suzy comp200-student alyssa-p-hacker yyyyy 
comp200-student moves from suzy-cafe to cici-bufe 
At cici-bufe comp200-student says -- Hi p hhhhh 
comp200-student moves from cici-bufe to computer-club 
At computer-club comp200-student says -- Ouch! 5 hits is more than I want! 
At computer-club comp200-student says -- i am too young to die ,therefore i am back! 
(boooom! a bomb has exploded!) it damaged 5 damages to each player in the room 
At computer-club comp200-student says -- Ouch! 2 hits is more than I want! 
At computer-club comp200-student says -- i am too young to die ,therefore i am back! 
(boooom! a bomb has exploded!) it damaged 2 damages to each player in the room 
comp200-student moves from computer-club to cici-bufe 
......
.....
......
> 




|#

        			  
;;        			  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;:;;::;:;:
        			  
        			  
        			  
        			  
        			  
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;:;;::;::;
;# DO NOT FORGET TO SUBMIT YOUR WORK BEFORE THE DEADLINE!         #
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;:;;::;:::
;# GOOD LUCK!                                                     #
;;;;;;;::;;:;::::;:;;:::;:;:::;:::;::;;;;:;::;;;:;::;:::;::;;:;;:::;;;
        			  
        			  
        			  
        			  
        			  
        			  

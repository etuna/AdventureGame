        			  
;;------------------------------------------------------------
;; Utils to connect places by way of exits
;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII		  
(define (can-go-both-ways from direction reverse-direction to)
  (create-exit from direction to)
  (create-exit to reverse-direction from))
;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII





;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
;;------------------------------------------------------------
;; Create our world...        			  			  
(define (create-world)
  
  ; *****PLACES*****
  ; Create some places      			  
  (let ((eng-building (create-place 'eng-building))
	(sci-building (create-place 'sci-building))
	(sos-building (create-place 'sos-building))
	(cas-building (create-place 'cas-building))
	(great-court (create-place 'great-court))
	(graduation-stage (create-place 'graduation-stage))
	(adm-building (create-place 'adm-building))
	(student-center (create-place 'student-center))
	(library (create-place 'library))
	(gym (create-place 'gym))
	(dorms (create-place 'dorms))
	(cici-bufe (create-place 'cici-bufe))
	(suzy-cafe (create-place 'suzy-cafe))
	(bookstore (create-place 'bookstore))
	(computer-club (create-place 'computer-club))
	(divan (create-place 'divan))
	(migros (create-place 'migros))
	(soccer-field (create-place 'soccer-field))
	(amphitheater (create-place 'amphitheater))
	(registrar-office (create-place 'registrar-office))
	(bursar-office (create-place 'bursar-office))
	(parking-lot (create-place 'parking-lot))
	(eng-z21 (create-place 'eng-z21))
	(eng-b30 (create-place 'eng-b30))
	(eng-auditorium (create-place 'eng-auditorium))
	(deans-office (create-place 'deans-office)))
    ;********************

 
    ;********************
    ; Connect up places        			  
    (can-go-both-ways eng-building 'north 'south soccer-field)
    (can-go-both-ways eng-building 'west 'east parking-lot)
    (can-go-both-ways eng-building 'in 'out eng-z21)
    (can-go-both-ways eng-z21 'south 'north eng-auditorium)
    (can-go-both-ways eng-z21 'down 'up eng-b30)
    (can-go-both-ways eng-z21 'up 'down deans-office)
    (can-go-both-ways eng-building 'south 'north sci-building)
    (can-go-both-ways sci-building 'south 'north sos-building)
    (can-go-both-ways sos-building 'south 'north cas-building)
    (can-go-both-ways sos-building 'east 'west amphitheater)
    (can-go-both-ways cas-building 'south 'north great-court)
    (can-go-both-ways great-court 'south 'north adm-building)
    (can-go-both-ways great-court 'west 'east library)
    (can-go-both-ways great-court 'east 'west student-center)
    (can-go-both-ways great-court 'up 'down graduation-stage)
    (can-go-both-ways library 'west 'east gym)
    (can-go-both-ways adm-building 'south 'north dorms)
    (can-go-both-ways adm-building 'in 'out registrar-office)
    (can-go-both-ways registrar-office 'west 'east bursar-office)
    (can-go-both-ways student-center 'in 'out suzy-cafe)
    (can-go-both-ways suzy-cafe 'east 'west bookstore)
    (can-go-both-ways suzy-cafe 'down 'up cici-bufe)
    (can-go-both-ways cici-bufe 'west 'east computer-club)
    (can-go-both-ways cici-bufe 'north 'south migros)
    (can-go-both-ways cici-bufe 'down 'up divan)
    ;*********************


    ;******THINGS******
    ; Create some things        			  
    (create-thing 'white-board eng-b30)
    (create-thing 'fancy-cars parking-lot)
    (create-thing 'flag-pole great-court)
    (create-mobile-thing 'tons-of-code dorms) 
    (create-mobile-thing 'lecture-notes eng-b30)
    (create-mobile-thing 'problem-set eng-z21)
    (create-mobile-thing 'final-exam eng-auditorium)
    (create-mobile-thing 'sicp bookstore)
    (create-mobile-thing 'engineering-book library)
    (create-mobile-thing 'diploma registrar-office)
    (create-mobile-thing 'football soccer-field)
    (create-mobile-thing 'basketball gym)
    (create-mobile-thing 'scheme-manual computer-club)
    (create-mobile-thing 'transcript deans-office)
    (create-mobile-thing 'milk migros)
    (create-mobile-thing 'kofte cici-bufe)
    (create-mobile-thing 'coke suzy-cafe)
    (create-mobile-thing 'profiterol divan)
    (create-mobile-thing 'umbrella amphitheater)
        			  
    (list eng-building sci-building sos-building cas-building
	  great-court graduation-stage adm-building student-center
	  library gym dorms cici-bufe suzy-cafe bookstore
	  computer-club divan migros soccer-field amphitheater
	  registrar-office bursar-office parking-lot eng-z21 eng-b30
	  eng-auditorium deans-office)
    ))        			  
    ;********************
;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII

 



;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
(define (populate-weapons rooms)
  (create-weapon 'chair-of-the-faculty (pick-random rooms) 5)
  (create-weapon 'student-riot (pick-random rooms) 4)
  (create-weapon 'sicp-book (pick-random rooms) 2)
  (create-weapon 'inflatable-lambda (pick-random rooms) 3)
  (create-weapon 'comp200-midterm (pick-random rooms) 3)
  (create-weapon 'stick-of-chalk (pick-random rooms) 1)
  (create-weapon 'chair (pick-random rooms) 5)
  (create-weapon 'gun (pick-random rooms) 4)
  (create-weapon 'pistol (pick-random rooms) 2)
  (create-weapon 'saw (pick-random rooms) 3)
  (create-weapon 'bow (pick-random rooms) 3)
  (create-weapon 'nokia3310 (pick-random rooms) 1)
  'populated-weapons)        			  
;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII


;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
(define (populate-players rooms)
  (create-autonomous-player 'ben-bitdiddle (pick-random rooms)
			    2 2)

  (create-violent-person 2 'dddd (pick-random rooms)
			    200 200)
  (create-violent-person 2 'fffff (pick-random rooms)
			    2022 2022)
  (create-violent-person 2 'ggggg (pick-random rooms)
			    222 222)
  (create-violent-person 2 'hhhhh (pick-random rooms)
			    2004 2004)
  (create-violent-person 2 'yyyyy (pick-random rooms)
			    2001 2001)
    (create-violent-person 2 'asda (pick-random rooms)
			    2022 2022)
  (create-violent-person 2 'qqqqq (pick-random rooms)
			    222 222)
  (create-violent-person 2 'wwww (pick-random rooms)
			    2004 2004)
  (create-violent-person 2 'ww2 (pick-random rooms)
			    2001 2001)
 
  (create-autonomous-player 'alyssa-p-hacker (pick-random rooms)
			    21 21)
  (create-autonomous-player 'prof-yuret (pick-random rooms)
			    1 2)
  (create-autonomous-player 'comp200-student (pick-random rooms)
			    201 101)
  (create-autonomous-player 'lambda-man (pick-random rooms)
			    3 3011)
(create-bomb-defuser 'son-bomb-bukucu (pick-random rooms) 10 10)
  (create-bomb-defuser 'halflifer (pick-random rooms) 10 10)
  (create-bomb-defuser 'cs-flash-hater (pick-random rooms) 10 10)
  (create-bomb-defuser 'bomblover (pick-random rooms) 10 10)
  (create-bomb-defuser 'patlamayanseker (pick-random rooms) 10 10)
  (create-bomb-defuser 'ismailyk (pick-random rooms) 10 10)
  (create-bomb-defuser 'redwireman (pick-random rooms) 10 10)
  (create-bomb-defuser 'bomby (pick-random rooms) 10 10)
 (create-troll 'suzy (car (myfilter (lambda (x) (eq? (ask x 'name) 'suzy-cafe))
				      rooms))
		3 1)        			  
  (create-troll 'cici (car (myfilter (lambda (x) (eq? (ask x 'name) 'cici-bufe))
				      rooms))
		3 1)        			  
  'populated-players)       			  
;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII



;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
(define (populate-bombs rooms)        			  
  (create-bomb 'C4 (pick-random rooms) 1)
  (create-bomb 'STEAKY (pick-random rooms) 11)
  (create-bomb 'ALIVE-BOMB (pick-random rooms) 10)
  (create-bomb 'HOME-MADE (pick-random rooms) 4)
  (create-bomb 'HAND-BOMB (pick-random rooms) 7)
  (create-bomb 'nuclear-bomb (pick-random rooms) 2)
  (create-bomb 'big-bang-bomb (pick-random rooms) 5)
  (create-bomb 'isis-made-bomb (pick-random rooms) 10)
  (create-bomb 'walter-white-made-bomb (pick-random rooms) 4)
  (create-bomb 'flash-bomb (pick-random rooms) 7)
  (create-bomb-with-timer 'tBomb1 (pick-random rooms) 10)
  (create-bomb-with-timer 'tBomb1 (pick-random rooms) 5)
  (create-bomb-with-timer 'tBomb3 (pick-random rooms) 7)
  (create-bomb-with-timer 'tBomb4 (pick-random rooms) 100)
  (create-bomb-with-timer 'tBomb5 (pick-random rooms) 8)
  (create-bomb-with-timer 'tBomb6 (pick-random rooms) 20)
  'populated-bombs)        			  
;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII


;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
(define heaven 'will-be-set-by-setup)
(define me 'will-be-set-by-setup)
(define all-rooms 'will-be-set-by-setup)
(define death-exit 'will-be-set-by-setup)
;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII


;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
(define (setup name)        			  
  (ask clock 'RESET)        			  
  (ask clock 'ADD-CALLBACK        			  
       (make-clock-callback 'tick-printer clock 'PRINT-TICK))
  (let ((rooms (create-world)))
    ; UNCOMMENT AFTER YOU CREATE CODE FOR WEAPONS
    (populate-weapons rooms)      ;;weapons enter 			  
    (populate-players rooms)        ;;players enter
    (populate-bombs rooms)
        			  
   ; The initial point of no return
    (set! heaven (create-place 'heaven))
    (set! me (create-avatar name (pick-random rooms)))
    (ask screen 'SET-ME me)        			  
    (set! all-rooms rooms)        			  
    (set! death-exit (make-exit nil 'heaven heaven))
    'ready))        			  
;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII



;---------------------------------------------------------------------
;; Some useful example expressions...
        			  
;(setup 'ben-bitdiddle)        			  
 ;(run-clock 5)        			  
        			  
;(ask screen 'DEITY-MODE #f)        			  
 ;(ask me 'look-around)        			  
 ;(ask me 'go 'up)        			  
 ;(ask me 'go 'north)        			  
 ;(ask me 'take (thing-named 'problem-set))
        			  
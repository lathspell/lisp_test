;
; LISP
;
; Resources:
; * http://www.call-cc.org
; * http://chickadee.call-cc.org
; * http://www.gigamonkeys.com/book/syntax-and-semantics.html

; installieren mit "chicken-install -s test"
(use test)

(display "Hello world\n")

; Unit-Tests
(define x '42)
(test "x soll 42 sein" 42 x)

; Loops
(for-each 
	(lambda (x) (display x))
	'(1 "\n" 2 "\n" 3 "\n") 
)

; Maps
(map print (list 1 3))

; Conditions
(define x 52)
(map display (list "x=" x " ist "))
(cond 
	((< x 20) (print "klein"))
	((< x 50) (print "größer"))
	(else (print "was anderes"))
)

; car & cdr (sprich: cudder)
; car ist das erste Element einer Liste
; cdr sind die Elemente 2-n
(define liste '(1 2 3))
(test "Listen vergleichen" '((1 2 3)) (list liste))
(test "car" 1 (car liste))
(test "cdr" '(2 3) (cdr liste))
(print (list "Variable liste ist " liste "; car ist " (car liste) "; cdr ist " (cdr liste)))

; format
(print (format "~X" 65)) ; ergibt "41"

; Funktionen
(define foo 
	(lambda (x y) (print (list x ":" y)))
)
(foo 2 3)

; Syntax umdefinieren
(define-syntax infix
	(syntax-rules ()
		((_ a op b)
		 (op a b)) ) )
(print (infix 1 < 4))

; Hashmaps (a-list / associative list)
(define mymap '((a 1) (b 2) (c 3)))
(print mymap)
(print (cdr(assq 'b mymap)))
(define getFromHashMap (lambda (hashmap k) (cdr (assq k hashmap))))
(print (getFromHashMap mymap 'c))

; Case
(define y 5)
(test "mittel" 
	(case y
		((0) 		"null")
		((1 2 3)	"klein")
		((4 5 6)	"mittel")
		(else 		"groß")))



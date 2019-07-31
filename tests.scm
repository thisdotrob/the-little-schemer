(load "testrunner")
(load "equality")
(load "firsts")
(load "insert")
(load "minus")
(load "multiply")
(load "multirember")
(load "plus")
(load "subst")
(load "length")
(load "pick")
(load "nums")
(load "eqan")
(load "occur")
(load "one")

(test-begin "<")
(test-assert "(< 1 2) is #t" (< 1 2))
(test-assert "(< 1 1) is #f" (not (< 1 1)))
(test-assert "(< 2 1) is #f" (not (< 2 1)))
(test-end "<")

(test-begin ">")
(test-assert "(> 1 2) is #f" (not (> 1 2)))
(test-assert "(> 1 1) is #f" (not (> 1 1)))
(test-assert "(> 2 1) is #t" (> 2 1))
(test-end ">")

(test-begin "=")
(test-assert "(= 1 2) is #f" (not (= 1 2)))
(test-assert "(= 1 1) is #t" (= 1 1))
(test-end "=")

(test-begin "firsts")
(test-equal "(firsts '()) is '()" (firsts '()) '())
(test-equal "(firsts '((1 2) (2 3))) is '(1 2)" (firsts '((1 2) (2 3))) '(1 2))
(test-end "firsts")

(test-begin "insertL")
(test-equal "(insertL 1 0 '()) is '()" (insertL 1 0 '()) '())
(test-equal "(insertL 1 0 '(2)) is '(1)" (insertL 1 0 '(1)) '(1))
(test-equal "(insertL 1 0 '(0)) is '(1 0)" (insertL 1 0 '(0)) '(1 0))
(test-equal "(insertL 'b 'c '(a c)) is '(a b c)" (insertL 'b 'c '(a c)) '(a b c))
(test-end "insertL")

(test-begin "insertR")
(test-equal "(insertR 1 0 '()) is '()" (insertR 1 0 '()) '())
(test-equal "(insertR 1 0 '(2)) is '(1)" (insertR 1 0 '(1)) '(1))
(test-equal "(insertR 1 0 '(0)) is '(0 1)" (insertR 1 0 '(0)) '(0 1))
(test-equal "(insertR 'b 'a '(a c)) is '(a b c)" (insertR 'b 'a '(a c)) '(a b c))
(test-end "insertR")

(test-begin "multiinsertR")
(test-equal "(multiinsertR 1 0 '()) is '()" (multiinsertR 1 0 '()) '())
(test-equal "(multiinsertR 1 0 '(2)) is '(1)" (multiinsertR 1 0 '(1)) '(1))
(test-equal "(multiinsertR 1 0 '(0 2 0)) is '(0 1 2 0 1)"
            (multiinsertR 1 0 '(0 2 0)) '(0 1 2 0 1))
(test-equal "(multiinsertR 'b 'a '(a c a)) is '(a b c a b)"
            (multiinsertR 'b 'a '(a c a)) '(a b c a b))
(test-end "multiinsertR")

(test-begin "sub1")
(test-eqv "(sub1 2) is 1" (sub1 2) 1)
(test-end "sub1")

(test-begin "o-")
(test-eqv "(o- 10 4) is 6" (o- 10 4) 6)
(test-end "o-")

(test-begin "x")
(test-eqv "(x 2 200) is 400" (x 2 200) 400)
(test-end "x")

(test-begin "multirember")
(test-equal "(multirember 'a '()) is '()" (multirember 'a '()) '())
(test-equal "(multirember 'a '(b b)) is '(b b)"
            (multirember 'a '(b b)) '(b b))
(test-equal "(multirember 'a '(a b a b a)) is '(b b)"
            (multirember 'a '(a b a b a)) '(b b))
(test-end "multirember")

(test-begin "add1")
(test-eqv "(add1 1) is 2" (add1 1) 2)
(test-end "add1")

(test-begin "o+")
(test-eqv "(o+ 20 99) is 119" (o+ 20 99) 119)
(test-end "o+")

(test-begin "addtup")
(test-eqv "(addtup '(1 2 200)) is 203" (addtup '(1 2 200)) 203)
(test-end "addtup")

(test-begin "tup+")
(test-equal "(tup+ '(1 2) '(100 200)) is '(101 202)"
            (tup+ '(1 2) '(100 200)) '(101 202))
(test-end "tup+")

(test-begin "subst")
(test-equal "(subst 'c 'a '()) is '()" (subst 'c 'a '()) '())
(test-equal "(subst 'c 'a '(b b)) is '(b b)"
            (subst 'c 'a '(b b)) '(b b))
(test-equal "(subst 'c 'a '(a b a b a)) is '(c b a b a)"
            (subst 'c 'a '(a b a b a)) '(c b a b a))
(test-end "subst")

(test-begin "subst2")
(test-equal "(subst2 'c 'a 'b '()) is '()" (subst2 'c 'a 'b '()) '())
(test-equal "(subst2 'c 'a 'b '(b b)) is '(a b)"
            (subst2 'c 'a 'b '(b b)) '(c b))
(test-equal "(subst2 'c 'a 'b '(a b a b a)) is '(c b a b a)"
            (subst2 'c 'a 'b '(a b a b a)) '(c b a b a))
(test-end "subst2")

(test-begin "multisubst")
(test-equal "(multisubst 'c 'a '()) is '()" (multisubst 'c 'a '()) '())
(test-equal "(multisubst 'c 'a '(b b)) is '(b b)"
            (multisubst 'c 'a '(b b)) '(b b))
(test-equal "(multisubst 'c 'a '(a b a b a)) is '(c b c b c)"
            (multisubst 'c 'a '(a b a b a)) '(c b c b c))
(test-end "multisubst")

(test-begin "length")
(test-eqv "(length '(hotdogs with mustard sauerkraut and pickles)) is 6"
          (length '(hotdogs with mustard sauerkraut and pickles)) 6)
(test-eqv "(length '(ham and cheese on rye)) is 5"
          (length '(ham and cheese on rye)) 5)
(test-end "length")

(test-begin "pick")
(test-eqv "(pick 4 '(lasagna spaghetti ravioli macaroni meatball)) is 'macaroni"
          (pick 4 '(lasagna spaghetti ravioli macaroni meatball)) 'macaroni)
(test-end "pick")

(test-begin "rempick")
(test-equal "(rempick 3 '(hotdogs with hot mustard)) is '(hotdogs with mustard)"
            (rempick 3 '(hotdogs with hot mustard)) '(hotdogs with mustard))
(test-equal "(rempick 3 '(lemon meringue salty pie)) is '(lemon meringue pie)"
            (rempick 3 '(lemon meringue salty pie)) '(lemon meringue pie))
(test-end "rempick")

(test-begin "no-nums")
(test-equal "(no-nums '(5 pears 6 prunes 9 dates)) is '(pears prunes dates)"
            (no-nums '(5 pears 6 prunes 9 dates)) '(pears prunes dates))
(test-end "no-nums")

(test-begin "all-nums")
(test-equal "(all-nums '(5 pears 6 prunes 9 dates)) is '(5 6 9)"
            (all-nums '(5 pears 6 prunes 9 dates)) '(5 6 9))
(test-end "all-nums")

(test-begin "eqan")
(test-assert "(eqan? 'a 'a) is #t" (eqan? 'a 'a))
(test-assert "(eqan? 'b 'a) is #f" (not (eqan? 'b 'a)))
(test-assert "(eqan? 0 0) is #t" (eqan? 0 0))
(test-assert "(eqan? 1 0) is #f" (not (eqan? 1 0)))
(test-end "eqan")

(test-begin "occur")
(test-eqv "(occur 'a '()) is 0" (occur 'a '()) 0)
(test-eqv "(occur 'a '(a a a)) is 3" (occur 'a '(a a a)) 3)
(test-end "occur")

(test-begin "one?")
(test-assert "(one? 1) is #t" (one? 1))
(test-assert "(one? 2) is #f" (not (one? 0)))
(test-end "one?")

(load "testrunner")
(load "equality")
(load "firsts")
(load "insert")
(load "minus")
(load "multiply")
(load "rember")
(load "plus")
(load "subst")
(load "length")
(load "pick")
(load "nums")
(load "occur")
(load "one")
(load "atom")
(load "lat")
(load "member")
(load "leftmost")

(test-begin "<")
(test-assert "(< 1 2) is #t" (< 1 2))
(test-assert "(< 1 1) is #f" (not (< 1 1)))
(test-assert "(< 2 1) is #f" (not (< 2 1)))
(test-end)

(test-begin ">")
(test-assert "(> 1 2) is #f" (not (> 1 2)))
(test-assert "(> 1 1) is #f" (not (> 1 1)))
(test-assert "(> 2 1) is #t" (> 2 1))
(test-end)

(test-begin "=")
(test-assert "(= 1 2) is #f" (not (= 1 2)))
(test-assert "(= 1 1) is #t" (= 1 1))
(test-end)

(test-begin "firsts")
(test-equal "(firsts '()) is '()" (firsts '()) '())
(test-equal "(firsts '((1 2) (2 3))) is '(1 2)" (firsts '((1 2) (2 3))) '(1 2))
(test-end)

(test-begin "insertL")
(test-equal "(insertL 1 0 '()) is '()" (insertL 1 0 '()) '())
(test-equal "(insertL 1 0 '(2)) is '(1)" (insertL 1 0 '(1)) '(1))
(test-equal "(insertL 1 0 '(0)) is '(1 0)" (insertL 1 0 '(0)) '(1 0))
(test-equal "(insertL 'b 'c '(a c)) is '(a b c)" (insertL 'b 'c '(a c)) '(a b c))
(test-end)

(test-begin "insertR")
(test-equal "(insertR 1 0 '()) is '()" (insertR 1 0 '()) '())
(test-equal "(insertR 1 0 '(2)) is '(1)" (insertR 1 0 '(1)) '(1))
(test-equal "(insertR 1 0 '(0)) is '(0 1)" (insertR 1 0 '(0)) '(0 1))
(test-equal "(insertR 'b 'a '(a c)) is '(a b c)" (insertR 'b 'a '(a c)) '(a b c))
(test-end)

(test-begin "multiinsertR")
(test-equal "(multiinsertR 1 0 '()) is '()" (multiinsertR 1 0 '()) '())
(test-equal "(multiinsertR 1 0 '(2)) is '(1)" (multiinsertR 1 0 '(1)) '(1))
(test-equal "(multiinsertR 1 0 '(0 2 0)) is '(0 1 2 0 1)"
            (multiinsertR 1 0 '(0 2 0)) '(0 1 2 0 1))
(test-equal "(multiinsertR 'b 'a '(a c a)) is '(a b c a b)"
            (multiinsertR 'b 'a '(a c a)) '(a b c a b))
(test-end)

(test-begin "insertR*")
(test-equal "(insertR* 'roast 'chuck '((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood)) is '((how much (wood)) could ((a (wood) chuck roast)) (((chuck roast))) (if (a) ((wood chuck roast))) could chuck roast wood)"
            (insertR* 'roast 'chuck '((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood)) '((how much (wood)) could ((a (wood) chuck roast)) (((chuck roast))) (if (a) ((wood chuck roast))) could chuck roast wood))
(test-end)

(test-begin "insertL*")
(test-equal "(insertL* 'pecker 'chuck '((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood)) is '((how much (wood)) could ((a (wood) pecker chuck)) (((pecker chuck))) (if (a) ((wood pecker chuck))) could pecker chuck wood)"
            (insertL* 'pecker 'chuck '((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood))
            '((how much (wood)) could ((a (wood) pecker chuck)) (((pecker chuck))) (if (a) ((wood pecker chuck))) could pecker chuck wood))
(test-end)

(test-begin "sub1")
(test-eqv "(sub1 2) is 1" (sub1 2) 1)
(test-end)

(test-begin "o-")
(test-eqv "(o- 10 4) is 6" (o- 10 4) 6)
(test-end)

(test-begin "x")
(test-eqv "(x 2 200) is 400" (x 2 200) 400)
(test-end)

(test-begin "multirember")
(test-equal "(multirember 'a '()) is '()" (multirember 'a '()) '())
(test-equal "(multirember 'a '(b b)) is '(b b)"
            (multirember 'a '(b b)) '(b b))
(test-equal "(multirember 'a '(a b a b a)) is '(b b)"
            (multirember 'a '(a b a b a)) '(b b))
(test-end)

(test-begin "rember*")
(test-equal "(rember* 'cup '((coffee) cup ((tea) cup) (and (hick)) cup)) is '((coffee) ((tea)) (and (hick)))"
            (rember* 'cup '((coffee) cup ((tea) cup) (and (hick)) cup)) '((coffee) ((tea)) (and (hick))))
(test-equal "(rember* 'sauce '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce))) is '(((tomato)) ((bean)) (and ((flying))))"
            (rember* 'sauce '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce))) '(((tomato)) ((bean)) (and ((flying)))))
(test-end)

(test-begin "add1")
(test-eqv "(add1 1) is 2" (add1 1) 2)
(test-end)

(test-begin "o+")
(test-eqv "(o+ 20 99) is 119" (o+ 20 99) 119)
(test-end)

(test-begin "addtup")
(test-eqv "(addtup '(1 2 200)) is 203" (addtup '(1 2 200)) 203)
(test-end)

(test-begin "tup+")
(test-equal "(tup+ '(1 2) '(100 200)) is '(101 202)"
            (tup+ '(1 2) '(100 200)) '(101 202))
(test-end)

(test-begin "subst")
(test-equal "(subst 'c 'a '()) is '()" (subst 'c 'a '()) '())
(test-equal "(subst 'c 'a '(b b)) is '(b b)"
            (subst 'c 'a '(b b)) '(b b))
(test-equal "(subst 'c 'a '(a b a b a)) is '(c b a b a)"
            (subst 'c 'a '(a b a b a)) '(c b a b a))
(test-end)

(test-begin "subst2")
(test-equal "(subst2 'c 'a 'b '()) is '()" (subst2 'c 'a 'b '()) '())
(test-equal "(subst2 'c 'a 'b '(b b)) is '(a b)"
            (subst2 'c 'a 'b '(b b)) '(c b))
(test-equal "(subst2 'c 'a 'b '(a b a b a)) is '(c b a b a)"
            (subst2 'c 'a 'b '(a b a b a)) '(c b a b a))
(test-end)

(test-begin "multisubst")
(test-equal "(multisubst 'c 'a '()) is '()" (multisubst 'c 'a '()) '())
(test-equal "(multisubst 'c 'a '(b b)) is '(b b)"
            (multisubst 'c 'a '(b b)) '(b b))
(test-equal "(multisubst 'c 'a '(a b a b a)) is '(c b c b c)"
            (multisubst 'c 'a '(a b a b a)) '(c b c b c))
(test-end)

(test-begin "length")
(test-eqv "(length '(hotdogs with mustard sauerkraut and pickles)) is 6"
          (length '(hotdogs with mustard sauerkraut and pickles)) 6)
(test-eqv "(length '(ham and cheese on rye)) is 5"
          (length '(ham and cheese on rye)) 5)
(test-end)

(test-begin "pick")
(test-eqv "(pick 4 '(lasagna spaghetti ravioli macaroni meatball)) is 'macaroni"
          (pick 4 '(lasagna spaghetti ravioli macaroni meatball)) 'macaroni)
(test-end)

(test-begin "rempick")
(test-equal "(rempick 3 '(hotdogs with hot mustard)) is '(hotdogs with mustard)"
            (rempick 3 '(hotdogs with hot mustard)) '(hotdogs with mustard))
(test-equal "(rempick 3 '(lemon meringue salty pie)) is '(lemon meringue pie)"
            (rempick 3 '(lemon meringue salty pie)) '(lemon meringue pie))
(test-end)

(test-begin "no-nums")
(test-equal "(no-nums '(5 pears 6 prunes 9 dates)) is '(pears prunes dates)"
            (no-nums '(5 pears 6 prunes 9 dates)) '(pears prunes dates))
(test-end)

(test-begin "all-nums")
(test-equal "(all-nums '(5 pears 6 prunes 9 dates)) is '(5 6 9)"
            (all-nums '(5 pears 6 prunes 9 dates)) '(5 6 9))
(test-end)

(test-begin "eqan?")
(test-assert "(eqan? 'a 'a) is #t" (eqan? 'a 'a))
(test-assert "(eqan? 'b 'a) is #f" (not (eqan? 'b 'a)))
(test-assert "(eqan? 0 0) is #t" (eqan? 0 0))
(test-assert "(eqan? 1 0) is #f" (not (eqan? 1 0)))
(test-end)

(test-begin "occur")
(test-eqv "(occur 'a '()) is 0" (occur 'a '()) 0)
(test-eqv "(occur 'a '(a a a)) is 3" (occur 'a '(a a a)) 3)
(test-end)

(test-begin "occur*")
(test-eqv "(occur* 'banana '((banana) (split ((((banana ice))) (cream (banana)) sherbet)) (banana) (bread) (banana brandy))) is 5"
          (occur* 'banana '((banana) (split ((((banana ice))) (cream (banana)) sherbet)) (banana) (bread) (banana brandy)))
          5)
(test-end)

(test-begin "subst*")
(test-equal "(subst* 'orange 'banana '((banana ) (split ((((banana ice))) (cream (banana)) sherbet)) (banana) (bread) (banana brandy))) is '((orange) (split ((((orange ice))) (cream (orange)) sherbet)) (orange) (bread) (orange brandy))"
            (subst* 'orange 'banana '((banana ) (split ((((banana ice))) (cream (banana)) sherbet)) (banana) (bread) (banana brandy)))
            '((orange) (split ((((orange ice))) (cream (orange)) sherbet)) (orange) (bread) (orange brandy)))
(test-end)

(test-begin "one?")
(test-assert "(one? 1) is #t" (one? 1))
(test-assert "(one? 2) is #f" (not (one? 0)))
(test-end)

(test-begin "member*")
(test-assert "(member* 'chips '((potato) (chips ((with) fish) (chips)))) is #t"
             (member* 'chips '((potato) (chips ((with) fish) (chips)))))
(test-end)

(test-begin "leftmost")
(test-eqv  "(leftmost '((potato) (chips ((with) fish) (chips)))) is 'potato"
           (leftmost '((potato) (chips ((with) fish) (chips))))
           'potato)
(test-eqv "(leftmost '(((hot) (tuna (and))) cheese)) is 'hot"
          (leftmost '(((hot) (tuna (and))) cheese))
          'hot)
(test-end)

(test-begin "eqlist?")
(test-assert "(eqlist? '(strawberry ice cream) '(strawberry ice cream)) is #t"
             (eqlist? '(strawberry ice cream) '(strawberry ice cream)))
(test-assert "(eqlist? '(strawberry ice cream) '(strawberry cream ice)) is #f"
             (not (eqlist? '(strawberry ice cream) '(strawberry cream ice))))
(test-assert "(eqlist? '(banana ((split))) '((banana) (split)) is #f)"
             (not (eqlist? '(banana ((split))) '((banana) (split)))))
(test-assert "(eqlist? '(beef ((sausage)) (and (soda))) '(beef ((salami)) (and (soda)))) is #f"
             (not (eqlist? '(beef ((sausage)) (and (soda))) '(beef ((salami)) (and (soda))))))
(test-assert "(eqlist? '(beef ((sausage)) (and (soda))) '(beef ((sausage)) (and (soda)))) is #t"
             (eqlist? '(beef ((sausage)) (and (soda))) '(beef ((sausage)) (and (soda)))))
(test-end)

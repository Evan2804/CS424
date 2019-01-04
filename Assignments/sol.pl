solved(B) :- solved(B,N), N == 1.
solved([],0).
solved([H|T], N) :- solved(T, A), count(H,C), N is C + A.

count([],0).
count([H|T],N) :- H == o, count(T,N).
count([H|T],N) :- H == x, count(T,M), N is M + 1.

jumper(X) :- solved(X).
jumper(H) :- horizontal(H,X,_), vertical(X,Y), jumper(Y).
jumper(H) :- horizontal(H,X,B), B == t, jumper(X).
jumper(H) :- vertical(H,X), jumper(X).

horizontal([],[],_).
horizontal([H|T],X,B) :- horizontal_checker(H,Z,B), B \= t, horizontal(T,Y,B), append([Z],Y,X).
horizontal([H|T],X,B) :- horizontal_checker(H,Z,B), B == t, append([Z],T,X).
horizontal([H|T],X,B) :- horizontal(T,Y,B), append([H],Y,X).
horizontal_checker([H1|[H2|[H3|T]]],Y,B) :- H1 == x, H2 == x, H3 == o, append([o,o,x],T,Y), B = t.
horizontal_checker([H1|[H2|[H3|T]]],Y,B) :- H1 == o, H2 == x, H3 == x, append([x,o,o],T,Y), B = t.
horizontal_checker([H1|[H2|[H3|T]]],X,_) :- append([H1,H2,H3],T,X).

%vertical only works for a 3x3 matrix.
vertical([H1|[H2|[H3|_]]],Q) :- vertical_checker(H1,H2,H3,X,Y,Z), append([X],[Y],P), append(P,[Z],Q).
vertical_checker([H1|T1],[H2|T2],[H3|T3],X,Y,Z) :- H1 == x, H2 == x, H3 == o, append([o],T1,X), append([o],T2,Y), append([x],T3,Z).
vertical_checker([H1|T1],[H2|T2],[H3|T3],X,Y,Z) :- H1 == o, H2 == x, H3 == x, append([x],T1,X), append([o],T2,Y), append([o],T3,Z).
vertical_checker([H1|T1],[H2|T2],[H3|T3],X,Y,Z) :- vertical_checker(T1,T2,T3,A,B,C), append([H1],A,X), append([H2],B,Y), append([H3],C,Z).

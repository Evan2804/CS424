% 2018 January
mul(X,Y,Z) :- my_length(X,A), my_length(Y,B), my_length(Z,C), D is A * B, D == C.
my_length([],0).
my_length([_|T],N) :- my_length(T,C), N is C + 1.
% Example => mul([a,b],[a,b,c],[w,x,y,z,p,d]). => True


% 2018 Autumm
scissors([H|T],A,[],Z) :- H == A, T == Z.
scissors([HX|TX],A,[HY|TY],Z) :- HX \= A, HX == HY, scissors(TX,A,TY,Z).
% Example => scissors([a,b,c,d,e,f],c,[a,b],[d,e,f]). => true.


% 2017 Autumn
thrice(X,Y) :- thrice(X,Y,0).
thrice(_,[],Z) :- Z == 3.
thrice(X,[H|T],Z) :- H == X, C is Z + 1, thrice(X,T,C).
thrice(X,[H|T],Z) :- H \= X, thrice(X,T,Z).
% Example => thrice(e,[t,h,e,b,e,a,t,b,e]). => yes


% 2016 January
noah(X,Y,Z) :- noah(X,Y,Z,[]).
noah([],[],Z,A) :- Z == A.
noah([Xh|Xt],[Yh|Yt],Z,A) :- append(A,[Xh],B), append(B,[Yh],C), noah(Xt,Yt,Z,C).
% Example => noah([a,b,c,d],[aye,bee,sea,dee],[a,aye,b,bee,c,sea,d,dee]). => true.


% 2015 January
doublemember(X,Y) :- doublemember(X,Y,0).
doublemember(_,[],N) :- N >= 2.
doublemember(X,[H|T],N) :- X==H, C is N + 1, doublemember(X,T,C).
doublemember(X,[H|T],N) :- X\=H, doublemember(X,T,N).
% Example => doublemember(a,[the,a,quick,brown,a,fox]). => true


% 2015 Autumn
nOah([],[],[]).
nOah([XH|XT],[YH|YT],[ZH1|[ZH2|ZT]]) :- XH == ZH1, YH == ZH2, noah(XT,YT,ZT).
% Example => nOah([a,b,c,d],[aye,bee,sea,dee],[a,aye,b,bee,c,sea,d,dee]). => true.
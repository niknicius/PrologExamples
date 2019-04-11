triangulo(X,A,B,C):-
numeric(A),
numeric(B),
numeric(C),
A is number(A),
B is number(B),
C is number(C),
A<B+C,
        B<C+A,
        C<B+A.


quadrado(a,2,2,2,2).
quadrado(X,A,B,C,D):-
numeric(A),
numeric(B),
numeric(C),
numeric(D),
A is number(A),
B is number(B),
C is number(C),
D is number(D),
A==B,B==C,C==D.

retangulo(X,A,B,C,D):-
numeric(A),
numeric(B),
numeric(C),
numeric(D),
A is number(A),
B is number(B),
C is number(C),
D is number(D),

        A=C,
        A=\=B,
        B=D,
        C=\=D.

trapezio(X,A,B,C,D):-
numeric(A),
numeric(B),
numeric(C),
numeric(D),

A is number(A),
B is number(B),
C is number(C),
D is number(D),
A=C, B<D.

circunferencia(X,A,B):-
numeric(A),
numeric(B),
A is number(A),
B is number(B),
2* A =:= B.

% Verifica se é um bloco
bloco(X):-
	triangulo(X,A,B,C);
	quadrado(X,A,B,C,D);
	retangulo(X,A,B,C,D);
	trapezio(X,A,B,C,D);
	circunferencia(X,A,B).

% Verifica se é um bloco estavel
estavel(X):-
	quadrado(X,A,B,C,D);
	retangulo(X,A,B,C,D);
	trapezio(X,A,B,C,D).

sobre(a,mesa).
sobre(b,mesa).

% Defube que X está sobre Y se Y é estavel
sobre(X,Y):- bloco(X), bloco(Y), estavel(Y).

abaixo(X,Y):- sobre(Y,X).
abaixo(X,Y):- sobre(Z,X),
			acima(Y,Z).

% X está acima de Y se Y ou seus anteriores está sobre X
acima(X,Y):- sobre(X,Y).
acima(X,Y):- sobre(X,Z),
			acima(Z,Y).

% Verifica se é um bloco é um triangulo
e_triangulo(X):- bloco(X), triangulo(X,A,B,C).

% Verifica se Y é um lado de X
e_lado(Y,X):- quadrado(X,Y,B,C,D);
quadrado(X,A,Y,C,D);
quadrado(X,A,B,Y,D);
quadrado(X,A,B,C,Y);

retangulo(X,Y,B,C,D);
retangulo(X,A,Y,C,D);
retangulo(X,A,B,Y,D);
retangulo(X,A,B,C,Y);

trapezio(X,Y,B,C,D);
trapezio(X,A,Y,C,D);
trapezio(X,A,B,Y,D);
trapezio(X,A,B,C,Y);

triangulo(X,Y,B,C);
triangulo(X,A,Y,C);
triangulo(X,A,B,Y).

entre(X,Y,Z):- acima(X,Y), abaixo(X,Z).
entre(X,Y,Z):- acima(X,Z), abaixo(X,Y).

imprimir_todos_acima(X):- 
sobre(Y,X),
write(Y),nl,fail.

imprimir_todos_acima_mesa():-
	sobre(X,mesa), write(X), nl, fail.

?- imprimir_todos_acima_mesa().

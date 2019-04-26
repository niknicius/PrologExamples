moverDisco(1,X,Y,_) :-  
    write("Mova o disco da(o) "), 
    write(X), 
    write(" para a(o) "), 
    write(Y), 
    nl. 
moverDisco(N,X,Y,Z) :- 
    N>1, 
    M is N-1, 
    moverDisco(M,X,Z,Y), 
    moverDisco(1,X,Y,_), 
    moverDisco(M,Z,Y,X).

?-  moverDisco(5,esquerda,direita,centro).
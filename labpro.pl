start:-
    X = 1,
    Y = 1,
    GX = 8,
    GY = 9,
    MP =[
    [#, # , # , # , # , # , # , # , # , # ],
    [#,' ', # ,' ',' ', # ,' ',' ',' ', # ],
    [#,' ', # ,' ',' ', # ,' ',' ', # , # ],
    [#,' ',' ',' ',' ', # ,' ', # , # , # ],
    [#,' ', # ,' ',' ',' ',' ',' ',' ', # ],
    [#,' ', # ,' ', # , # ,' ', # ,' ', # ],
    [#,' ',' ',' ',' ',' ',' ', # ,' ', # ],
    [#,' ',' ', # , # , # ,' ',' ',' ', # ],
    [#,' ',' ', # , # ,' ',' ',' ',' ', # ],
    [#, # , # , # , # , # , # , # , # , # ]],
    chamada(X,Y,ST,GX,GY,MP,MF).


imprima(X,Y,MP,MF):-
    write('\n'),
    acessa(MP,X,Y,R),
    R \= '#',
    R \= 'x',
    modifica(MP,X,Y,x,[],MF),
    writef('Modificando a posicao (%w,%w), que antes tinha --, por r:\n',[X,Y]),
    imprime(MF).

chamada(X,Y,ST,GX,GY,MP,MF):-
    ida1(X,Y,ST,GX,GY,MP,MF),
    ida2(X,Y,ST,GX,GY,MP,MF),
    ida3(X,Y,ST,GX,GY,MP,MF),
    ida4(X,Y,ST,GX,GY,MP,MF).

ida1(X,Y,ST,GX,GY,MP,MF):-
    imprima( X, Y,MP,MF),
    YF is Y + 1,
    recur(X,YF,ST,GX,GY,MF,QQ).

ida2(X,Y,ST,GX,GY,MP,MF):-
    imprima( X, Y,MP,MF),
    XF is X + 1,
    recur(XF,Y,ST,GX,GY,MF,QQ).

ida3(X,Y,ST,GX,GY,MP,MF):-
    imprima( X, Y,MP,MF),
    XF is X - 1,
    recur(XF,Y,ST,GX,GY,MF).

ida4(X,Y,ST,GX,GY,MP,MF):-
    imprima( X, Y,MP,MF),
    YF is Y - 1,
    recur(X,YF,ST,GX,GY,MF,QQ).

recur( _, _, ST, _, _, _,_):-
    ST == 1.

recur(X,Y,ST,GX,GY,_,_):-
    GX == X,
    GY == Y,
    ST = 1.

recur(X,Y,ST,GX,GY,MP,MF):-
    chamada(X,Y,ST,GX,GY,MP,MF).

mudalinha([],_,_,R,[R]).

mudalinha([M|T],0,L,V,R):-
    append(V,[L],Vo),
    mudalinha(T,-1,L,Vo,R).

mudalinha([M|T],X,L,V,R):-
    X \== 0,
    Xo is X - 1,
    append(V,[M],Vo),
    mudalinha(T,Xo,L,Vo,R).

modifica([],_,_,_,R,R).

modifica([M|T],X,0,L,V,R):-
    mudalinha(M,X,L,[],Mo),
    append(V,Mo,Vo),
    modifica(T,X,-1,L,Vo,R).

modifica([M|T],X,Y,L,V,R):-
    Y \== 0,
    Yo is Y-1,
    append(V,[M],Vo),
    modifica(T,X,Yo,L,Vo,R).

acessa(M,X,Y,R):-
    nth0(Y,M,L),
    nth0(X,L,R).

imprime([]).
imprime([M|T]):-
    imprimelinha(M),
    write('\n'),
    imprime(T).

imprimelinha([]).
imprimelinha([L|T]):-
    write(L),
    imprimelinha(T).

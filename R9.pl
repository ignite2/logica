start:-
    X = 1,
    Y = 1,
    GX = 8,
    GY = 8,
    MP =[
    [#, # , # , # , # , # , # , # , # , # ],
    [#,' ', # ,' ',' ', # ,' ',' ',' ', # ],
    [#,' ', # ,' ', # ,' ',' ', # ,' ', # ],
    [#,' ',' ',' ', # , # ,' ', # , # , # ],
    [#,' ', # ,' ',' ',' ',' ',' ',' ', # ],
    [#,' ', # ,' ', # , # ,' ', # ,' ', # ],
    [#,' ',' ',' ',' ', # ,' ', # ,' ', # ],
    [#, # ,' ', # , # , # ,' ',' ',' ', # ],
    [#,' ',' ', # ,' ',' ',' ', # ,' ', # ],
    [#, # , # , # , # , # , # , # , # , # ]],
    chamada(X,Y,_,GX,GY,MP,_),
    !.


imprima(X,Y,MP,MF):-
    write('\n\n'),
    modifica(MP,X,Y,x,[],MF),
    writef('Tentando:\nPosicao (%w,%w)\n',[X,Y]),
    imprime(MF).

imprimaachei(X,Y,MP,MF):-
    write('\n\n'),
    modifica(MP,X,Y,x,[],MF),
    writef('Achei!!!!!!! Estava no x=%w e y=%w\n',[X,Y]),
    imprime(MF).

chamada(X,Y,ST,GX,GY,MP,MF):-
    ida1(X,Y,ST,GX,GY,MP,MF),
    ida2(X,Y,ST,GX,GY,MP,MF),
    ida3(X,Y,ST,GX,GY,MP,MF),
    ida4(X,Y,ST,GX,GY,MP,MF).

ida1(X,Y,ST,GX,GY,MP,MF):-
    var(ST),
    pode(MP,X,Y,_),
    imprima( X, Y,MP,MF),
    YF is Y + 1,
    recur(X,YF,ST,GX,GY,MF,_).

ida1(_,_,_,_,_,_,_).

ida2(X,Y,ST,GX,GY,MP,MF):-
    var(ST),
    pode(MP,X,Y,_),
    imprima( X, Y,MP,MF),
    XF is X + 1,
    recur(XF,Y,ST,GX,GY,MF,_).

ida2(_,_,_,_,_,_,_).

ida3(X,Y,ST,GX,GY,MP,MF):-
    var(ST),
    pode(MP,X,Y,_),
    imprima( X, Y,MP,MF),
    XF is X - 1,
    recur(XF,Y,ST,GX,GY,MF,_).

ida3(_,_,_,_,_,_,_).

ida4(X,Y,ST,GX,GY,MP,MF):-
    var(ST),
    pode(MP,X,Y,_),
    imprima( X, Y,MP,MF),
    YF is Y - 1,
    recur(X,YF,ST,GX,GY,MF,_).

ida4(_,_,_,_,_,_,_).

recur( _, _, ST, _, _, _,_):-
    ST == 1,
    write('Tudo ok------------\n').

recur(X,Y,ST,GX,GY,MP,MF):-
    GX == X,
    GY == Y,
    ST = 1,
    imprimaachei(X,Y,MP,MF).

recur(X,Y,ST,GX,GY,MP,MF):-
    chamada(X,Y,ST,GX,GY,MP,MF).

pode(MP,X,Y,_):-
    acessa(MP,X,Y,R),
    R \= '#',
    R \= 'x'.

mudalinha([],_,_,R,[R]).

mudalinha([_|T],0,L,V,R):-
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

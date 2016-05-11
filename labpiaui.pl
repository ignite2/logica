start:-
    X1=1,
    Y1=1,
    XF=6,
    YF=5,
    Mapa =[
    [#, # , # , # , # , # , # , # , # , # ],
    [#,' ', # ,' ', # , # ,' ',' ',' ', # ],
    [#,' ', # ,' ',' ', # ,' ',' ', # , # ],
    [#,' ',' ',' ', # , # ,' ', # , # , # ],
    [#,' ', # ,' ',' ',' ',' ',' ',' ', # ],
    [#,' ', # ,' ', # , # ,' ', # ,' ', # ],
    [#,' ',' ',' ',' ',' ',' ', # ,' ', # ],
    [#,' ', # ,' ', # , # ,' ',' ',' ', # ],
    [#,' ', # ,' ', # ,' ',' ', # , # , # ],
    [#, # , # , # , # , # , # , # , # , # ]],
    ande(X1,Y1,XF,YF,_,Mapa),
    !.


ande(X1,Y1,XF,YF,PA,Mapa):-
    caminho1(X1,Y1,XF,YF,PA,Mapa),
    caminho2(X1,Y1,XF,YF,PA,Mapa),
    caminho3(X1,Y1,XF,YF,PA,Mapa),
    caminho4(X1,Y1,XF,YF,PA,Mapa).



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
    nth0(X,L,R),
    writef('o valor de r e%w',[R]).

verifica(X1,Y1,_,_,Mapa):-
    acessa(Mapa,X1,Y1,R),
    R \= 'x',
    R \= '#'.

impressao(X1,Y1,Mapa,MapaModificado):-
    modifica(Mapa,X1,Y1,x,[],MapaModificado),
    writef('\n\nModificando a posicao (%w,%w), que antes tinha %w, por x:\n',[X1,Y1,R]),
    imprime(MapaModificado).

imprimafim(X1,Y1,Mapa):-
    modifica(Mapa,X1,Y1,@,[],MapaModificado),
    writef('\n\nAvisa que eu cheguei no (%w,%w), que antes tinha %w, por x:\n',[X1,Y1,R]),
    imprime(MapaModificado).


caminho2(X1,Y1,XF,YF,PA,Mapa):-
    var(PA),
    verifica(X1,Y1,XF,YF,Mapa),
    impressao(X1,Y1,Mapa,MapaM),
    X0 is X1+1,
    parte(X0,Y1,XF,YF,PA,MapaM).

caminho2(_,_,_,_,_,_).


caminho4(X1,Y1,XF,YF,PA,Mapa):-
    var(PA),
    verifica(X1,Y1,XF,YF,Mapa),
    impressao(X1,Y1,Mapa,MapaM),
    X0 is X1-1,
    parte(X0,Y1,XF,YF,PA,MapaM).

caminho4(_,_,_,_,_,_).


caminho1(X1,Y1,XF,YF,PA,Mapa):-
    var(PA),
    verifica(X1,Y1,XF,YF,Mapa),
    impressao(X1,Y1,Mapa,MapaM),
    Y0 is Y1+1,
    parte(X1,Y0,XF,YF,PA,MapaM).

caminho1(_,_,_,_,_,_).

caminho3(X1,Y1,XF,YF,PA,Mapa):-
    var(PA),
    verifica(X1,Y1,XF,YF,Mapa),
    impressao(X1,Y1,Mapa,MapaM),
    Y0 is Y1-1,
    parte(X1,Y0,XF,YF,PA,MapaM).

caminho3(_,_,_,_,_,_).

parte(X,Y,XF,YF,PA,MapaM):-
    X == XF,
    Y == YF,
    PA = 1,
    imprimafim(X,Y,MapaM).

parte(X,Y,XF,YF,PA,MapaM):-
    ande(X,Y,XF,YF,PA,MapaM).

imprime([]).

imprime([M|T]):-
    imprimelinha(M),
    write('\n'),
    imprime(T).

imprimelinha([]).

imprimelinha([L|T]):-
    write(L),
    imprimelinha(T).

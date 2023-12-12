%Miguel Póvoa Raposo, ist1109686
:- use_module(library(clpfd)). % para poder usar transpose/2
:- set_prolog_flag(answer_write_options,[max_depth(0)]). % ver listas completas
:- ['puzzlesAcampar.pl']. % Ficheiro dado. No Mooshak tera mais puzzles.

/*
    -vizinhanca((L,C), Vizinhanca) é verdade se Vizinhanca é uma lista ordenada de cima para baixo e da esquerda para a 
    direita, sem elementos repetidos, com as cordenadas das posições adjacentes com angulos retos.
*/
vizinhanca((X,Y), L):-
    Up is Y + 1, Down is Y - 1,
    Left is X - 1, Right is X + 1,
    L = [(Left,Y),(X,Down),(X,Up),(Right,Y)].


/*
    -vizinhancaAlargada((L,C), VizinhancaAlargada) é verdade se VizinhancaAlargada é uma lista ordenada de cima para baixo e da esquerda
    para a direita, sem elementos repetidos, com as cordenadas anteriores e as diagonais.
*/
vizinhancaAlargada((X, Y), Sres):-
    Up is Y + 1, Down is Y - 1,
    Left is X - 1, Right is X + 1,
    vizinhanca((X,Y),L1),
    append(L1,[(Left,Down),(Right,Up),(Left,Up),(Right,Down)], Res),
    sort(Res, Sres).
    

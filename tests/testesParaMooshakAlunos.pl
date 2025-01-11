:-['../src/Projeto.pl']. %Carrega o ficheiro do projeto.
% Auxiliar para avaliacao 
limpaTabuleiro([], []) :-!.
limpaTabuleiro([L | T], [L1 | T1]) :- limpaLinha(L, L1), limpaTabuleiro(T, T1).

limpaLinha([X], [X]) :- (X == 'r'; X == t; X == a), !.
limpaLinha([_], [v]) :- !.
limpaLinha([H | T], [H | L]) :- (H == 'r'; H == t; H == a), !, limpaLinha(T, L).
limpaLinha([_ | T], [v | L]) :- limpaLinha(T, L).

%--------------------------------
% vizinhanca (P1)
%--------------------------------

% Teste 1 - Publico
% Predicado vizinhanca (P1)
% Cotacao total: 0.75
% Cotacao real: 0

:- vizinhanca((3, 4), L), writeln(L); writln(false).
% output: [(2, 4),  (3, 3),  (3, 5),  (4, 4)].

:- vizinhanca((3, 1), L), writeln(L); writln(false).
% output: [(2,1),(3,0),(3,2),(4,1)].

%--------------------------------
% vizinhancaAlargada (P2)
%--------------------------------

% Teste 3 - Publico
% Predicado vizinhancaAlargada (P2)
% Cotacao total: 0.75
% Cotacao real: 0

:- vizinhancaAlargada((3, 4), L), writeln(L); writeln(false).
% output: [(2,3),(2,4),(2,5),(3,3),(3,5),(4,3),(4,4),(4,5)].

:- vizinhancaAlargada((3, 1), L), writeln(L); writeln(false).
% output: [(2,0),(2,1),(2,2),(3,0),(3,2),(4,0),(4,1),(4,2)].

%--------------------------------
% todasCelulas (P3)
%--------------------------------

% Teste 5 - Publico
% Predicado todasCelulas (P3)
% Cotacao total: 1
% Cotacao real: 0

:- puzzle(6-13, (T, _, _)), todasCelulas(T, TodasCelulas), writeln(TodasCelulas); writeln(false).
% output: [(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6)]

%--------------------------------
% todasCelulas (P4)
%--------------------------------

% Teste 7 - Publico
% Predicado todasCelulas/3 (P4)
% Cotacao total: 1.0
% Cotacao real: 0

:- puzzle(6-13, (T, _, _)), todasCelulas(T, TodasCelulas, a), writeln(TodasCelulas); writeln(false).
% output: [(1,5),(2,1),(2,6),(3,4),(4,5),(5,3),(6,3)]
:- puzzle(6-13, (T, _, _)), todasCelulas(T, TodasCelulas, VAR), var(VAR), writeln(TodasCelulas); writeln(false).
% output: [(1,1),(1,2),(1,3),(1,4),(1,6),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,5),(3,6),(4,1),(4,2),(4,3),(4,4),(4,6),(5,1),(5,2),(5,4),(5,5),(5,6),(6,1),(6,2),(6,4),(6,5),(6,6)]

%--------------------------------
% calculaObjectosTabuleiro (P5)
%--------------------------------

% Teste 9 - Publico
% Predicado calculaObjectosTabuleiro (P5)
% Cotacao total: 1
% Cotacao real: 0

:- puzzle(6-13, (T, _, _)), calculaObjectosTabuleiro(T, CLinhas, CColunas, a), write(CLinhas), write(" "), writeln(CColunas); writeln(false).
% output: [1,2,1,1,1,1] [1,0,2,1,2,1]

:- puzzle(6-13, (T, _, _)), calculaObjectosTabuleiro(T, CLinhas, CColunas, VAR), var(VAR), write(CLinhas), write(" "), writeln(CColunas); writeln(false).
% output: [5,4,5,5,5,5] [5,6,4,5,4,5]

:- sol(6-13, (T, _, _)), calculaObjectosTabuleiro(T, CLinhas, CColunas, t), write(CLinhas), write(" "), writeln(CColunas); writeln(false).
% output: [2,1,1,1,1,1] [1,1,1,1,1,2]

%--------------------------------
% celulaVazia (P6)
%--------------------------------

% Teste 11 - Publico
% Predicado celulaVazia (P6)
% Cotacao total: 1
% Cotacao real: 0

:- puzzle(6-13, (T, _, _)), celulaVazia(T, (1, 2)), writeln(true); writeln(false).  
% output: true

:- puzzle(6-13, (T, _, _)), celulaVazia(T, (1, 5)), writeln(false); writeln(true).  
% output: true

%--------------------------------
% insereObjectoCelula/2 (P7)
%--------------------------------

% Teste 13 - Publico
% Predicado insereObjectoCelula (P7)
% Cotacao total: 1
% Cotacao real: 0

:- puzzle(6-13, (T, _, _)), insereObjectoCelula(T, r, (1,1)), limpaTabuleiro(T, T1), T1 = [[r,v,v,v,a,v],[a,v,v,v,v,a],[v,v,v,a,v,v],[v,v,v,v,a,v],[v,v,a,v,v,v],[v,v,a,v,v,v]], writeln(true); writeln(false). 
% output true

:- puzzle(6-13, (T, _, _)), insereObjectoCelula(T, r, (1,5)),limpaTabuleiro(T, T1), T1 = [[v,v,v,v,a,v],[a,v,v,v,v,a],[v,v,v,a,v,v],[v,v,v,v,a,v],[v,v,a,v,v,v],[v,v,a,v,v,v]], writeln(true); writeln(false). 
% output true

%--------------------------------
% insereObjectoEntrePosicoes (P8)
%--------------------------------

% Teste 15 - Publico
% Predicado insereObjectoEntrePosicoes (P8)
% Cotacao total: 1
% Cotacao real: 0

:- puzzle(6-13, (T, _, _)), insereObjectoEntrePosicoes(T, r, (1,1), (1,5)), limpaTabuleiro(T, T1), T1 = [[r,r,r,r,a,v],[a,v,v,v,v,a],[v,v,v,a,v,v],[v,v,v,v,a,v],[v,v,a,v,v,v],[v,v,a,v,v,v]], writeln(true); writeln(false). 
% output: true

:- puzzle(6-13, (T, _, _)), insereObjectoEntrePosicoes(T, r, (1,5), (1,6)), limpaTabuleiro(T, T1), T1 = [[v,v,v,v,a,r],[a,v,v,v,v,a],[v,v,v,a,v,v],[v,v,v,v,a,v],[v,v,a,v,v,v],[v,v,a,v,v,v]], writeln(true); writeln(false). 
% output: true

%--------------------------------
% relva (P9)
%--------------------------------

% Teste 17 - Publico
% Predicado relva (P9)
% Cotacao total: 1.2
% Cotacao real: 0

:- puzzle(6-14, P), relva(P), P = (T, _, _), limpaTabuleiro(T, T1), T1 = [[v,a,v,a,v,r],[a,r,r,r,r,r],[v,v,v,v,v,r],[v,v,a,a,v,r],[v,v,v,v,v,r],[v,a,v,v,a,r]], writeln(true); writeln(false). 
% output: true

:- puzzle(6-13, P), relva(P), P = (T, _, _), limpaTabuleiro(T, T1), T1 = [[v,v,v,v,a,v],[a,v,v,v,v,a],[v,v,v,a,v,v],[v,v,v,v,a,v],[v,v,a,v,v,v],[v,v,a,v,v,v]], writeln(true); writeln(false). 
% output: true

%--------------------------------
% inacessiveis (P10)
%--------------------------------

% Teste 19 - Publico
% Predicado inacessiveis (P10)
% Cotacao total: 1.2
% Cotacao real: 0

:- puzzle(6-14, (T, _, _)), inacessiveis(T), limpaTabuleiro(T, T1), T1 = [[v,a,v,a,v,r],[a,v,r,v,r,r],[v,r,v,v,r,r],[r,v,a,a,v,r],[r,v,v,v,v,r],[v,a,v,v,a,v]], writeln(true); writeln(false).
% output:  true

%--------------------------------
% aproveita (P11)
%--------------------------------

% Teste 21 - Publico
% Predicado aproveita (P11)
% Cotacao total: 1.2
% Cotacao real: 0

:- P = ([[_13416,a,_13428,a,_13440,r],[a,r,r,r,r,r],[_13500,_13506,_13512,_13518,_13524,r],[_13542,_13548,a,a,_13566,r],[_13584,_13590,_13596,_13602,_13608,r],[_13626,a,_13638,_13644,a,r]],[3,0,1,1,1,1],[2,1,1,1,2,0]), aproveita(P), P = (T, _, _), limpaTabuleiro(T, T1), T1 = [[t,a,t,a,t,r],[a,r,r,r,r,r],[v,v,v,v,v,r],[v,v,a,a,v,r],[v,v,v,v,v,r],[v,a,v,v,a,r]], writeln(true); writeln(false).
% output: true

%--------------------------------
% limpaVizinhancas (P12)
%--------------------------------

% Teste 23 - Publico
% Predicado limpaVizinhancas (P12)
% Cotacao total: 1.2
% Cotacao real: 0

:- P =  ([[t,a,t,a,t,r],[a,r,r,r,r,r],[_43514,_43520,r,_43532,_43538,r],[_43556,t,a,a,_43580,r],[_43598,_43604,r,_43616,_43622,r],[_43640,a,r,_43658,a,r]],[3,0,1,1,1,1],[2,1,1,1,2,0]), limpaVizinhancas(P), P = (T, _, _), limpaTabuleiro(T, T1), T1 = [[t,a,t,a,t,r],[a,r,r,r,r,r],[r,r,r,v,v,r],[r,t,a,a,v,r],[r,r,r,v,v,r],[v,a,r,v,a,r]], writeln(true); writeln(false).
% output: true

%--------------------------------
% unicaHipotese (P13)
%--------------------------------

% Teste 25 - Publico
% Predicado unicaHipotese (P13)
% Cotacao total: 1.2
% Cotacao real: 0

:- P =  ([[t,a,t,a,t,r],[a,r,r,r,r,r],[_7886,_7892,r,_7904,_7910,r],[_7928,_7934,a,a,_7952,r],[_7970,_7976,r,_7988,_7994,r],[_8012,a,r,_8030,a,r]],[3,0,1,1,1,1],[2,1,1,1,2,0]), unicaHipotese(P), P = (T, _, _), limpaTabuleiro(T, T1), T1 = [[t,a,t,a,t,r],[a,r,r,r,r,r],[v,v,r,v,v,r],[v,t,a,a,v,r],[v,v,r,v,v,r],[v,a,r,v,a,r]], writeln(true); writeln(false).
% output: true

%--------------------------------
% valida (P14)
%--------------------------------

% Teste 27 - Publico
% Predicado valida (P14)
% Cotacao total: 1
% Cotacao real: 0

:- valida([(1,1),(1,3)], [(1,2),(1,4)]), writeln(true); writeln(false).
% output: true

:- valida([(1,1),(1,3)], [(1,5),(1,4)]), writeln(false); writeln(true).
% output: true

%--------------------------------
% resolve (P15)
%--------------------------------

% Teste 29 - Publico
% Predicado resolve (P15)
% Cotacao total: 1.5
% Cotacao real: 0

:- puzzle(6-13, P), resolve(P), sol(6-13, P1), P == P1, writeln(true); writeln(false).
% output: true

:- puzzle(6-14, P), resolve(P), sol(6-14, P1), P == P1, writeln(true); writeln(false).
% output: true

:- puzzle(8-1, P), resolve(P), sol(8-1, P1), P == P1, writeln(true); writeln(false).
% output: true

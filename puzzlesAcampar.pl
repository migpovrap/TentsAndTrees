% Exemplos do enunciado - puzzles iniciais

puzzle(6-13, 
([
[_, _, _, _, a, _],
[a, _, _, _, _, a],
[_, _, _, a, _, _],
[_, _, _, _, a, _],
[_, _, a, _, _, _],
[_, _, a, _, _, _]],
[2, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 2])).

puzzle(6-14, 
([
[_, a, _, a, _, _],
[a, _, _, _, _, _],
[_, _, _, _, _, _],
[_, _, a, a, _, _],
[_, _, _, _, _, _],
[_, a, _, _, a, _]],
[3, 0, 1, 1, 1, 1], [2, 1, 1, 1, 2, 0])).

puzzle(8-1, 
([
[_, _, _, _, a, _, a, _],
[a, _, _, _, _, _, _, a],
[_, _, _, _, _, _, _, _],
[_, a, _, _, a, _, _, _],
[_, _, _, a, _, a, a, a],
[a, _, _, _, _, _, _, _],
[_, _, a, _, _, _, _, _],
[_, _, _, a, _, _, _, _]],
[4, 0, 1, 2, 1, 3, 0, 2], [2, 0, 2, 2, 2, 2, 1, 2])).

% Exemplos do enunciado - solucao dos puzzles

sol(6-13, ([[t,r,r,r,a,t],
[a,r,r,t,r,a],
[r,r,r,a,r,t],
[r,r,t,r,a,r],
[r,r,a,r,t,r],
[r,t,a,r,r,r]],
[2,1,1,1,1,1],[1,1,1,1,1,2])).

sol(6-14, ([[t,a,t,a,t,r],
[a,r,r,r,r,r],
[r,r,r,t,r,r],
[r,t,a,a,r,r],
[r,r,r,r,t,r],
[t,a,r,r,a,r]],
[3,0,1,1,1,1],[2,1,1,1,2,0])).


sol(8-1, ([
[t,r,r,t,a,t,a,t],
[a,r,r,r,r,r,r,a],
[r,r,r,r,t,r,r,r],
[r,a,t,r,a,r,t,r],
[t,r,r,a,r,a,a,a],
[a,r,r,t,r,t,r,t],
[r,r,a,r,r,r,r,r],
[r,r,t,a,t,r,r,r]],
[4,0,1,2,1,3,0,2],[2,0,2,2,2,2,1,2])).

% Exemplos do enunciado - predicados
% Copiar para o terminal em vez de copiar do pdf e dar asneira

/*

vizinhanca((3, 4), L).
vizinhancaAlargada((3, 4), L).
vizinhanca((3, 1), L).

puzzle(6-13, (T, _, _)), todasCelulas(T, TodasCelulas).
puzzle(6-13, (T, _, _)), todasCelulas(T, TodasCelulas, a).
puzzle(6-13, (T, _, _)), todasCelulas(T, TodasCelulas, Z).


puzzle(6-13, (T, _, _)), calculaObjectosTabuleiro(T, CLinhas, CColunas, a).
puzzle(6-13, (T, _, _)), calculaObjectosTabuleiro(T, CLinhas, CColunas, X).
puzzle(6-13, (T, _, _)), calculaObjectosTabuleiro(T, CLinhas, CColunas, Y).

puzzle(6-13, (T, _, _)), celulaVazia(T, (1, 2)).
puzzle(6-13, (T, _, _)), celulaVazia(T, (1, 5)).
puzzle(6-13, (T, _, _)), celulaVazia(T, (0, 5)).
puzzle(6-13, (T, _, _)), celulaVazia(T, (1, 7)).

T = [[_, _, a, _], [_, _, _, _], [a, a, a, a], [_, _, a, _]], insereObjectoCelula(T, r, (1,1)).
T = [[_, _, a, _], [_, _, _, _], [a, a, a, a], [_, _, a, _]], insereObjectoCelula(T, r, (1,3)).
T = [[_, _, a, _], [_, _, _, _], [a, a, a, a], [_, _, a, _]], insereObjectoEntrePosicoes(T, r, (1,1), (1,4)).

puzzle(6-14, P), relva(P).
puzzle(6-14, (T, _, _)), inacessiveis(T).
puzzle(6-14, P), relva(P), aproveita(P).
puzzle(6-14, P), relva(P), aproveita(P), relva(P), unicaHipotese(P).
puzzle(6-14, P), relva(P), aproveita(P), relva(P), unicaHipotese(P), limpaVizinhancas(P).

puzzle(6-14, P), resolve(P).
valida([(1,2),(1,4),(2,1),(4,3),(4,4),(6,2),(6,5)],[(1,1),(1,3),(1,5),(3,4),(4,2),(5,5),(6,1)]).
valida([(1,1),(1,3)], [(1,2),(1,4)]).

% Check final da solucao
puzzle(6-13, P), resolve(P), sol(6-13, P).
puzzle(6-14, P), resolve(P), sol(6-14, P).
puzzle(8-1, P), resolve(P), sol(8-1, P).

*/

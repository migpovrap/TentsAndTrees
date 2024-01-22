:-['Projeto.pl']. %Carrega o ficheiro do projeto.
/*
    Neste ficheiro existem comandos para medir o tempo de cada predicado do projeto, e alguns testes para os mesmo predicados.
    Sendo que alguns destes testes foram gerados pelo Github Copilot.
*/

measure:-
    measure_time431,
    measure_time432,
    measure_time433,
    measure_time434,
    measure_time435.


measure_resolve81:-
    statistics(walltime, [Start,_]),
    puzzle(8-1, P), 
    resolve(P),
    statistics(walltime, [End,_]),
    Time is End - Start,
    format('Execution time: ~3f seconds.~n', [Time / 1000]),
    format('Output do predicado: ~w~n', P),
    Puzzle = ([[t,r,r,t,a,t,a,t],[a,r,r,r,r,r,r,a],[r,r,r,r,t,r,r,r],[r,a,t,r,a,r,t,r],[t,r,r,a,r,a,a,a],[a,r,r,t,r,t,r,t],[r,r,a,r,r,r,r,r],[r,r,t,a,t,r,r,r]],[4,0,1,2,1,3,0,2],[2,0,2,2,2,2,1,2]),
    assertion(P = Puzzle).



measure_resolve614:-
    statistics(walltime, [Start,_]),
    puzzle(6-14, P), 
    resolve(P),
    statistics(walltime, [End,_]),
    Time is End - Start,
    format('Execution time: ~3f seconds.~n', [Time / 1000]),
    format('Output do predicado: ~w~n', [P]).


measure_time431:-
    statistics(walltime, [Start,_]),
    puzzle(6-14, P), 
    relva(P),
    statistics(walltime, [End,_]),
    Time is End - Start,
    format('Execution time: ~3f seconds.~n', [Time / 1000]),
    format('Output do predicado: ~w~n', [P]).

measure_time432:-
    statistics(walltime, [Start,_]),
    puzzle(6-14, (T, _, _)), 
    inacessiveis(T),
    statistics(walltime, [End,_]),
    Time is End - Start,
    format('Execution time: ~3f seconds.~n', [Time / 1000]),
    format('Output do predicado: ~w~n', [T]).

measure_time433:-
    statistics(walltime, [Start,_]),
    puzzle(6-14, P), 
    relva(P), 
    aproveita(P),
    statistics(walltime, [End,_]),
    Time is End - Start,
    format('Execution time: ~3f seconds.~n', [Time / 1000]),
    format('Output do predicado: ~w~n', [P]).

measure_time434:-
    statistics(walltime, [Start,_]),
    puzzle(6-14, P), 
    relva(P), 
    aproveita(P), 
    relva(P), 
    unicaHipotese(P),
    statistics(walltime, [End,_]),
    Time is End - Start,
    format('Execution time: ~3f seconds.~n', [Time / 1000]),
    format('Output do predicado: ~w~n', [P]).


measure_time435 :-
    statistics(walltime, [Start,_]),
    puzzle(6-14, P),
    relva(P),
    aproveita(P),
    relva(P),
    unicaHipotese(P),
    limpaVizinhancas(P),
    statistics(walltime, [End,_]),
    Time is End - Start,
    format('Execution time: ~3f seconds.~n', [Time / 1000]),
    format('Output do predicado: ~w~n', [P]).
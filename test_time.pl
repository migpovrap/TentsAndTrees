:-['Projeto.pl']. %Carrega o ficheiro do projeto.
/*
    Neste ficheiro existem comandos para medir o tempo de cada predicado do projeto, e alguns testes para os mesmo predicados.
    Sendo que alguns destes testes foram gerados pelo Github Copilot.
*/

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
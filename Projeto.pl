%Miguel Povoa Raposo, ist1109686
:- use_module(library(clpfd)). % para poder usar transpose/2
:- set_prolog_flag(answer_write_options,[max_depth(0)]). % ver listas completas
:- ['puzzlesAcampar.pl']. % Ficheiro dado. No Mooshak tera mais puzzles.

/*
    -vizinhanca((L,C), Vizinhanca) e verdade se Vizinhanca e uma lista ordenada de cima para baixo e da esquerda para a 
    direita, sem elementos repetidos, com as cordenadas das posicoes adjacentes com angulos retos.
*/
vizinhanca((L,C), List):-
    Cima is C + 1, Baixo is C - 1,
    Esquerda is L - 1, Direita is L + 1,
    List = [(Esquerda,C),(L,Baixo),(L,Cima),(Direita,C)].


/*
    -vizinhancaAlargada((L,C), VizinhancaAlargada) e verdade se VizinhancaAlargada e uma lista ordenada de cima para baixo e da esquerda
    para a direita, sem elementos repetidos, com as cordenadas anteriores e as diagonais.
*/
vizinhancaAlargada((L, C), Lord):-
    Cima is C + 1, Baixo is C - 1,
    Esquerda is L - 1, Direita is L + 1,
    vizinhanca((L,C),L1),
    append(L1,[(Esquerda,Baixo),(Direita,Cima),(Esquerda,Cima),(Direita,Baixo)], List),
    sort(List, Lord).


/*
    -todasCeculas/2(Tabuleiro, TodasCeculas) e verdade se TodasCeculas e uma lista ordenada de cima para baixo e da 
    esquerda para a direita, sem elementos repetidos, com todas as coordenadas do tabuleiro Tabuleiro.
*/
todasCelulas(T, TodasCelulas):-
    findall((Lin,Col),( 
    nth1(Lin,T,TabY),%Itera sobre as linhas
    nth1(Col,TabY,_)),%Itera sobre as colunas
    Cords),
    sort(Cords,TodasCelulas).
    

/*
    -todasCelulas(Tabuleiro, TodasCelulas, Objecto) e verdade se TodasCelulas e uma lista ordenada de cima para baixo e 
    da esquerda para a direita, sem elementos repetidos, com todas as coordenadas do tabuleiro Tabuleiro em que existe 
    um objecto do tipo Objecto (neste contexto (tal como no anterior) objecto e uma tenda (t), relva (r), arvore (a) ou 
    ainda uma variavel (por exemplo X), para indicar os espacos nao preenchidos).
*/

todasCelulas(T, TodasCelulas, Objeto):-
    (var(Objeto) ->
        findall((Lin,Col),( 
            nth1(Lin,T,TabY),
            nth1(Col,TabY,Objeto),
            Objeto = '_'),
        Cords),
        sort(Cords,TodasCelulas) ; 
        
        findall((Lin,Col),( 
            nth1(Lin,T,TabY),
            nth1(Col,TabY,El),
            Objeto == El),
        Cords),
        sort(Cords,TodasCelulas)).

    
calculaObjectosTabuleiro(Tabuleiro, Contagemlinhas, ContagemColunas, Objeto):-
    %Calcula o tipo de tabuleiro 6x6, 13x13, etc..
    length(Tabuleiro, Size),
    %Obtem os pares de cordenadas que correspondem ao Objeto
    todasCelulas(Tabuleiro, CordsObj, Objeto),
    %Devolve todas as linhas numa lista
    separaparcords(CordsObj, Iellinha,_),
    %Calcula o numero de ocorrencias de do objeto pelas linhas do tabuleiro incluindo 0 caso nao exista uma ocorrencia
    nocorrencias(Iellinha,Contagemlinhas,Size),
    %Inverte o tabuleiro de modo a que as colunas passem a corresponder a linhas, volta a executar o mesmo codigo
    transpose(Tabuleiro, Transtabuleiro),
    %Obtem os pares de cordenadas que correspondem ao Objeto
    todasCelulas(Transtabuleiro, CordsObj1, Objeto),
    %Devolve todas as linhas numa lista
    separaparcords(CordsObj1, IelColuna,_),
    %Calcula o numero de ocorrencias de do objeto pelas linhas do tabuleiro incluindo 0 caso nao exista uma ocorrencia
    nocorrencias(IelColuna, ContagemColunas,Size).
    
    
%Predicado usado para separar em duas listas as coordenadas de um par, uma lista vai conter as linhas e a outra as colunas, 
%uma lista da forma [(1,2),(3,2),(,3,4),(,5,4),(,2,5),(2,4)]
separaparcords([], [], []).
separaparcords([(X,Y)|Cauda], [X|Xcauda], [Y|Ycauda]):-
     separaparcords(Cauda, Xcauda, Ycauda).



nocorrencias(L,N,Size):-
    %Gera uma lista com todos os elementos que estao presentes nas cordenadas de uma lista, ou seja [1,2,3,4,5,6] para um tabuleiro 6x6
    findall(El,between(1,Size,El),ElList),
    %Executa a funcao auxiliar para cada elemento da lista (ElList) e junta os resultados as ocorrencias de cada elemento na lista (N) 
    maplist(nocorrenciasaux(L),ElList,N).

nocorrenciasaux(List,El,N):-
    findall(Oco, (member(Oco, List), El == Oco), Ocorrencias),
    length(Ocorrencias, N).


%Verifica se a celula em questao esta vazia ou tem relva, o predicado nao falha mesmo que as cordenadas nao pertecao ao tabuleiro 
celulaVazia(Tabuleiro, (L,C)):-
    (nth1(L, Tabuleiro, TabY), nth1(C, TabY, El) ->
        member(El, ['_',r]);
        Tabuleiro = Tabuleiro).

%Insere o objeto TendaOuRelva na posicao pretendida (L,C), no Tabuleiro
insereObjectoCelula(Tabuleiro, TendaOuRelva, (L,C)):-
    (nth1(L, Tabuleiro, TabY),
    nth1(C, TabY, TendaOuRelva);
    Tabuleiro = Tabuleiro).

%Insere o objeto pretendido no intevalo de posicoes indicadas, gera uma lista de cordenadas do intervalo ao qual aplica o predicado insereObejctoCelula
insereObjectoEntrePosicoes(Tabuleiro, TendaOuRelva, (L, C1), (L, C2)):-
    findall((L,C), between(C1,C2, C), ListCords),
    maplist(insereObjectoCelula(Tabuleiro, TendaOuRelva), ListCords).


%Coloca relva nas linhas e colunas onde o numero maximo de tendas ja foi atingido
relva(P):-
    P = (T, Nl, Nc),
    calculaObjectosTabuleiro(T, CLinhas, CColunas, 't'),
    findall(I,(
        nth1(I,CLinhas,X),
        nth1(I,Nl,X)),Ligual),
    findall(I,(
        nth1(I,CColunas,X),
        nth1(I,Nc,X)),Cigual),
    length(T,Size),
    findall((L,C), (between(1,Size,C), member(L, Ligual)), ListCordsLinha),
    maplist(insereObjectoCelula(T, 'r'), ListCordsLinha),
    findall((L,C), (between(1,Size,L), member(C, Cigual)), ListCordsColuna),
    maplist(insereObjectoCelula(T, 'r'), ListCordsColuna).   

   /* maplist(insereObjectoEntrePosicoesauxrelva(T, r, 1, Size), Ligual),
insereObjectoEntrePosicoesauxrelva(Tabuleiro, TendaOuRelva, C1, C2, L):-
   insereObjectoEntrePosicoes(Tabuleiro, TendaOuRelva, (L, C1), (L, C2)).
   Outra hipotese para o predicado relva*/


/*
    Predicado que prenceche com relva todos os espacos que nao se encontram na vizinhanca de uma arvore.
*/
inacessiveis(Tabuleiro):-
    todasCelulas(Tabuleiro, Celulasarvores, a),
    todasCelulas(Tabuleiro, TodasCelulas),
    maplist(vizinhanca(), Celulasarvores, Vizarvorestemp),
    flatten(Vizarvorestemp, Vizarvoresflat),
    length(Tabuleiro, Size),
    %findall((L,C), (between(1,Size,L),between(1,Size,C), member((L,C),Vizarvoresflat)), Vizarvores), Outra hipotese
    setof((L, C), (member((L, C), Vizarvoresflat), (between(1, Size, L), between(1, Size, C))), Vizarvores),
    findall((L,C),(member((L,C), TodasCelulas), \+member((L,C), Vizarvores), \+member((L,C), Celulasarvores)), Cordinacessiveis),
    maplist(insereObjectoCelula(Tabuleiro, r), Cordinacessiveis).

%Completa com tendas todas as linhas e colunas que so tem os espacos livres necesarios para corresponder aos valores que sao pedidos para o numero de tendas nas linhas e colunas
aproveita(P):-
    P = (T, Nl, Nc),
    length(T, Size),
    todasCelulas(T, CelulasVazias, _),
    calculaObjectosTabuleiro(T,CLinhas, CColunas, _),
    findall((L,C), (
        nth1(L, CLinhas, X),
        nth1(L, Nl, X),
        between(1,Size,C),
        member((L,C), CelulasVazias)),
        ListaCordsL),
    maplist(insereObjectoCelula(T, 't'), ListaCordsL),
    findall((L,C), (
        nth1(C, CColunas, X),
        nth1(C, Nc, X),
        between(1, Size, L),
        member((L,C), CelulasVazias)),
        ListaCordsC),
    maplist(insereObjectoCelula(T, 't'), ListaCordsC).


%Coloca relva nas posicoes que se encontram a volta das tendas
limpaVizinhancas(P):-
    P = (T,_,_),
    length(T, Size),
    todasCelulas(T, Cordstendas, 't'),
    maplist(vizinhancaAlargada(), Cordstendas, Vizalatendastemp),
    flatten(Vizalatendastemp, Vizalatendas),
    findall((L,C), (between(1, Size, L), between(1,Size, C), member((L,C), Vizalatendas)), Lista),
    maplist(insereObjectoCelula(T, 'r'), Lista).


%Coloca uma tenda no unico lugar possivel de forma todas as arvores que tinham apenas uma posicao livre na sua vizinhanca que lhes 
%permitia ficar ligadas a uma tenda, tem agora uma tenda nessa posicao.
unicaHipotese(P):-
    P = (T,_,_),
    length(T, Size),
    todasCelulas(T, Cordsarvores, 'a'),
    todasCelulas(T, Cordsvazias, _),
    maplist(vizinhanca(), Cordsarvores, Vizarvoreslol),
    todasCelulas(T, Tendascords, 't'),
    findall(ListaCord, (
        member(ListaCord, Vizarvoreslol),
        member(Cord, ListaCord),
        member(Cord, Tendascords)),ListaApagar),
    subtract(Vizarvoreslol, ListaApagar, Vizarvoreslimpa),
    findall(Vizcords, (
        nth1(_, Vizarvoreslimpa, Vizarvorestemp),
        findall((L, C), (
            member((L, C), Cordsvazias),
            member((L, C), Vizarvorestemp),
            between(1, Size, L),
            between(1, Size, C)),
        Vizcords),
        length(Vizcords,1)),
    Vizarvores),
    flatten(Vizarvores, ListColocaTenda),
    maplist(insereObjectoCelula(T, 't'), ListColocaTenda).


%Verifica se cada arvore so tem uma tenda ligada a si
valida(LArv, LTen):-
    maplist(vizinhanca(), LArv, Listatemp),
    findall(TenArv,
        (nth1(_, Listatemp, Temp), 
        findall((L, C), (member((L, C), LTen), member((L, C), Temp)), TenArvTemp), sort(TenArvTemp, TenArv)),
    ListaTenArv),
    length(ListaTenArv, N),
    flatten(ListaTenArv, LitstaTenFlat),
    sort(LitstaTenFlat, ListaTenOrd),
    length(ListaTenOrd, N).

/*    Versao antiga do resolve so usa os precessos heuristicos
    resolve(P):-
        P = (T,_,_),
        relva(P),
        inacessiveis(T), %sai precisa de correr uma vez
        aproveita(P),
        relva(P),
        unicaHipotese(P),
        limpaVizinhancas(P),
        todasCelulas(T, CelulasVazias, _),
        (CelulasVazias = [], !
            ;
            resolve(P)).
*/



%Predicado inicial do resolve usado para comecar a resolver o puzzle aplicando um predicado heuristico necessario uma unica vez o inacessiveis
resolve(P):-
    P = (T,_,_),
    relva(P),
    inacessiveis(T),
    resolveheu(P,_).
    
%Usado para aplicar os predicados heuristicos ate que nao se verifiquem novas alteracoes no tabuleiro, caso deixe de haver alteracoes chama o predicado para verificar
resolveheu(P, Pant):-
        relva(P),
        aproveita(P),
        relva(P),
        unicaHipotese(P),
        limpaVizinhancas(P),
        (dif(P, Pant) ->
            resolveheu(P,P)
            ;
            resolveverifica(P)).

%Predicado usado para verificar o puzzle caso  haja posicoes livres chama o predicado que aplica a forca bruta de forma a resolver o puzzle
resolveverifica(P):-
    P = (T,Nl,Nc),
    calculaObjectosTabuleiro(T, CurrentNl, CurrentNc, t),
    todasCelulas(T, Ltenda, t),
    todasCelulas(T, Larv, a),
    todasCelulas(T, CelulasVazias, _),
    ((CelulasVazias = [], CurrentNc = Nc, CurrentNl = Nl, valida(Larv, Ltenda)) -> true 
        ;
        resolvebruta(P)).

resolvebruta(P):-
    P = (T,_,_),
    todasCelulas(T, CelulasVazias, _),
    member((L,C), CelulasVazias),
    insereObjectoCelula(T, t, (L,C)),
    resolveheu(P,_).








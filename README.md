# Puzzle Solver
This project is a Prolog-based puzzle solver for the Tents and Trees arcade game. The puzzle is represented by a grid (matrix) where each cell can contain a tent (t), a tree (a), grass (r), or be empty (_). The goal is to place tents in the grid according to specific rules.

## Puzzle Representation
A puzzle is represented by a triple containing:

- A grid (matrix) where each list represents a row of the puzzle.
- A list representing the exact number of tents per row.
- A list representing the exact number of tents per column.
Example:

```prolog
([
[_, _, _, _, a, _],
[a, _, _, _, _, _],
[_, a, _, a, a, _],
[_, _, _, a, _, a],
[_, _, _, _, _, _],
[_, a, _, _, _, _]],
[2,1,2,1,1,1],
[3,0,1,1,0,3])
```
## Predicates

### Queries
- **vizinhanca((L, C), Vizinhanca):** True if Vizinhanca is a list of coordinates immediately above, below, left, and right of (L, C).

- **vizinhancaAlargada((L, C), VizinhancaAlargada):** True if VizinhancaAlargada includes the coordinates of vizinhanca plus the diagonals.

- **todasCelulas(Tabuleiro, TodasCelulas):** True if TodasCelulas is a list of all coordinates in Tabuleiro.

- **todasCelulas(Tabuleiro, TodasCelulas, Objecto):** True if TodasCelulas is a list of coordinates in Tabuleiro containing Objecto.

### Object Counting
- **calculaObjectosTabuleiro(Tabuleiro, ContagemLinhas, ContagemColunas, Objecto):** True if ContagemLinhas and ContagemColunas are lists of counts of Objecto per row and column.

### Cell Insertion
- **celulaVazia(Tabuleiro, (L, C)):** True if (L, C) in Tabuleiro is empty or contains grass.

- **insereObjectoCelula(Tabuleiro, TendaOuRelva, (L, C)):** True if TendaOuRelva is inserted at (L, C) in Tabuleiro.

- **insereObjectoEntrePosicoes(Tabuleiro, TendaOuRelva, (L, C1), (L, C2)):** True if TendaOuRelva is inserted between (L, C1) and (L, C2) in Tabuleiro.

### Strategies
- **relva(Puzzle):** Fills rows/columns with grass if the required number of tents is reached.

- **inacessiveis(Tabuleiro):** Fills inaccessible positions with grass.

- **aproveita(Puzzle):** Places tents in rows/columns with exactly the required number of empty spaces.

- **limpaVizinhancas(Puzzle):** Fills the extended neighborhood of tents with grass.

- **unicaHipotese(Puzzle):** Places a tent in the only possible position for a tree.

### Validation and Solving
- **valida(LArv, LTen):** True if each tree in LArv has exactly one tent in its neighborhood in LTen.

- **resolve(Puzzle):** Solves the puzzle using the implemented strategies and trial and error.

## Running the Project

To run the tests and compare the output with the expected results, execute the run_private.sh

**Example Usage:**

```shell
swipl -s ./src/Projeto.pl
```

```prolog
?- puzzle(6-14, P), resolve(P).
P = ([[t,a,t,a,t,r],
      [a,r,r,r,r,r],
      [r,r,r,t,r,r],
      [r,t,a,a,r,r],
      [r,r,r,r,t,r],
      [t,a,r,r,a,r]],
     [3,0,1,1,1,1],
     [2,1,1,1,2,0]).
```

## Credits:
The public test and auxiliar code was provided by the teacher.

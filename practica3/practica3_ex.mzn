%hacerlo como un vector de 18 o un vector de 9x2
include "alldifferent.mzn";

array [1..9,1..2] of var 1..18: celda;

constraint alldifferent([celda[1,1],celda[1,2],celda[2,1],celda[2,2],celda[3,1],celda[3,2],celda[4,1],celda[4,2],celda[5,1],celda[5,2],celda[6,1],celda[6,2],celda[7,1],celda[7,2],celda[8,1],celda[8,2],celda[9,1],celda[9,2]]);

constraint abs(celda[2,1]-celda[1,1])!=1 /\ abs(celda[2,1]-celda[5,1])!=1 /\ abs(celda[2,1]-celda[9,1])!=1 /\ abs(celda[2,1]-celda[4,2])!=1;

constraint abs(celda[7,1]-celda[1,1])!=1 /\ abs(celda[7,1]-celda[2,1])!=1 /\ abs(celda[7,1]-celda[3,1])!=1 /\ abs(celda[7,1]-celda[4,1])!=1 /\ abs(celda[7,1]-celda[5,1])!=1 /\ abs(celda[7,1]-celda[6,1])!=1 /\ abs(celda[7,1]-celda[8,1])!=1 /\ abs(celda[7,1]-celda[9,1])!=1;

constraint abs(celda[4,1]-celda[4,2])!=1 /\ abs(celda[4,1]-celda[4,2])!=2 /\ abs(celda[4,1]-celda[4,2])!=3 /\ abs(celda[4,1]-celda[4,2])!=4;

constraint abs(celda[8,1]-celda[8,2])=2;

constraint abs(celda[5,1]-celda[5,2])=1;

constraint abs(celda[4,1]-celda[1,1])=1 \/ abs(celda[4,1]-celda[1,2])=1 \/ abs(celda[4,1]-celda[9,1])=1 \/ abs(celda[4,1]-celda[9,2])=1;

constraint abs(celda[6,1]-celda[7,1])!=1;

constraint abs(celda[5,1]-celda[4,2])=1 \/ abs(celda[5,1]-celda[8,2])=1 \/ abs(celda[5,1]-celda[2,1])=1 \/ abs(celda[5,1]-celda[3,1])=1 \/ abs(celda[5,1]-celda[7,1])=1;

constraint celda[5,2]-celda[6,1]!=1 /\ celda[5,2]-celda[6,1]!=-1;

constraint forall (i in 1..9, j in 1..8 where i>j)(celda[i,1]>celda[j,1]);
constraint forall (i in 1..6, j in 1..5 where i>j)(celda[i,2]<celda[j,2]);

constraint forall (i in 5..14)(celda[2,1]!=i);
constraint forall (i in 5..14)(celda[2,2]!=i);

constraint celda[2,1]!=1 /\ celda[2,1]!=18 /\ celda[2,2]!=1 /\ celda[2,2]!=18;

%Ejercicio 2 Examen
solve minimize (abs(celda[2,1] - celda[2,2]));
%Ejercicio 2
%solve minimize (abs(celda[9,1] - celda[8,1]) + abs(celda[1,2] - celda[2,2]) );

%Ejercicio 3
%solve minimize (abs(celda[7,1] - celda [7,2])) / abs((celda[3,1] - celda[9,2]));

%comentar el solve que no se quiera utilizar, si comentas los dos es satisfabilidad 
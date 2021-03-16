% Función de jacobiana directa para manipulador antropomórfico.

% Jorge Alberto Cruz
% Moisés Torres Zetina
% Luis Eduardo González
% Jersson Rodríguez Díaz
% Jorge Dena Navarro
% Alejandro Rodarte

% Dra. Ing. Ivón Oristela González Benítez

% Entradas
% q1: Posición articular en base (radianes).
% q2: Posición articular en hombro (radianes). 
% q3: Posición articular en codo (radianes). 
% w1: Velocidad angular en base (radianes sobre segundo).
% w2: Velocidad angular en hombro (radianes sobre segundo).
% w3: Velocidad angular en codo (radianes sobre segundo).
% alph1: Aceleración angular en base (radianes sobre segundo al cuadrado).
% alph2: Aceleración angular en hombro (radianes sobre segundo al cuadrado).
% alph3: Aceleración angular en codo (radianes sobre segundo al cuadrado).
% d1: Distancia de base a hombro (metros).
% a2: Distancia de hombro a codo (metros).
% a3: Distancia de codo a gripper (metros).

% Salidas
% Vx: Velocidad de efector final en eje X (metros sobre segundo).
% Vy: Velocidad de efector final en eje Y (metros sobre segundo).
% Vz: Velocidad de efector final en eje Z (metros sobre segundo).
% Ax: Aceleración de efector final en eje X (metros sobre segundo al cuadrado).
% Ay: Aceleración de efector final en eje Y (metros sobre segundo al cuadrado).
% Az: Aceleración de efector final en eje Z (metros sobre segundo al cuadrado).

function [Vx, Vy, Vz, Ax, Ay, Az] = ForwardJacobian(q1, q2, q3, w1, w2,...
    w3, alph1, alph2, alph3, d1, a2, a3)

% Función de redondeo.
roundn = @(x,n) round(x*10^n)./10^n;

% Grados de libertad del manipulador.
gdl = 3;

% Declaración de arreglos de símbolos de parámetros de algoritmo DH
theta    = sym('theta', [1 gdl]);
d        = sym('d', [1 gdl]);
a        = sym('a', [1 gdl]);
alpha    = sym('alpha', [1 gdl]);

% Matriz T inicializada como matriz identidad.
T        = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

% Parámetros de algoritmo DH.
d(2)     = 0;
d(3)     = 0;
a(1)     = 0;
alpha(1) = (90*pi)/180;
alpha(2) = (0*pi)/180;
alpha(3) = (0*pi)/180;

% Ciclo for para creación de matriz T.
for i = 1:gdl
    
    A(:, :, 1, i) = [cos(theta(i)) -cos(alpha(i))*sin(theta(i))... 
        sin(alpha(i))*sin(theta(i)) a(i)*cos(theta(i)); sin(theta(i))... 
        cos(alpha(i))*cos(theta(i)) -sin(alpha(i))*cos(theta(i))... 
        a(i)*sin(theta(i)); 0 sin(alpha(i)) cos(alpha(i)) d(i); 0 0 0 1];
    
    T = T*A(:, :, 1, i);
    
end

% Extracción de ecuaciones simbólicas de posición (última columna).
Px      = T(1, 4);
Py      = T(2, 4);
Pz      = T(3, 4);

% Se determina la jacobiana directa simbólica.
J       = jacobian([Px Py Pz], [theta(1) theta(2) theta(3)]);

% Parámetros de función recibidos por variables internas.
theta1  = q1;
theta2  = q2;
theta3  = q3;
d1      = d1;
a2      = a2;
a3      = a3;

% Se obtienen las velocidades y aceleraciones presentes en efector final en
% cada uno de los tres ejes a partir de la jacobiana y el vector de
% velocidades y aceleraciones angulares.
V       = (subs(J)*[w1 w2 w3]')';
Ac      = (subs(J)*[alph1 alph2 alph3]')';

% Resultados numéricos.
Vx      = double(roundn(V(1), 12));
Vy      = double(roundn(V(2), 12));
Vz      = double(roundn(V(3), 12));
Ax      = double(roundn(Ac(1), 12));
Ay      = double(roundn(Ac(2), 12));
Az      = double(roundn(Ac(3), 12));
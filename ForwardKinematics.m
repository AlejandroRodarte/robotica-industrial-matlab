% Función de cinemática directa para manipulador antropomórfico.

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
% d1: Distancia de base a hombro (metros).
% a2: Distancia de hombro a codo (metros).
% a3: Distancia de codo a gripper (metros).

% Salidas
% Px: Posición de efector final en eje X (metros).
% Py: Posición de efector final en eje Y (metros).
% Pz: Posición de efector final en eje Z (metros).
% A: Vector de matrices de transformación homogenea.
% T: Matriz de transformación homogénea del manipulador.

function [Px, Py, Pz, A, T] = ForwardKinematics(q1, q2, q3, d1, a2, a3)

% Función de redondeo.
roundn = @(x,n) round(x*10^n)./10^n;

% Grados de libertad del manipulador.
gdl      = 3;

% Declaración de arreglos de símbolos de parámetros de algoritmo DH.
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

% Parámetros de función recibidos por variables internas.
theta1   = q1;
theta2   = q2;
theta3   = q3;

d1       = d1;
a2       = a2;
a3       = a3;

% Sustitución de símbolos por resultados numéricos.
A        = double(roundn(subs(A), 12));
T        = double(roundn(subs(T), 12));
Px       = double(roundn(subs(T(1, 4)), 12));
Py       = double(roundn(subs(T(2, 4)), 12));
Pz       = double(roundn(subs(T(3, 4)), 12));
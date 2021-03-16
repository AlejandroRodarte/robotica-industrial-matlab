% Función de cinemática inversa para manipulador antropomórfico.

% Jorge Alberto Cruz
% Moisés Torres Zetina
% Luis Eduardo González
% Jersson Rodríguez Díaz
% Jorge Dena Navarro
% Alejandro Rodarte

% Dra. Ing. Ivón Oristela González Benítez

% Entradas
% Px: Posición de efector final en eje X (metros).
% Py: Posición de efector final en eje Y (metros).
% Pz: Posición de efector final en eje Z (metros).
% d1: Distancia de base a hombro (metros).
% a2: Distancia de hombro a codo (metros).
% a3: Distancia de codo a gripper (metros).

% Salidas
% q1: Posición articular en base (radianes).
% q2: Posición articular en hombro (radianes). 
% q3: Posición articular en codo (radianes). 
% A: Vector de matrices de transformación homogenea.
% T: Matriz de transformación homogénea del manipulador.

function [q1, q2, q3, A, T] = InverseKinematics(Px, Py, Pz, d1, a2, a3)

% Función de redondeo.
roundn = @(x,n) round(x*10^n)./10^n;

% Fórmulas intermedias obtenidas a partir de geometría del manipulador.
Pxy     = sqrt(Px^2 + Py^2);
Ph      = Pz - d1;
Pxyh    = sqrt(Pxy^2 + Ph^2);
alpha1  = atan2(Ph, Pxy);
c2      = (Pxyh^2 + a2^2 - a3^2)/(2*Pxyh*a2);
alpha2  = atan2(sqrt(1 - c2^2), c2);
c3      = (a2^2 + a3^2 - Pxyh^2)/(2*a2*a3);

% Fórmulas de cinemática inversa (configuración codo abajo).
q1      = double(roundn(atan2(Py, Px), 12));
q2      = double(roundn(alpha1 + alpha2, 12));
q3      = double(roundn(pi + atan2(sqrt(1 - c3^2), c3), 12));

% Grados de libertad del manipulador.
gdl = 3;

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
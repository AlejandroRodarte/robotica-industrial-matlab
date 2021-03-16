% Funci�n de cinem�tica inversa para manipulador antropom�rfico.

% Jorge Alberto Cruz
% Mois�s Torres Zetina
% Luis Eduardo Gonz�lez
% Jersson Rodr�guez D�az
% Jorge Dena Navarro
% Alejandro Rodarte

% Dra. Ing. Iv�n Oristela Gonz�lez Ben�tez

% Entradas
% Px: Posici�n de efector final en eje X (metros).
% Py: Posici�n de efector final en eje Y (metros).
% Pz: Posici�n de efector final en eje Z (metros).
% d1: Distancia de base a hombro (metros).
% a2: Distancia de hombro a codo (metros).
% a3: Distancia de codo a gripper (metros).

% Salidas
% q1: Posici�n articular en base (radianes).
% q2: Posici�n articular en hombro (radianes). 
% q3: Posici�n articular en codo (radianes). 
% A: Vector de matrices de transformaci�n homogenea.
% T: Matriz de transformaci�n homog�nea del manipulador.

function [q1, q2, q3, A, T] = InverseKinematics(Px, Py, Pz, d1, a2, a3)

% Funci�n de redondeo.
roundn = @(x,n) round(x*10^n)./10^n;

% F�rmulas intermedias obtenidas a partir de geometr�a del manipulador.
Pxy     = sqrt(Px^2 + Py^2);
Ph      = Pz - d1;
Pxyh    = sqrt(Pxy^2 + Ph^2);
alpha1  = atan2(Ph, Pxy);
c2      = (Pxyh^2 + a2^2 - a3^2)/(2*Pxyh*a2);
alpha2  = atan2(sqrt(1 - c2^2), c2);
c3      = (a2^2 + a3^2 - Pxyh^2)/(2*a2*a3);

% F�rmulas de cinem�tica inversa (configuraci�n codo abajo).
q1      = double(roundn(atan2(Py, Px), 12));
q2      = double(roundn(alpha1 + alpha2, 12));
q3      = double(roundn(pi + atan2(sqrt(1 - c3^2), c3), 12));

% Grados de libertad del manipulador.
gdl = 3;

% Declaraci�n de arreglos de s�mbolos de par�metros de algoritmo DH.
theta    = sym('theta', [1 gdl]);
d        = sym('d', [1 gdl]);
a        = sym('a', [1 gdl]);
alpha    = sym('alpha', [1 gdl]);

% Matriz T inicializada como matriz identidad.
T        = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

% Par�metros de algoritmo DH.
d(2)     = 0;
d(3)     = 0;
a(1)     = 0;
alpha(1) = (90*pi)/180;
alpha(2) = (0*pi)/180;
alpha(3) = (0*pi)/180;

% Ciclo for para creaci�n de matriz T.
for i = 1:gdl
    
    A(:, :, 1, i) = [cos(theta(i)) -cos(alpha(i))*sin(theta(i))... 
        sin(alpha(i))*sin(theta(i)) a(i)*cos(theta(i)); sin(theta(i))... 
        cos(alpha(i))*cos(theta(i)) -sin(alpha(i))*cos(theta(i))... 
        a(i)*sin(theta(i)); 0 sin(alpha(i)) cos(alpha(i)) d(i); 0 0 0 1];
    
    T = T*A(:, :, 1, i);
    
end

% Par�metros de funci�n recibidos por variables internas.
theta1   = q1;
theta2   = q2;
theta3   = q3;

d1       = d1;
a2       = a2;
a3       = a3;

% Sustituci�n de s�mbolos por resultados num�ricos.
A        = double(roundn(subs(A), 12));
T        = double(roundn(subs(T), 12));
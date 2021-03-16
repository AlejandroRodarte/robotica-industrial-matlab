% Cinem�tica y din�mica directa de robot antropom�rico.

% Integrantes:
% Jersson Rodr�guez
% Luis Eduardo Gonz�lez
% Jorge Cruz
% Jorge Dena Navarro
% Alejandro Rodarte

% Instructora: Dra. Ing. Iv�n Oristela Ben�tez Gonz�lez

% Limpieza y borrado de pantalla.
clc;
clear;

% Grados de libertad del robot.
gdl = 3;

% Declaraci�n de s�mbolos en dependencia de los grados de libertad.
theta    = sym('theta', [1 gdl]);
d        = sym('d', [1 gdl]);
a        = sym('a', [1 gdl]);
alpha    = sym('alpha', [1 gdl]);

% Matriz homog�nea inicializada como matriz identidad.
T        = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

% Declaraci�n de variables como constantes debido a tabla de par�metros.
d(2)     = 0;
d(3)     = 0;
a(1)     = 0;
alpha(1) = (90*pi)/180;
alpha(2) = (0*pi)/180;
alpha(3) = (0*pi)/180;

% Ciclo for para determinar matriz homog�nea indefinida general.
for i = 1:gdl
    
    A(:, :, 1, i) = [cos(theta(i)) -cos(alpha(i))*sin(theta(i))... 
        sin(alpha(i))*sin(theta(i)) a(i)*cos(theta(i)); sin(theta(i))... 
        cos(alpha(i))*cos(theta(i)) -sin(alpha(i))*cos(theta(i))... 
        a(i)*sin(theta(i)); 0 sin(alpha(i)) cos(alpha(i)) d(i); 0 0 0 1];
    
    T = T*A(:, :, 1, i);
    
end

% Matriz homog�nea T gen�rica.
pretty(T)

% Derivaciones parciales.
dPxdTheta1 = diff(T(1, 4), theta(1));
dPxdTheta2 = diff(T(1, 4), theta(2));
dPxdTheta3 = diff(T(1, 4), theta(3));
dPydTheta1 = diff(T(2, 4), theta(1));
dPydTheta2 = diff(T(2, 4), theta(2));
dPydTheta3 = diff(T(2, 4), theta(3));
dPzdTheta1 = diff(T(3, 4), theta(1));
dPzdTheta2 = diff(T(3, 4), theta(2));
dPzdTheta3 = diff(T(3, 4), theta(3));

% Formaci�n de matriz jacobiana directa general.
J = [dPxdTheta1 dPxdTheta2 dPxdTheta3; dPydTheta1 dPydTheta2 dPydTheta3;...
    dPzdTheta1 dPzdTheta2 dPzdTheta3];

% Impresi�n de matriz jacobiana directa bonita.
pretty(J)

% Evaluaci�n de matriz jacobiana directa con caso particular.
J = double(subs(J, {theta(1), theta(2), theta(3), d(1), a(2), a(3)},...
    {(60*pi)/180 (30*pi)/180 (330*pi)/180 50 120 100}));

% Dimensionado del robot real y caso particular de articulaciones.
theta(1) = (60*pi)/180;
theta(2) = (30*pi)/180;
theta(3) = (330*pi)/180;
d(1)     = 50;
a(2)     = 120;
a(3)     = 100;

% Matriz homog�nea inicializada como matriz identidad.
T        = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

% Se determina la matriz de transformaci�n homog�nea definida para el caso.
for i = 1:gdl
    
    A(:, :, 1, i) = [cos(theta(i)) -cos(alpha(i))*sin(theta(i))... 
        sin(alpha(i))*sin(theta(i)) a(i)*cos(theta(i)); sin(theta(i))... 
        cos(alpha(i))*cos(theta(i)) -sin(alpha(i))*cos(theta(i))... 
        a(i)*sin(theta(i)); 0 sin(alpha(i)) cos(alpha(i)) d(i); 0 0 0 1];
    
    T = T*A(:, :, 1, i);
    
end

% Impresi�n de matriz de transformaci�n homog�nea y jacobiana directa
% num�ricas.
T       = double(T)
J

% Vector referenciado de base a efector final.
r_uvw   = [0 0 0 1]';
pos     = T*r_uvw

% Declaraci�n de velocidades angulares en articulaciones.
omega(1) = (5*pi)/180;
omega(2) = (2*pi)/180;
omega(3) = (2*pi)/180;

% Obtenci�n de velocidades lineales en efector final.
vel      = J*omega'

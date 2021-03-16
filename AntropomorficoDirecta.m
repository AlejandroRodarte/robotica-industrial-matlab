% Cinemática y dinámica directa de robot antropomórico.

% Integrantes:
% Jersson Rodríguez
% Luis Eduardo González
% Jorge Cruz
% Jorge Dena Navarro
% Alejandro Rodarte

% Instructora: Dra. Ing. Ivón Oristela Benítez González

% Limpieza y borrado de pantalla.
clc;
clear;

% Grados de libertad del robot.
gdl = 3;

% Declaración de símbolos en dependencia de los grados de libertad.
theta    = sym('theta', [1 gdl]);
d        = sym('d', [1 gdl]);
a        = sym('a', [1 gdl]);
alpha    = sym('alpha', [1 gdl]);

% Matriz homogénea inicializada como matriz identidad.
T        = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

% Declaración de variables como constantes debido a tabla de parámetros.
d(2)     = 0;
d(3)     = 0;
a(1)     = 0;
alpha(1) = (90*pi)/180;
alpha(2) = (0*pi)/180;
alpha(3) = (0*pi)/180;

% Ciclo for para determinar matriz homogénea indefinida general.
for i = 1:gdl
    
    A(:, :, 1, i) = [cos(theta(i)) -cos(alpha(i))*sin(theta(i))... 
        sin(alpha(i))*sin(theta(i)) a(i)*cos(theta(i)); sin(theta(i))... 
        cos(alpha(i))*cos(theta(i)) -sin(alpha(i))*cos(theta(i))... 
        a(i)*sin(theta(i)); 0 sin(alpha(i)) cos(alpha(i)) d(i); 0 0 0 1];
    
    T = T*A(:, :, 1, i);
    
end

% Matriz homogénea T genérica.
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

% Formación de matriz jacobiana directa general.
J = [dPxdTheta1 dPxdTheta2 dPxdTheta3; dPydTheta1 dPydTheta2 dPydTheta3;...
    dPzdTheta1 dPzdTheta2 dPzdTheta3];

% Impresión de matriz jacobiana directa bonita.
pretty(J)

% Evaluación de matriz jacobiana directa con caso particular.
J = double(subs(J, {theta(1), theta(2), theta(3), d(1), a(2), a(3)},...
    {(60*pi)/180 (30*pi)/180 (330*pi)/180 50 120 100}));

% Dimensionado del robot real y caso particular de articulaciones.
theta(1) = (60*pi)/180;
theta(2) = (30*pi)/180;
theta(3) = (330*pi)/180;
d(1)     = 50;
a(2)     = 120;
a(3)     = 100;

% Matriz homogénea inicializada como matriz identidad.
T        = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

% Se determina la matriz de transformación homogénea definida para el caso.
for i = 1:gdl
    
    A(:, :, 1, i) = [cos(theta(i)) -cos(alpha(i))*sin(theta(i))... 
        sin(alpha(i))*sin(theta(i)) a(i)*cos(theta(i)); sin(theta(i))... 
        cos(alpha(i))*cos(theta(i)) -sin(alpha(i))*cos(theta(i))... 
        a(i)*sin(theta(i)); 0 sin(alpha(i)) cos(alpha(i)) d(i); 0 0 0 1];
    
    T = T*A(:, :, 1, i);
    
end

% Impresión de matriz de transformación homogénea y jacobiana directa
% numéricas.
T       = double(T)
J

% Vector referenciado de base a efector final.
r_uvw   = [0 0 0 1]';
pos     = T*r_uvw

% Declaración de velocidades angulares en articulaciones.
omega(1) = (5*pi)/180;
omega(2) = (2*pi)/180;
omega(3) = (2*pi)/180;

% Obtención de velocidades lineales en efector final.
vel      = J*omega'

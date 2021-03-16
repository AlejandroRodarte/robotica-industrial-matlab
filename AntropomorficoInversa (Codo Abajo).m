% Cinemática y dinámica inversa (codo abajo) de robot antropomórico.

% Integrantes:
% Jersson Rodríguez
% Luis Eduardo González
% Jorge Cruz
% Jorge Dena Navarro
% Alejandro Rodarte

% Instructora: Dra. Ing. Ivón Oristela Benítez González

% Limpiado de pantalla y variables.
clc;
clear;

% Posición buscada en efector final.
Px = 190;
Py = 150;
Pz = 220;

% Dimensionado del robot real.
d1 = 150;
a2 = 120;
a3 = 180;

% Obtención de ángulo en primera articulación.
theta1_rad = atan2(Py, Px);

% Obtención de ángulo en tercera articulación.
Pxy = sqrt(Px^2 + Py^2);
Ph = Pz - d1;
Pxyh = sqrt(Pxy^2 + Ph^2);
c3 = (Pxyh^2 - a3^2 - a2^2)/(2*a2*a3);
theta3_rad = atan2(sqrt(1 - c3^2), c3);

% Obtención de ángulo en segunda articulación.
K1 = a2 + a3*cos(theta3_rad);
K2 = a3*sin(theta3_rad);
gamma = atan2(K2, K1);
theta2_rad = atan2(Ph, Pxy) - gamma;

% Conversión de radianes a grados.
theta(1) = (180*theta1_rad)/pi;
theta(2) = (180*theta2_rad)/pi;
theta(3) = (180*theta3_rad)/pi;

% Impresión de resultados.
theta = theta'

% Definición de reducción de términos.
n1 = Pxyh^2 - a3^2 - a2^2;
n2 = n1/(2*a2);
n3 = 1/(a2*a3);
n4 = 1/(2*a2^2*a3);
n5 = a3/a2;
n6 = n2/a3;
n7 = 1 - n6^2;
n8 = 1/(2*a2^2*a3^2);

% Derivadas parciales para matriz jacobiana inversa.
dTheta1dPx = -Py/Pxy^2;
dTheta1dPy = Px/Pxy^2;
dTheta1dPz = 0;
dTheta2dPx = (-(Px*Ph)/(Pxy*Pxyh^2)) + ((a2 + n2)*(n1*n4*n7^(-1/2)*Px) +...
    (n5*n7^(1/2)*Px))/((a2 + n2)^2 + (n7*a3^2));
dTheta2dPy = (-(Py*Ph)/(Pxy*Pxyh^2)) + ((a2 + n2)*(n1*n4*n7^(-1/2)*Py) +...
    (n5*n7^(1/2)*Py))/((a2 + n2)^2 + (n7*a3^2));
dTheta2dPz = (Pxy)/(Pxyh^2) + ((a2 + n2)*(n1*n4*n7^(-1/2)*Ph) +...
    (n5*n7^(1/2)*Ph))/((a2 + n2)^2 + (n7*a3^2));
dTheta3dPx = -Px*((n1*n6*n7^(-1/2)*n8) + (n3*n7^(1/2)));
dTheta3dPy = -Py*((n1*n6*n7^(-1/2)*n8) + (n3*n7^(1/2)));
dTheta3dPz = -Ph*((n1*n6*n7^(-1/2)*n8) + (n3*n7^(1/2)));

% Formación de matriz jacobiana inversa.
Jinv = [dTheta1dPx dTheta1dPy dTheta1dPz; dTheta2dPx dTheta2dPy dTheta2dPz;...
    dTheta3dPx dTheta3dPy dTheta3dPz];

% Declaración de velocidades lineales buscadas en efector final.
vel(1) = 16.0594;
vel(2) = 16.5635;
vel(3) = 13.3620;

% Obtención de velocidades angulares requeridas en articulaciones.
omega = (Jinv*vel')*(180/pi)
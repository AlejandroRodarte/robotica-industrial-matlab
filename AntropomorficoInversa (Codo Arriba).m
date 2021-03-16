% Cinem�tica y din�mica inversa (codo arriba) de robot antropom�rico.

% Integrantes:
% Jersson Rodr�guez
% Luis Eduardo Gonz�lez
% Jorge Cruz
% Jorge Dena Navarro
% Alejandro Rodarte

% Instructora: Dra. Ing. Iv�n Oristela Ben�tez Gonz�lez

% Limpiado de pantalla y variables.
clc;
clear;

% Posici�n buscada en efector final.
Px = 190;
Py = 150;
Pz = 220;

% Dimensionado del robot real.
d1 = 150;
a2 = 120;
a3 = 180;

% Obtenci�n de �ngulo en primera articulaci�n.
theta1_rad = atan2(Py, Px);

% Obtenci�n de �ngulo en tercera articulaci�n.
Pxy = sqrt(Px^2 + Py^2);
Ph = Pz - d1;
alpha1 = atan2(Ph, Pxy);

Pxyh = sqrt(Pxy^2 + Ph^2);

c2 = (Pxyh^2 + a2^2 - a3^2)/(2*Pxyh*a2);
alpha2 = atan2(sqrt(1 - c2^2), c2);
theta2_rad = alpha1 + alpha2;

c3 = (a2^2 + a3^2 - Pxyh^2)/(2*a2*a3);
theta3_rad = pi + atan2(sqrt(1 - c3^2), c3);

% Conversi�n de radianes a grados.
theta(1) = (180*theta1_rad)/pi;
theta(2) = (180*theta2_rad)/pi;
theta(3) = (180*theta3_rad)/pi;

% Impresi�n de resultados.
theta = theta'

% Definici�n de reducci�n de t�rminos.
n1 = Pxyh^2 + a2^2 - a3^2;
n2 = a2^2 + a3^2 - Pxyh^2;
n3 = Pxyh*a2;
n4 = a2/Pxyh;
n5 = 1 - (n1/(2*n3))^2;
n6 = a2*a3;
n7 = 1 - (n2/(2*n6))^2;

% Derivadas parciales para matriz jacobiana inversa.
dTheta1dPx = -Py/Pxy^2;
dTheta1dPy = Px/Pxy^2;
dTheta1dPz = 0;
dTheta2dPx = (-(Px*Ph)/(Pxy*Pxyh^2)) - Px*((1/8)*((n1^2*n5^(-1/2))/(n3^4)) +...
    (1/2)*((n5^(1/2))/(n3^2)))*(2*n3 - n1*n4);
dTheta2dPy = (-(Py*Ph)/(Pxy*Pxyh^2)) - Py*((1/8)*((n1^2*n5^(-1/2))/(n3^4)) +...
    (1/2)*((n5^(1/2))/(n3^2)))*(2*n3 - n1*n4);
dTheta2dPz = (Pxy)/(Pxyh^2) - Ph*((1/8)*((n1^2*n5^(-1/2))/(n3^4)) +...
    (1/2)*((n5^(1/2))/(n3^2)))*(2*n3 - n1*n4);
dTheta3dPx = Px*((1/4)*(((n2^2)*(n7^(-1/2)))/(n6^3)) + ((n7^(1/2)/(n6))));
dTheta3dPy = Py*((1/4)*(((n2^2)*(n7^(-1/2)))/(n6^3)) + ((n7^(1/2)/(n6))));
dTheta3dPz = Ph*((1/4)*(((n2^2)*(n7^(-1/2)))/(n6^3)) + ((n7^(1/2)/(n6))));

% Formaci�n de matriz jacobiana inversa.
Jinv = [dTheta1dPx dTheta1dPy dTheta1dPz; dTheta2dPx dTheta2dPy dTheta2dPz;...
    dTheta3dPx dTheta3dPy dTheta3dPz];

% Declaraci�n de velocidades lineales buscadas en efector final.
vel(1) = -44.1048;
vel(2) = 38.4968;
vel(3) = 87.9148;

% Obtenci�n de velocidades angulares requeridas en articulaciones.
omega = (Jinv*vel')*(180/pi)
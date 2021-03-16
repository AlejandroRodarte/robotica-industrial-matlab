% Funci�n de jacobiana inversa para manipulador antropom�rfico.

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
% Vx: Velocidad de efector final en eje X (metros sobre segundo).
% Vy: Velocidad de efector final en eje Y (metros sobre segundo).
% Vz: Velocidad de efector final en eje Z (metros sobre segundo).
% Ax: Aceleraci�n de efector final en eje X (metros sobre segundo al cuadrado).
% Ay: Aceleraci�n de efector final en eje Y (metros sobre segundo al cuadrado).
% Az: Aceleraci�n de efector final en eje Z (metros sobre segundo al cuadrado).
% d1: Distancia de base a hombro (metros).
% a2: Distancia de hombro a codo (metros).
% a3: Distancia de codo a gripper (metros).

% Salidas
% w1: Velocidad angular en base (radianes sobre segundo).
% w2: Velocidad angular en hombro (radianes sobre segundo).
% w3: Velocidad angular en codo (radianes sobre segundo).
% alph1: Aceleraci�n angular en base (radianes sobre segundo al cuadrado).
% alph2: Aceleraci�n angular en hombro (radianes sobre segundo al cuadrado).
% alph3: Aceleraci�n angular en codo (radianes sobre segundo al cuadrado).

function [w1, w2, w3, alph1, alph2, alph3] = InverseJacobian(Px, Py, Pz,...
    Vx, Vy, Vz, Ax, Ay, Az, d1, a2, a3)

% Funci�n de redondeo.
roundn = @(x,n) round(x*10^n)./10^n;

% S�mbolos para posiciones finales de efector final.
px = sym('px');
py = sym('py');
pz = sym('pz');

% F�rmulas intermedias simb�licas obtenidas a partir de geometr�a del 
% manipulador.
Pxy     = sqrt(px^2 + py^2);
Ph      = pz - d1;
Pxyh    = sqrt(Pxy^2 + Ph^2);
alpha1  = atan2(Ph, Pxy);
c2      = (Pxyh^2 + a2^2 - a3^2)/(2*Pxyh*a2);
alpha2  = atan2(sqrt(1 - c2^2), c2);
c3      = (a2^2 + a3^2 - Pxyh^2)/(2*a2*a3);

% F�rmulas de cinem�tica inversa simb�licas (configuraci�n codo abajo).
q1      = vpa(atan2(py, px), 4);
q2      = vpa(alpha1 + alpha2, 4);
q3      = vpa(pi + atan2(sqrt(1 - c3^2), c3), 4);

% Determinaci�n de jacobiana inversa simb�lica.
J       = jacobian([q1 q2 q3], [px py pz]);

% Par�metros de funci�n recibidos por variables internas.
px      = Px;
py      = Py;
pz      = Pz;

% Determinaci�n de velocidades y aceleraciones angulares de articulaciones
% a partir de velocidades y aceleraciones en efector final y jacobiana
% inversa.
W       = (subs(J)*[Vx Vy Vz]')';
Alph    = (subs(J)*[Ax Ay Az]')';

% Resultados num�ricos.
w1      = double(roundn(W(1), 12));
w2      = double(roundn(W(2), 12));
w3      = double(roundn(W(3), 12));
alph1   = double(roundn(Alph(1), 12));
alph2   = double(roundn(Alph(2), 12));
alph3   = double(roundn(Alph(3), 12));
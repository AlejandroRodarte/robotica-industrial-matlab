% Función de dinámica inversa para manipulador antropomórfico.

% Jorge Alberto Cruz
% Moisés Torres Zetina
% Luis Eduardo González
% Jersson Rodríguez Díaz
% Jorge Dena Navarro
% Alejandro Rodarte
% Dra. Ing. Ivón Oristela González Benítez

% Entradas
% A: Vector de matrices de transformación homogenea.
% q1: Posición articular en base (radianes).
% q2: Posición articular en hombro (radianes). 
% q3: Posición articular en codo (radianes). 
% w1: Velocidad angular en base (radianes sobre segundo).
% w2: Velocidad angular en hombro (radianes sobre segundo).
% w3: Velocidad angular en codo (radianes sobre segundo).
% alpha1: Aceleración angular en base (radianes sobre segundo al cuadrado).
% alpha2: Aceleración angular en hombro (radianes sobre segundo al cuadrado).
% alpha3: Aceleración angular en codo (radianes sobre segundo al cuadrado).
% m1: Masa del eslabón entre base y hombro (kilogramos).
% m2: Masa del eslabón entre hombro y codo (kilogramos).
% m3: Masa del eslabón entre codo y gripper (kilogramos).
% d1: Distancia de base a hombro (metros).
% a2: Distancia de hombro a codo (metros).
% a3: Distancia de codo a gripper (metros).
% g: Gravedad (metros sobre segundo al cuadrado).
% x1, y1, z1: Ancho, Alto y Largo de eslabón entre base y hombro (metros).
% x2, y2, z2: Alto, Ancho y Largo de eslabón entre hombro y codo (metros).
% x3, y3, z3: Alto, Ancho y Largo de eslabón entre codo y gripper (metros).

% Salidas
% T1: Par a resistir por la articulación de la base (Newton metro).
% T2: Par a resistir por la articulación del hombro (Newton metro).
% T3: Par a resistir por la articulación del codo (Newton metro).

function [T1, T2, T3] = InverseDynamics(A, q1, q2, q3, w1, w2, w3, alpha1,...
    alpha2, alpha3, m1, m2, m3, m4, d1, a2, a3, g, x1, x2, x3, y1, y2, y3,...
    z1, z2, z3)

% Función de redondeo.
roundn = @(x,n) round(x*10^n)./10^n;

% Paso N-E 2: Matrices de rotación y sus inversas.
R_0_1       = A(1:3, 1:3, 1, 1);
R_1_2       = A(1:3, 1:3, 1, 2);
R_2_3       = A(1:3, 1:3, 1, 3);
R_3_4       = eye(3);
R_1_0       = A(1:3, 1:3, 1, 1).';
R_2_1       = A(1:3, 1:3, 1, 2).';
R_3_2       = A(1:3, 1:3, 1, 3).';
R_4_3       = eye(3).';

% Paso N-E 3: Condiciones iniciales.

Omega_0_0   = [0 0 0]';     % Para el sistema de la base {S0}.
Alpha_0_0   = [0 0 0]';
Vel_0_0     = [0 0 0]';
Ac_0_0      = [0 0 g]';

N_4_4       = [0 0 0]';     % Para el extremo del robot.
F_4_4       = [-m4*g*sin(q2 + q3) m4*g*cos(q2 + q3) 0]';

Z0          = [0 0 1]';     % Vector unitario.

P_1_1       = [0 0 d1]';    % Coordenadas de origen {Si} respecto a {Si-1}.
P_2_2       = [a2*cos(q2) a2*sin(q2) 0]';
P_3_3       = [a3*cos(q3) a3*sin(q3) 0]';

S_1_1       = [0 -0.5*d1 0]';   % Coordenadas de centro de masas de {Si}.
S_2_2       = [-0.5*a2 0 0]';
S_3_3       = [-0.5*a3 0 0]';

IXX_1       = (1/12)*m1*(y1^2 + z1^2);  % Inercias.
IYY_1       = (1/12)*m1*(x1^2 + z1^2);
IZZ_1       = (1/12)*m1*(x1^2 + y1^2);
IXX_2       = (1/12)*m2*(y2^2 + z2^2);
IYY_2       = (1/12)*m2*(x2^2 + z2^2);
IZZ_2       = (1/12)*m2*(x2^2 + y2^2);
IXX_3       = (1/12)*m3*(y3^2 + z3^2);
IYY_3       = (1/12)*m3*(x3^2 + z3^2);
IZZ_3       = (1/12)*m3*(x3^2 + y3^2);

I_1_1       = [IXX_1 0 0; 0 IYY_1 0; 0 0 IZZ_1];    % Tensores de inercia.
I_2_2       = [IXX_2 0 0; 0 IYY_2 0; 0 0 IZZ_2];
I_3_3       = [IXX_3 0 0; 0 IYY_3 0; 0 0 IZZ_3];

% Paso N-E 4: Velocidad angular de sistema {Si}.
Omega_1_1   =  R_1_0*(Omega_0_0 + Z0*w1);
Omega_2_2   =  R_2_1*(Omega_1_1 + Z0*w2);
Omega_3_3   =  R_3_2*(Omega_2_2 + Z0*w3);

% Paso N-E 5: Aceleración angular del sistema {Si}.
Alpha_1_1   = R_0_1*(Alpha_0_0 + Z0*alpha1 + cross(Omega_0_0', (Z0*w1)')');
Alpha_2_2   = R_2_1*(Alpha_1_1 + Z0*alpha2 + cross(Omega_1_1', (Z0*w2)')');
Alpha_3_3   = R_3_2*(Alpha_2_2 + Z0*alpha3 + cross(Omega_2_2', (Z0*w3)')');

% Paso N-E 6: Aceleración lineal del sistema {Si}.
Ac_1_1      = (cross(Alpha_1_1', P_1_1'))' + (cross(Omega_1_1',...
    cross(Omega_1_1', P_1_1')))' + R_1_0*Ac_0_0;
Ac_2_2      = (cross(Alpha_2_2', P_2_2'))' + (cross(Omega_2_2',...
    cross(Omega_2_2', P_2_2')))' + R_2_1*Ac_1_1;
Ac_3_3      = (cross(Alpha_3_3', P_3_3'))' + (cross(Omega_3_3',...
    cross(Omega_3_3', P_3_3')))' + R_3_2*Ac_2_2;

% Paso N-E 7: Aceleración lineal del centro de gravedad del eslabón i.
Acg_1_1     = (cross(Alpha_1_1', S_1_1'))' + (cross(Omega_1_1',...
    cross(Omega_1_1', S_1_1')))' + Ac_1_1;
Acg_2_2     = (cross(Alpha_2_2', S_2_2'))' + (cross(Omega_2_2',...
    cross(Omega_2_2', S_2_2')))' + Ac_2_2;
Acg_3_3     = (cross(Alpha_3_3', S_3_3'))' + (cross(Omega_3_3',...
    cross(Omega_3_3', S_3_3')))' + Ac_3_3;

% Paso N-E 8: Fuerza ejercida en eslabón i.
F_3_3       = R_3_4*F_4_4 + m3*Acg_3_3;
F_2_2       = R_2_3*F_3_3 + m2*Acg_2_2;
F_1_1       = R_1_2*F_2_2 + m1*Acg_1_1;

% Paso N-E 9: Par ejercido en eslabón i.
N_3_3       = R_3_4*N_4_4 + (cross(S_3_3', m3*Acg_3_3'))' +...
 (cross(P_3_3', F_3_3'))' + I_3_3*Alpha_3_3 +...
 (cross(Omega_3_3', (I_3_3*Omega_3_3)'))';
N_2_2       = R_2_3*N_3_3 + (cross(S_2_2', m2*Acg_2_2'))' +...
 (cross(P_2_2', F_2_2'))' + I_2_2*Alpha_2_2 +...
 (cross(Omega_2_2', (I_2_2*Omega_2_2)'))';
N_1_1       = R_1_2*N_2_2 + (cross(S_1_1', m1*Acg_1_1'))' +...
 (cross(P_1_1', F_1_1'))' + I_1_1*Alpha_1_1 +...
 (cross(Omega_1_1', (I_1_1*Omega_1_1)'))';

% Paso N-E 10: Par ejercido en articulación i.
T1          = double(roundn((N_1_1')*R_1_0*Z0, 12));
T2          = double(roundn((N_2_2')*R_2_1*Z0, 12));
T3          = double(roundn((N_3_3')*R_3_2*Z0, 12));
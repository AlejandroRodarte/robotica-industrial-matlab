clc;
clear;

% rad
q1      = (60*pi)/180;
q2      = (30*pi)/180;
q3      = (330*pi)/180;

% rad/s
w1      = (5*pi)/180;
w2      = (2*pi)/180;
w3      = (2*pi)/180;

% rad/s2
alpha1  = (0.5*pi)/180;
alpha2  = (0.2*pi)/180;
alpha3  = (0.2*pi)/180;

% kg
m1      = 0.150;
m2      = 0.050;
m3      = 0.050;
m4      = 0.025;

% m
d1      = 0.050;
a2      = 0.120;
a3      = 0.100;

% m/s^2
g       = 9.81;

% m
x1      = 0.050;
y1      = 0.050;
z1      = 0.050;

% m
x2      = 0.120;
y2      = 0.003;
z2      = 0.010;

% m
x3      = 0.100;
y3      = 0.003;
z3      = 0.010;

[Px, Py, Pz, A, T]          = ForwardKinematics(q1, q2, q3, d1, a2, a3)
[Vx, Vy, Vz, Ax, Ay, Az]    = ForwardJacobian(q1, q2, q3, w1, w2, w3, alpha1, alpha2, alpha3, d1, a2, a3)
[T1, T2, T3]                = InverseDynamics(A, q1, q2, q3, w1, w2, w3, alpha1, alpha2, alpha3, m1, m2, m3, m4, d1, a2, a3, g, x1, x2, x3, y1, y2, y3, z1, z2, z3)
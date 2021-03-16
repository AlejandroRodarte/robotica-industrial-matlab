clc;
clear;

% m
Px      = 0.101961524227000;
Py      = 0.176602540378000;
Pz      = 0.110000000000000;

% m/s
Vx      = -0.016458676536000;
Vy      = 0.007084022176000;
Vz      = 0.010608915736000;

% m/s2
Ax      = -0.001645867654000;
Ay      = 7.084022180000000e-04;
Az      = 0.001060891574000;

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

[q1, q2, q3, A, T]                        = InverseKinematics(Px, Py, Pz, d1, a2, a3)
[w1, w2, w3, alpha1, alpha2, alpha3]      = InverseJacobian(Px, Py, Pz, Vx, Vy, Vz, Ax, Ay, Az, d1, a2, a3)
[T1, T2, T3]                              = InverseDynamics(A, q1, q2, q3, w1, w2, w3, alpha1, alpha2, alpha3, m1, m2, m3, m4, d1, a2, a3, g, x1, x2, x3, y1, y2, y3, z1, z2, z3)
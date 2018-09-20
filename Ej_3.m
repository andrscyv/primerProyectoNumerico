%Script para correr el método de la potencia inversa con shift
close all; clear all; clc
format long
A = [1 -2 0; 1 17 -2; 5 7 7]

%Tres vectores iniciales
q01 = [-1; 0.2; 0.5]'
q02 = [-0.7; 0.1; 1.5]'
q03 = [0.5.; -0.99; -0.3]'

[sigmai1, qi1] = metodo_potencia_invRayleigh(A,q01,100)
[sigmai2, qi2] = metodo_potencia_invRayleigh(A,q02,100)
[sigmai3, qi3] = metodo_potencia_invRayleigh(A,q03,100)
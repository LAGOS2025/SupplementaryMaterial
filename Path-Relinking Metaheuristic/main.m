clear all
clc


%% Load solution set for testing (17 solutions)
load("S_AC.mat")
%% Choose Current Solution
SolCor=1;
SolCor=S_AC(SolCor);
%% Choose Target Solution
SolTar=3;
SolTar=S_AC(SolTar);
%% Start Figure for viewing
fig=figure;    
%% Apply the Path Relinking algorithm
[SolEnd] =  Path_Relinking(SolCor,SolTar,fig); 



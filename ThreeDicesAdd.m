function ThreeDicesAdd()
clc; clear; close all
N = 1000;

% Rolling dice---Random integer generator for N experiments
dice1 = randi(6,1,N); 
dice2 = randi(6,1,N);
dice3 = randi(6,1,N);

addDiceList = dice1 + dice2 + dice3; % Adding face values for each experiments

% Plotting histogram
histogram(addDiceList);
end

function ThreeDicesAdd2()
clc; clear; close all
N = 1000:10000:1000000;

filename = 'Histogram.gif'; % Output file name
h = figure;
image = cell(1,length(N));

for i = 1:length(N) % Iterating for the given list of experiment numbers
    
    dice1 = randi(6,1,N(i)); % Rolling dice---Random integer generator of size 1*N
    dice2 = randi(6,1,N(i));
    dice3 = randi(6,1,N(i));

    addDiceList = dice1 + dice2 + dice3;
    
    % Plotting Histogram
    histogram(addDiceList);
    title(strcat('N=',num2str(N(i))))
    
    % Creating GIF
    frame = getframe(h);
    image{i} = frame2im(frame);
    
    [X,cmap] = rgb2ind(image{i},256);
    if i == 1
        imwrite(X,cmap,filename,'gif','LoopCount',Inf,'DelayTime',0.6);
    else
        imwrite(X,cmap,filename,'gif','WriteMode','append','DelayTime',0.6);
    end
    
end
end


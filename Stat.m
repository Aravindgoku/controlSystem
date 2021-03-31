%% Task 1
clc; clear; 
data = randi(50,1,30);
mean_data = mean(data);
std_data = std(data);
%% Task 2 to 7
n = 2;
data_date = string(zeros(1,n));
for i  = 1:n
    x = input('Enter the new data:\n');
    fprintf('Is the enetered value %d correct!\n',x);
    confirmation = input('Type 1 for Yes or 0 for no:\n');
    if confirmation == 0
        x = input('Enter the new data:\n');
    end
        data(30+i) = x;
    x_date = input('Enter the date in the format mm/dd/yy:\n','s');
    data_date(i) = x_date;
    
    x_axis_values = length(data)-13:length(data);
    plot(x_axis_values, data(end-13:end),'LineWidth',2)
    hold on
    plot(x_axis_values,mean_data*ones(1,14),'LineWidth',1.5)
    plot(x_axis_values,(mean_data + std_data)*ones(1,14),'*','LineWidth',1.5)
    plot(x_axis_values,(mean_data + 2*std_data)*ones(1,14),'.','LineWidth',1.5)
    plot(x_axis_values,(mean_data + 3*std_data)*ones(1,14),'--','LineWidth',1.5)
    plot(x_axis_values,(mean_data - std_data)*ones(1,14),'*','LineWidth',1.5)
    plot(x_axis_values,(mean_data - 2*std_data)*ones(1,14),'.','LineWidth',1.5)
    plot(x_axis_values,(mean_data - 3*std_data)*ones(1,14),'--','LineWidth',1.5)
    hold off
    text(x_axis_values(end),mean_data,'Mean \mu')
    text(x_axis_values(end),mean_data + std_data,'Mean \mu + \sigma')
    text(x_axis_values(end),mean_data + 2*std_data ,'Mean \mu + 2\sigma')
    text(x_axis_values(end),mean_data + 3*std_data,'Mean \mu + 3\sigma')
    text(x_axis_values(end),mean_data - std_data,'Mean \mu - \sigma')
    text(x_axis_values(end),mean_data - 2*std_data,'Mean \mu - 2\sigma')
    text(x_axis_values(end),mean_data - 3*std_data,'Mean \mu - 3\sigma')
    
    xlabel('Day number')
    
    if x > mean_data + 3*std_data || x < mean_data - 3*std_data
        errordlg('New data is beyond 3 sigma bounds','Not within statistical control');
    end
    if nnz(data(end-2:end) > mean_data + 2*std_data) > 1 || nnz(data(end-2:end) < mean_data - 2*std_data) > 1
        errordlg('Couple of points are above 2 sigma bounds','Not within statistical control');
    end
end
    

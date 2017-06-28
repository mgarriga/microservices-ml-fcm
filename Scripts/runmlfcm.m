%clc;
clear;
disp('        **************************************************************')
disp('        *          ML FUZZY COGNITIVE MAPS                           *')
disp('        **************************************************************')
disp('        **************************************************************')
disp(' ')

%disp('Press any key to continue...')
%pause;
warning('off','all');
 
% Get Weights matrix WW[nxm] from a csv file
% Weight values should be within range [-1 1]

Iterations=50;
FCMs = 6;
Runs = 20;

%Correl.("1") = zeros(11,Runs);
%Correl.("2") = zeros(3,2,Runs);
%Correl.("3") = zeros(4,2,Runs);
%Correl.("4") = zeros(3,2,Runs);
%Correl.("5") = zeros(6,2,Runs);
%Correl.("6") = zeros(6,2,Runs);
coi = zeros(20,1);

for g = 1:Runs
  
  % for each sub-fcm   
  for k = 1:FCMs 
    
    ifilename = ['../Questionnaires/ww_fcm',num2str(k),'.csv'];
      
    WW.(num2str(k)) = csvread(ifilename);
    
    [n, m] = size(WW.(num2str(k)));
  
    AL.(num2str(k))(:,1) = rand(1,n);
		AL.(num2str(k))(:,2) = zeros(1,n);
    
		ofilename = ['../Questionnaires/als/al_fcm',num2str(k),'_',num2str(g),'.csv'];
		AL.(num2str(k))(:,1) = csvread(ofilename);
		
    ALs.(num2str(k)) = zeros(n,Iterations);
    %Correl.(num2str(k))(:,g) = AL.(num2str(k))(:,1);  
  end 
  
  
  
  %AL.("1")(11,1) = 0.5;
  %AL.("1")(6,1) = 0.1;
  %AL.("1")(4,1) = 0.9;
  %AL.("1")(5,1) = 0.4;
  %AL.("1")(7,1) = 0.4;
  %
  %[n, m] = size(WW.("2"));
  %AL.("2")(:,1) = zeros(1,n);
  %AL.("2")(:,1) = 0.9;
  %
  %[n, m] = size(WW.("3"));
  %AL.("3")(:,1) = zeros(1,n);
  %AL.("3")(:,1) = 0.9;
  % 
  %[n, m] = size(WW.("4"));
  %AL.("4")(:,1) = zeros(1,n);
  %AL.("4")(:,1) = 0.9;
  % 
  %[n, m] = size(WW.("5"));
  %AL.("5")(:,1) = zeros(1,n);
  %AL.("5")(:,1) = 0.9;
   
    
  % Set connected concepts 
%  AL.("1")(1,2) = 2;
  AL.("1")(2,2) = 3;
%  AL.("1")(8,2) = 4;
%  AL.("1")(9,2) = 5;
%  AL.("1")(10,2) = 6;
  
  %disconect concepts from upper layer
  %AL.("1")(:,2) = 0;
  
  [ALs,AL] = mlfcm(1,WW,AL,ALs,Iterations);
  
  % Plot All Concepts Activation Values along iterations 
  %figure,hold on;
  %xlim([0 Iterations]),ylim([0 1]);
  %title('FCM1 - All Concepts');
  %plot(ALs.("1")(:,:));
  %Correl.(num2str(1))(11,g) = ALs.(num2str(1))(11,end);
	coi(g,1) = ALs.("1")(11,end);
end

csvwrite('coi_only_strong.csv',coi);

return

ALs.("1")(11,1) = 0.5;
% Plot All Concepts Activation Values along iterations 
figure,hold on;
xlim([0 Iterations]),ylim([0 1]);
title('FCM1 - Microservices Adoption');
plot(ALs.("1")(11,:),"color",'k');
%plot(ALs.("1")(10,:),"color",'r');
%plot(ALs.("1")(9,:),"color",'g');
%plot(ALs.("1")(8,:),"color",'b');
%plot(ALs.("1")(7,:),"color",'y');
%plot(ALs.("1")(6,:),"color",'m');
%plot(ALs.("1")(5,:),"color",'y');
%plot(ALs.("1")(4,:),"color",'m');
%plot(ALs.("1")(3,:),"color",'y');
%plot(ALs.("1")(2,:),"color",'m');
%plot(ALs.("1")(1,:),"color",'c');
ALs.("1")(11,end)


return
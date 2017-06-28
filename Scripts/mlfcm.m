function [ALs,AL] = mlfcm(fcm,WW,AL,ALs,Iterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file : mlfcm.m                                                                %        
% implements ml FCM                                                  %
% input :                                                                       %
%           WW : [n x n] weight matrix                                          %
%           AL : [1 x n] Activation Levels vector                               % 
%           Iterations : Numeric variable, number of iterations                 %
% output :                                                                      %
%           ALs : [n x Iterations] matrix, Activations Levels along Iterations  % 
%                                                                               %
% important note : Row influence Column                                         %    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[n, m] = size(WW.(num2str(fcm)));

ALnew = AL.(num2str(fcm));

for k = 1:Iterations;
    for j = 1:n
        Ai = 0;
        Si = 0;
        sumin = 0;
				
        if AL.(num2str(fcm))(j,2)>0
          newfcm = AL.(num2str(fcm))(j,2);
          [rALs,rAL] = mlfcm(newfcm,WW,AL,ALs,1);
          AL.(num2str(fcm))(j,1) = rAL.(num2str(newfcm))(1,1);
          AL.(num2str(newfcm))(:,1) = rAL.(num2str(newfcm))(:,1);
					ALs = rALs;
        end
        
        for i = 1:m;
            sumin = WW.(num2str(fcm))(i,j) * (2*AL.(num2str(fcm))(i,1)-1); % i influence j 
            Si = Si + sumin;
        end;
               
        Ai=AL.(num2str(fcm))(j,1);
                
 %         %%%% Sigmoid Transfer Function %%%%
          
        x = ((2*Ai)-1) + Si;
        
          lamda = 0.9;

          if (Si==0)
            ALnew(j,1) = Ai;
          else 
            ALnew(j,1) = sigmoid(x,lamda); %freemat & matlab  
          end 
%         %%%% End of Sigmoid Transfer Function %%%%

%        if AL(1,j) < -1
%            AL(1,j) = -1;
%        end;
%        if AL(1,j) > 1
%            AL(1,j) = 1;
%        end;
    end;
		AL.(num2str(fcm)) = ALnew;
    ALs.(num2str(fcm))(:,k) = ALnew(:,1);
end;


return



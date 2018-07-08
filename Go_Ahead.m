%%% IN The Name Of Allah %%%%
%%% Field And Wave Project
%%% instructot Dr. Moradi 
%%% TO ask for copy contanct mahdimath76@gmail.com
%%% All simulation by Mahdi Morafah Student OF EE AT Amirkabir University Of Technology
%%% date : 6/29/2018
 clear ; 
 close all;
 clc;

N = input('Number of layers : ');
theta = input('The incident angel in degree : ');
e = input('magnitude : ');
pol = input('Polarization ? TM =1,TE=2,Both=3 :');
epsilon = zeros(1,N);
beta = zeros(1,N);

for i =1:1:N
    epsilon(i) = input(['Epsilon of layer ',num2str(i),' : ']);
    beta(i) = input(['Beta of layer ',num2str(i),' : ']);
end

[E_x,E_y,E_z,H_x,H_y,H_z]=N_layer_analizer(N,epsilon,beta,theta,e,pol);

    

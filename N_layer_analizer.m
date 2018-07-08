%%% IN The Name Of Allah %%%%
%%% Field And Wave Project
%%% instructot Dr. Moradi 
%%% TO ask for copy contanct mahdimath76@gmail.com
%%% All simulation by Mahdi Morafah Student OF EE AT Amirkabir University
%%% Of Technology
%%% date : 6/29/2018

function [E_x,E_y,E_z,H_x,H_y,H_z] = N_layer_analizer(layer,eps,beta,theta,e,pol)

N = layer;

E_x = zeros(N,100);
E_y = zeros(N,100);
E_z = zeros(N,100);

H_x = zeros(N,100);
H_y = zeros(N,100);
H_z = zeros(N,100);

E_temp_x = zeros(N,100);
E_temp_y = zeros(N,100);
E_temp_z = zeros(N,100);

H_temp_x = zeros(N,100);
H_temp_y = zeros(N,100);
H_temp_z = zeros(N,100);

x = linspace(0,50,100);
y = linspace(0,50,100);
z = linspace(0,50,100);
 

for m =1:1:N-1
    
    [E_temp_x(m,:),E_temp_y(m,:),E_temp_z(m,:),H_temp_x(m,:),H_temp_y(m,:),H_temp_z(m,:),E_temp_x(m+1,:),E_temp_y(m+1,:),E_temp_z(m+1,:),H_temp_x(m+1,:),H_temp_y(m+1,:),H_temp_z(m+1,:)] = perpendicular_polarization(theta,e,eps(m),eps(m+1),beta(m),beta(m+1));
    
    if pol ==1 || pol ==3 
        [E_x(m,:),E_y(m,:),E_z(m,:),H_x(m,:),H_y(m,:),H_z(m,:),E_x(m+1,:),E_y(m+1,:),E_z(m+1,:),H_x(m+1,:),H_y(m+1,:),H_z(m+1,:)] = parallel_polarizaton(theta,e,eps(m),eps(m+1),beta(m),beta(m+1));
        
    end
    
    if pol==2 || pol==3
        [E_temp_x(m,:),E_temp_y(m,:),E_temp_z(m,:),H_temp_x(m,:),H_temp_y(m,:),H_temp_z(m,:),E_temp_x(m+1,:),E_temp_y(m+1,:),E_temp_z(m+1,:),H_temp_x(m+1,:),H_temp_y(m+1,:),H_temp_z(m+1,:)] = perpendicular_polarization(theta,e,eps(m),eps(m+1),beta(m),beta(m+1));
    end
    
    E_x(m,:) = E_x(m,:)+E_temp_x(m,:);
    E_y(m,:) = E_y(m,:)+E_temp_y(m,:);
    E_z(m,:) = E_z(m,:)+E_temp_z(m,:);
        
    E_x(m+1,:) = E_x(m+1,:)+E_temp_x(m+1,:);
    E_y(m+1,:) = E_y(m+1,:)+E_temp_y(m+1,:);
    E_z(m+1,:) = E_z(m+1,:)+E_temp_z(m+1,:);
    
    H_x(m,:) = H_x(m,:)+H_temp_x(m,:);
    H_y(m,:) = H_y(m,:)+H_temp_y(m,:);
    H_z(m,:) = H_z(m,:)+H_temp_z(m,:);
    
    H_x(m+1,:) = H_x(m+1,:)+H_temp_x(m+1,:);
    H_y(m+1,:) = H_y(m+1,:)+H_temp_y(m+1,:);
    H_z(m+1,:) = H_z(m+1,:)+H_temp_z(m+1,:);
    
    figure(m);
    subplot(3,2,1);
    plot3(x,z,real(E_x(m,:)));
    title(['Electric Field X of layer',num2str(m)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
    subplot(3,2,2);
    plot3(x,z,real(H_x(m,:)));
    title(['Magnetic Field X of layer',num2str(m)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
    subplot(3,2,3);
    plot3(x,z,real(E_y(m,:)));
    title(['Electric Field Y of layer',num2str(m)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
    subplot(3,2,4);
    plot3(x,z,real(H_y(m,:)));
    title(['Magnetic Field Z of layer',num2str(m)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
    subplot(3,2,5);
    plot3(x,z,real(E_z(m,:)));
    title(['Electric Field Z of layer',num2str(m)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
    subplot(3,2,6);
    plot3(x,z,real(H_z(m,:)));
    title(['Magnetic Field Z of layer',num2str(m)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
    figure(m+1);
    subplot(3,2,1);
    plot3(x,z,real(E_x(m,:)));
    title(['Electric Field X of layer',num2str(m+1)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
    subplot(3,2,2);
    plot3(x,z,real(H_x(m+1,:)));
    title(['Magnetic Field X of layer',num2str(m+1)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
    subplot(3,2,3);
    plot3(x,z,real(E_y(m+1,:)));
    title(['Electric Field Y of layer',num2str(m+1)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
    subplot(3,2,4);
    plot3(x,z,real(H_y(m+1,:)));
    title(['Magnetic Field Y of layer',num2str(m+1)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
    subplot(3,2,5);
    plot3(x,z,real(E_z(m+1,:)));
    title(['Electric Field Z of layer',num2str(m+1)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
    subplot(3,2,6);
    plot3(x,z,real(H_z(m+1,:)));
    title(['Magnetic Field Z of layer',num2str(m+1)]);
    xlabel('X in (m)');
    ylabel('Z in (m)');
    zlabel('Amplitude');
    
end

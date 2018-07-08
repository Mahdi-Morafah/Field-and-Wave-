%%% IN The Name Of Allah %%%%
%%% Field And Wave Project
%%% instructot Dr. Moradi 
%%% TO ask for copy contanct mahdimath76@gmail.com
%%% All simulation by Mahdi Morafah Student OF EE AT Amirkabir University
%%% Of Technology
%%% date : 6/29/2018

function [E1_x,E1_y,E1_z,H1_x,H1_y,H1_z,E2_x,E2_y,E2_z,H2_x,H2_y,H2_z] = perpendicular_polarization(theta,e,eps1,eps2,beta1,beta2)

epsilon = [eps1 eps2];

theta_i = theta;
theta_r =  theta_i;

n_hat_i = [sind(theta_i) 0 cosd(theta_i)];
h_hat_i = [cosd(theta_i) 0 -sind(theta_i)];

eta = [120*pi/sqrt(epsilon(1)),120*pi/sqrt(epsilon(2))];

E_i = e;

beta = [beta1 beta2];

x = linspace(0,50,100);
y = linspace(0,50,100);
z = linspace(0,50,100);

e_hat_i = cross(n_hat_i,h_hat_i);

Hi_x = E_i.*h_hat_i(1)/eta(1).*exp(-1i*beta(1)*(x*n_hat_i(1)+y*n_hat_i(2)+z*n_hat_i(3)));
Hi_y = E_i.*h_hat_i(2)/eta(1).*exp(-1i*beta(1)*(x*n_hat_i(1)+y*n_hat_i(2)+z*n_hat_i(3)));
Hi_z= E_i.*h_hat_i(3)/eta(1).*exp(-1i*beta(1)*(x*n_hat_i(1)+y*n_hat_i(2)+z*n_hat_i(3)));

Ei_x = -E_i.*e_hat_i(1).*exp(-1i*beta(1)*(x*n_hat_i(1)+y*n_hat_i(2)+z*n_hat_i(3)));
Ei_y = -E_i.*e_hat_i(2).*exp(-1i*beta(1)*(x*n_hat_i(1)+y*n_hat_i(2)+z*n_hat_i(3)));
Ei_z = -E_i.*e_hat_i(3).*exp(-1i*beta(1)*(x*n_hat_i(1)+y*n_hat_i(2)+z*n_hat_i(3)));

theta_t = sind(theta_i)*beta(1)/beta(2);

Gamma=(eta(2)*cosd(theta_i) - eta(1)*cosd(theta_t))/(eta(2)*cosd(theta_i) + eta(1)*cosd(theta_t));

T = (2*eta(2)*cosd(theta_i))/(eta(2)*cosd(theta_i) + eta(1)*cosd(theta_t));

E_r = Gamma*E_i;

E_t = T*E_i;

n_hat_r = [sind(theta_r) 0 -cosd(theta_r)];
h_hat_r = [cosd(theta_r) 0 sind(theta_r)];
e_hat_r = cross(n_hat_r,h_hat_r);

Hr_x = E_r.*h_hat_r(1)/eta(1).*exp(-1i*beta(1)*(x*n_hat_r(1)+y*n_hat_r(2)+z*n_hat_r(3)));
Hr_y = E_r.*h_hat_r(2)/eta(1).*exp(-1i*beta(1)*(x*n_hat_r(1)+y*n_hat_r(2)+z*n_hat_r(3)));
Hr_z = E_r.*h_hat_r(3)/eta(1).*exp(-1i*beta(1)*(x*n_hat_r(1)+y*n_hat_r(2)+z*n_hat_r(3)));

Er_x = -E_r.*e_hat_r(1).*exp(-1i*beta(1)*(x*n_hat_r(1)+y*n_hat_r(2)+z*n_hat_r(3)));
Er_y = -E_r.*e_hat_r(2).*exp(-1i*beta(1)*(x*n_hat_r(1)+y*n_hat_r(2)+z*n_hat_r(3)));
Er_z = -E_r.*e_hat_r(3).*exp(-1i*beta(1)*(x*n_hat_r(1)+y*n_hat_r(2)+z*n_hat_r(3)));

n_hat_t = [sind(theta_t) 0 cosd(theta_t)];
h_hat_t = [cosd(theta_t) 0 -sind(theta_t)];
e_hat_t = cross(n_hat_t,h_hat_t);

Ht_x = E_t.*h_hat_t(1)/eta(2).*exp(-1i*beta(2)*(x*n_hat_t(1)+y*n_hat_t(2)+z*n_hat_t(3)));
Ht_y = E_t.*h_hat_t(2)/eta(2).*exp(-1i*beta(2)*(x*n_hat_t(1)+y*n_hat_t(2)+z*n_hat_t(3)));
Ht_z = E_t.*h_hat_t(3)/eta(2).*exp(-1i*beta(2)*(x*n_hat_t(1)+y*n_hat_t(2)+z*n_hat_t(3)));

Et_x = -E_t.*e_hat_t(1).*exp(-1i*beta(2)*(x*n_hat_t(1)+y*n_hat_t(2)+z*n_hat_t(3)));
Et_y = -E_t.*e_hat_t(2).*exp(-1i*beta(2)*(x*n_hat_t(1)+y*n_hat_t(2)+z*n_hat_t(3)));
Et_z = -E_t.*e_hat_t(3).*exp(-1i*beta(2)*(x*n_hat_t(1)+y*n_hat_t(2)+z*n_hat_t(3)));

E1_x = Ei_x + Er_x;
E1_y = Ei_y + Er_y;
E1_z = Ei_z + Er_z;

H1_x = Hi_x + Hr_x;
H1_y = Hi_y + Hr_y;
H1_z = Hi_z + Hr_z;

E2_x = Et_x;
E2_y = Et_y;
E2_z = Et_z;

H2_x = Ht_x;
H2_y = Ht_y;
H2_z = Ht_z;

end 
%% cylindriccal Coordinates (Flat circular)
diameter = 20; %parachute diameter
R = diameter / 2; %parachute radius
%phi = pi / 2; 
n = 10; %number of gores
n = n+1;
sR = 2; %spill hole Radius
gap = diameter/4 * .15;
height = diameter * .15; %determine height of cylinder

%GENERATE CIRCULAR DISK
theta = linspace(0,2*pi, n); %creating angle segments for cylindrical
r = linspace(sR, R, 25); %going from top to bottom creating radius points
[theta,r] = meshgrid(theta,r);

%gives the flat disk some angle to represent inflation
z = r * 0; %generate z coordinates for cart. z needs to be same size as r
z = z + height + gap;
%z = ones(25, 11);

[px,py,pz] = pol2cart(theta, r, z);%transfer coordinates to cartesian

%GENERATE BAND 
theta = linspace(0,2*pi, n); %creating angle segments for cylindrical
[theta,r] = meshgrid(theta,R); %generate grid for each point in cylindrical

z_bot = zeros(1,n); %origin coordinate
z_top = ones(1,n);
z_top = z_top * height; %determine height of cylinder
z = vertcat(z_bot, z_top); %z-coordinates for cylinder

theta = vertcat(theta, theta); %need 2 rows since z is 2 rows
r = vertcat(r,r); %need 2 rows since z is 2 rows

[cx,cy,cz] = pol2cart(theta, r, z);

figure
hold on
surf(px,py,pz);
surf(cx,cy,cz);
axis('equal');
hold off

%%
[x,y,z] = cylinder(2);
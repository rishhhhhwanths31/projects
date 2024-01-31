clc
clear all
close all
type=input('enter the type of conductor:');
if type==1
    distance = input('Enter the distance between conductors (in meters): ');
    radius = input('Enter the radius of conductors (in meters): ');
    length = input('Enter the length of the transmission line (in meters): ');

% Constants
    mu0 = 4*pi*10^(-7); % Permeability of free space

% Calculate the inductance
    GMD = sqrt(distance^2 + (radius/2)^2); % Geometric Mean Distance
    inductance = (mu0/(2*pi))*(log(2*length/GMD) - 1);

% Display the result
    fprintf('The inductance of the stranded conductors is %.4e H.\n',inductance); 
elseif type==2
     distance = input('Enter the distance between conductors (in meters): ');
    radius = input('Enter the radius of conductors (in meters): ');
    length = input('Enter the length of the transmission line (in meters): ');

    % Constants
    mu0 = 4 * pi * 1e-7; % Vacuum permeability

    % Calculating inductance
    GMR = radius * 2; % Geometric Mean Radius
    d = distance; % Distance between conductors

    D = GMR * 2; % Diameter of bundle
    n = D / d; % Number of sub-conductors
    K = 1 + (1 / (n^2));

    L = mu0 * length / pi * log(2 * D / GMR);
    Lb = L / K; % Inductance of one sub-conductor

    inductance = n * Lb;
    
    % Displaying the result
    fprintf('The inductance of the bundled conductors is %.4f H.\n', inductance);
elseif type==3
    distance = input('Enter the distance between conductors (in meters): ');
radius = input('Enter the radius of the conductors (in meters): ');
length = input('Enter the length of the transmission line (in meters): ');

% Constants
mu0 = 4*pi*10^-7; % Permeability of free space

% Calculate the inductance
inductance = (mu0/(2*pi)) * log((2*distance)/radius) * length;

% Display the result
fprintf('The inductance of the transmission line is %.6f Henrys.\n',inductance);
else 
    distance = input('Enter the distance between conductors (in meters): ');
radius = input('Enter the radius of conductors (in meters): ');
length = input('Enter the length of the transmission line (in meters): ');

% Constants
mu0 = 4*pi*1e-7; % Vacuum permeability

% Calculation
d = distance;
R = radius;
L = length;

GMD = sqrt(d^2 + R^2/2); % Geometric mean distance

L_per_meter = (mu0/2/pi) * log(2*GMD/R);

inductance = L_per_meter * L;

% Display result
fprintf('Inductance of the double transmission line: %.6f H\n',inductance);
end

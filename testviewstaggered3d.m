% FUNCTION_NAME - testviewstaggered3d
%
% Test viewstaggered2d to visualize a 3D set of cells and their centers, i.e. a
% logically-rectangular 3D uniform staggered grid.
%
% Other m-files required: viewstaggered3d.m
% Subfunctions: None.
% MAT-files required: None.
%
% See also: viewstaggered3d, viewstaggered2d, plot, hold, length, get, scatter,
% ones
%
% Author: Eduardo Sanchez.
% Computational Science Research Center.
% 5500 Campanile Drive, San Diego State University.
% Email: esanchez at mail dot sdsu dot edu
% Website: http://www-rohan.sdsu.edu/~sanche94/
% December 2014; Last revision: 19-December-2014.

%------------- BEGIN CODE --------------

function testviewstaggered3d

  clc;
  close all;
  clear all;
  
  xa = 0.0;
  xb = 1.0;
  ya = 0.0;
  yb = 1.0;
  za = 0.0;
  zb = 1.0;
  m = 5;  % Number of cells on the x direction.
  n = 6;  % Number of cells on the y dimension.
  o = 7;  % Number of cells on the z dimension.
  
  deltax = abs(xb - xa)/m;
  deltay = abs(yb - ya)/n;
  deltaz = abs(zb - za)/o;
  
  xnodes = [xa:deltax:xb];
  ynodes = [ya:deltay:yb];
  znodes = [za:deltaz:zb];

  figure(1);
  viewstaggered3d(xnodes, ynodes, znodes, deltax, deltay, deltaz, m, n, o, true)
  xlabel('$\tilde{x}$','Interpreter','latex');
  ylabel('$\tilde{y}$','Interpreter','latex');
  zlabel('$\tilde{z}$','Interpreter','latex');
  title('Logically-Rectangular 3D Uniform Grid');
end

%------------- END OF CODE --------------

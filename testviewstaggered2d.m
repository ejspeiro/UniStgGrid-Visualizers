% FUNCTION_NAME - testviewstaggered2d
%
% Test viewstaggered2d to visualize a 2D set of cells and their centers, i.e. a
% logically-rectangular 2D uniform staggered grid.
%
% Other m-files required: viewstaggered2d.m
% Subfunctions: None.
% MAT-files required: None.
%
% See also: viewstaggered2d, plot, hold, length, get, scatter, ones
%
% Author: Eduardo Sanchez.
% Computational Science Research Center.
% 5500 Campanile Drive, San Diego State University.
% Email: esanchez at mail dot sdsu dot edu
% Website: http://www-rohan.sdsu.edu/~sanche94/
% June 2014; Last revision: 19-December-2014.

%------------- BEGIN CODE --------------

function testviewstaggered2d

  clc
  close all
  clear all

  xa = 0.0;
  xb = 1.0;
  ya = 0.0;
  yb = 1.0;
  m = 4;  % Number of cells on the x dimension.
  n = 4;  % Number of cells on the y dimension.

  deltax = abs(xb - xa)/m;
  deltay = abs(yb - ya)/n;

  xnodes = [xa:deltax:xb]
  ynodes = [ya:deltay:yb]
  xcenters = [(xa + deltax/2):deltax:(xb - deltax/2)]
  ycenters = [(ya + deltay/2):deltay:(yb - deltay/2)]

  figure(1);
  viewstaggered2d(xnodes, ynodes, xcenters, ycenters, true);
  grid on;
  xlabel('$\tilde{x}$','Interpreter','latex');
  ylabel('$\tilde{y}$','Interpreter','latex');
  title('Logically-Rectangular 2D Uniform Staggered grid');
 end

%------------- END OF CODE --------------

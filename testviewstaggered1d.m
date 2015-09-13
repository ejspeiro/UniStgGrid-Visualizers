% FUNCTION_NAME - testviewstaggered1d
%
% Test viewstaggered1d to visualize a 1D set of cells and their centers, i.e. a
% logically-rectangular 1D uniform staggered grid.
%
% Other m-files required: viewstaggered1d.m
% Subfunctions: None.
% MAT-files required: None.
%
% See also: viewstaggered1d, plot, hold, length, get, scatter, ones
%
% Author: Eduardo Sanchez.
% Computational Science Research Center.
% 5500 Campanile Drive, San Diego State University.
% Email: esanchez at mail dot sdsu dot edu
% Website: http://www-rohan.sdsu.edu/~sanche94/
% December 2014; Last revision: 21-December-2014.

%------------- BEGIN CODE --------------

function testviewstaggered1d

  clc
  close all
  clear all

  xa = 0.0;
  xb = 1.0;
  m = 5;  % Number of cells on the x dimension.
  deltax = abs(xb - xa)/m;

  xnodes = [xa:deltax:xb]
  xcenters = [(xa + deltax/2):deltax:(xb - deltax/2)]

  figure(1);
  viewstaggered1d(xnodes,xcenters,deltax,true);
  xlabel('$\tilde{x}$','Interpreter','latex');
  title('Logically-Rectangular 1D Uniform Rectangular Grid');
end

%------------- END OF CODE --------------

function [Table] = desstatt(vector)
% DESSTAT give a set of descriptive statistics of a vector
%
% ------------------------------------------------------------------------
%    Copyright (C) 2019  M. Schrauwen (markschrauwen@gmail.com)
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.
% ------------------------------------------------------------------------
% 
% DESCRIPTION:
%
% 
% BY: 2019  M. Schrauwen (markschrauwen@gmail.com)
% 
% PARAMETERS:
%               v:   a numeric vector

% $Revision: 0.0.0 $  $Date: 2019-05-17 $
% Creation of this function.

mean = mean(vector);
max = max(vector);
min = min(vector);
median = median(vector);
mode = mode(vector);
std = std(vector);
var = var(vector);

Table = table(mean,max,min,median,mode,std,var);

end %function

FPCA: Fixed Point Continuation with Approximate SVD for Matrix Rank Minimization and Matrix Completion

Copyright (C) 2008 Shiqian Ma 
-------------------------------------------------------------

1.  Introduction 

FPCA is designed for solving matrix rank minimization problem and matrix completion problem.

Please run  One_run.m to see how the code works. 

How to choose parameters is described in get_opts_FPCA.m.  Basically, if you are trying to complete a matrix whose rank 

is relative large while the number of sampled entries is very small, you should use the parameters for "hard" problem. 

Otherwise, just use the parameters for "easy" problem. 

If you are not sure how to choose parameters for your specific problems, please feel free to contact with the author. 


2.  Contact Information
=======================

FPCA is available at http://www.columbia.edu/~sm2756/FPCA.htm.  Please
feel free to e-mail the author with any comments or suggestions:

	Shiqian Ma  < sm2756@columbia.edu >


3.  Copyright Notice
====================

FPCA is free software; you can redistribute it and/or modify it under the 
terms of the GNU General Public License as published by the Free Software 
Foundation; either version 3 of the License, or (at your option) any later 
version.

This program is distributed in the hope that it will be useful, but WITHOUT 
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for 
more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
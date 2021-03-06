(* ::Package:: *)

AppendTo[$Path,"~/Research/Cuba-3.0"];
Install["Suave"];
Clear[\[Lambda],fgps,fgps2]
\[Lambda][r_,\[Mu]_]:=(1+r^2-2*r*\[Mu])^(1/2);

b1=1;
b2=0.1;
br=0.01;

f[r_,\[Mu]_]:= If[r==1&&\[Mu]==1,13/28,(3r+7\[Mu]-10r*\[Mu]^2)/(14*r*\[Lambda][r,\[Mu]]^2)];
g[r_,\[Mu]_,k_,tr_]:= tr[k*r]*tr[k*\[Lambda][r,\[Mu]]]*If[r==1&&\[Mu]==1,0,(r-\[Mu])/\[Lambda][r,\[Mu]]];

fgps[k_,spec_,tr_]:=
	Module[{r,\[Mu]},Suave[r^2*spec[k*r]*spec[k*\[Lambda][r,\[Mu]]]*(b2^2/2+2*b1*b2*f[r,\[Mu]]
												  +4*b1*br*f[r,\[Mu]]*g[r,\[Mu],k,tr]+2*b2*br*g[r,\[Mu],k,tr]
												  +2*br^2*g[r,\[Mu],k,tr]^2),
													{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];
fgps2[k_,spec_,tr_]:=
	Module[{r,\[Mu]},Suave[1/r^4*spec[k/r]*spec[k*\[Lambda][1/r,\[Mu]]]*(b2^2/2+2*b1*b2*f[1/r,\[Mu]]
													   +4*b1*br*f[1/r,\[Mu]]*g[1/r,\[Mu],k,tr]
													   +2*b2*br*g[1/r,\[Mu],k,tr]+2*br^2*g[1/r,\[Mu],k,tr]^2),
															{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];
(* By parameter *)

autoru[k_,spec_,tr_]:=
	Module[{r,\[Mu]},Suave[r^2*spec[k*r]*spec[k*\[Lambda][r,\[Mu]]]*(2*br^2*g[r,\[Mu],k,tr]^2)
						+1/r^4*spec[k/r]*spec[k*\[Lambda][1/r,\[Mu]]]*(2*br^2*g[1/r,\[Mu],k,tr]^2),
							{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];
autonl[k_,spec_]:=
	Module[{r,\[Mu]},Suave[r^2*spec[k*r]*spec[k*\[Lambda][r,\[Mu]]]*(b2^2/2+2*b1*b2*f[r,\[Mu]])
						+1/r^4*spec[k/r]*spec[k*\[Lambda][1/r,\[Mu]]]*(b2^2/2+2*b1*b2*f[1/r,\[Mu]]),
							{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];
cross[k_,spec_,tr_]:=
	Module[{r,\[Mu]},Suave[r^2*spec[k*r]*spec[k*\[Lambda][r,\[Mu]]]*(4*b1*br*f[r,\[Mu]]*g[r,\[Mu],k,tr]+2*b2*br*g[r,\[Mu],k,tr])
						+1/r^4*spec[k/r]*spec[k*\[Lambda][1/r,\[Mu]]]*(4*b1*br*f[1/r,\[Mu]]*g[1/r,\[Mu],k,tr]+2*b2*br*g[1/r,\[Mu],k,tr]),
							{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];


(* Term by Term *)
term1[k_,spec_]:=
	Module[{r,\[Mu]},Suave[r^2*spec[k*r]*spec[k*\[Lambda][r,\[Mu]]]*(b2^2/2)
						+1/r^4*spec[k/r]*spec[k*\[Lambda][1/r,\[Mu]]]*(b2^2/2),
							{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];
term2[k_,spec_]:=
	Module[{r,\[Mu]},Suave[r^2*spec[k*r]*spec[k*\[Lambda][r,\[Mu]]]*(2*b1*b2*f[r,\[Mu]])
						+1/r^4*spec[k/r]*spec[k*\[Lambda][1/r,\[Mu]]]*(2*b1*b2*f[1/r,\[Mu]]),
							{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];

term3[k_,spec_,tr_]:=
	Module[{r,\[Mu]},Suave[r^2*spec[k*r]*spec[k*\[Lambda][r,\[Mu]]]*(4*b1*br*f[r,\[Mu]]*g[r,\[Mu],k,tr])
						+1/r^4*spec[k/r]*spec[k*\[Lambda][1/r,\[Mu]]]*(4*b1*br*f[1/r,\[Mu]]*g[1/r,\[Mu],k,tr]),
							{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];

term4[k_,spec_,tr_]:=
	Module[{r,\[Mu]},Suave[r^2*spec[k*r]*spec[k*\[Lambda][r,\[Mu]]]*(2*b2*br*g[r,\[Mu],k,tr])
						+1/r^4*spec[k/r]*spec[k*\[Lambda][1/r,\[Mu]]]*(2*b2*br*g[1/r,\[Mu],k,tr]),
							{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];

term5[k_,spec_,tr_]:=
	Module[{r,\[Mu]},Suave[r^2*spec[k*r]*spec[k*\[Lambda][r,\[Mu]]]*(2*br^2*g[r,\[Mu],k,tr]^2)
						+1/r^4*spec[k/r]*spec[k*\[Lambda][1/r,\[Mu]]]*(2*br^2*g[1/r,\[Mu],k,tr]^2),
							{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];

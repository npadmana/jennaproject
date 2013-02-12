(* ::Package:: *)

AppendTo[$Path,"~/Research/Cuba-3.0"]
Install["Suave"]
Clear[\[Lambda],fgps,fgps2]
\[Lambda][r_,\[Mu]_]:=1+r^2-2*r*\[Mu];
fgps[k_,spec_] := Module[{r,\[Mu]},Suave[(r/14*spec[k*r]*spec[k*\[Lambda][r,\[Mu]]^(1/2)]*f[r,\[Mu]]),{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];
fgps2[k_,spec_] := Module[{r,\[Mu]},Suave[(1/(14*r)*spec[k/r]*spec[k*\[Lambda][1/r,\[Mu]]^(1/2)]*f[1/r,\[Mu]]),{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]]


fgps3[k_,spec_]:= Module[{r,\[Mu]},Suave[(r^2*spec[k*r]*spec[k*\[Lambda][r,\[Mu]]^(1/2)]*g[r,\[Mu]]),{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];

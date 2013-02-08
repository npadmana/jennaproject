(* ::Package:: *)

Install["Suave"]
Clear[\[Lambda],fgps,fgps2]
\[Lambda][r_,\[Mu]_]:=1+r^2-2*r*\[Mu];
fgps[k_,Pmgood_] := Module[{r,\[Mu]},Suave[(r/14*Pmgood[k*r]*Pmgood[k*\[Lambda][r,\[Mu]]^(1/2)]*f[r,\[Mu]]),{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]];
fgps2[k_,Pmgood_] := Module[{r,\[Mu]},Suave[(1/(14*r)*Pmgood[k/r]*Pmgood[k*\[Lambda][1/r,\[Mu]]^(1/2)]*f[1/r,\[Mu]]),{r,0,1},{\[Mu],-1,1},Verbose->0][[1,1]]]

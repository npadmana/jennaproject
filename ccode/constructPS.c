#include<stdio.h>
#include<stdlib.h>
#include<math.h>

#define NUMVALS 420
#define h 0.703

/* Takes in values of the galaxy bias products b1*b1, b1*b2, b1*br, etc. and a linear power spectrum; reads in values for the 5 terms in the 2nd order correction to the non-linear power spectrum due to the relative velocity effect (Yoo et al. Eqn 4.2), from files generated through mathematica (DataGen.nb)
NB: final fullps file normalized by 1/h^3 to match Yoo et al. */

int main(int argc, char *argv[])
{
  int nv=NUMVALS,i;
  double pl[nv],fps[nv],b1b2[nv],b2b2[nv],b1br[nv],b2br[nv],brbr[nv],k[nv];
  double b11,b12,b22,b1r,b2r,brr;
  FILE *plin,*fullps,*b1_b2,*b2_b2,*b1_br,*b2_br,*br_br,*kvals;
  
  if(argc != 7)
    printf("%d Please try again with 6 input values in the following order: b1*b1 b1*b2 b1*br b2*b2 b2*br br*br\n",argc);
  
  else{
    b11 = atof(argv[1]);
    b12 = atof(argv[2]);
    b1r = atof(argv[3]);
    b22 = atof(argv[4]);
    b2r = atof(argv[5]);
    brr = atof(argv[6]);

    kvals = fopen("kvals.txt","r");
    for(i=0;i<NUMVALS;i++)
      fscanf(kvals,"%lf",&(k[i]));
    fclose(kvals);

    plin = fopen("plin.txt","r");
    for(i=0;i<NUMVALS;i++)
      fscanf(plin,"%lf",&(pl[i]));
    fclose(plin);
    
    b1_b2 = fopen("b1b2.txt","r");
    for(i=0;i<NUMVALS;i++)
      fscanf(b1_b2,"%lf",&(b1b2[i]));
    fclose(b1_b2);
    
    b2_b2 = fopen("b2b2.txt","r");
    for(i=0;i<NUMVALS;i++)
      fscanf(b2_b2,"%lf",&(b2b2[i]));
    fclose(b2_b2);
    
    b1_br = fopen("b1br.txt","r");
    for(i=0;i<NUMVALS;i++)
      fscanf(b1_br,"%lf",&(b1br[i]));
    fclose(b1_br);
    
    b2_br = fopen("b2br.txt","r");
    for(i=0;i<NUMVALS;i++)
      fscanf(b2_br,"%lf",&(b2br[i]));
    fclose(b2_br);
    
    br_br = fopen("brbr.txt","r");  
    for(i=0;i<NUMVALS;i++)
      fscanf(br_br,"%lf",&(brbr[i]));
    fclose(br_br);
    
    fullps = fopen("fullps.txt","w+");
    
    /*note: must normalize to terms as calculated in Mathematica -- e.g. in Mathematica we have set b1=1, b2=0.1, so these must 
      be divided out here in order to allow for varying the values of b1 and b2*/
    for(i=0;i<NUMVALS;i++){
      fps[i] = 1/h^3*(b11*pl[i]+b12/(0.1)*b1b2[i]+b1r/(0.01)*b1br[i]+b22/(0.1*0.1)*b2b2[i]+b2r/(0.1*0.01)*b2br[i]+brr/(0.01*0.01)*brbr[i]);
    }
    
    for (i=0;i<NUMVALS;i++){
      fprintf (fullps, "%f %f\n",k[i],fps[i]);
    }

    fclose(fullps);
  }

  return 0;

}

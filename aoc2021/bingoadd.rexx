/* BINGOADD REXX      Add remaining numbers for winners              */
/*                    Author: Rob van der Heij, 5 Dec 2021           */


'callpipe (end \ name BINGOADD.REXX:5)',
   '\ *: ',
   '| o: not fanout ',
   '| copy ',
   '| l: lookup w3 detail ',          /* Only look at winners        */
   '| unique (w1 w3) first ',         /* Avoid double per board      */
   '| spec 1.10 1 1-* 11 number n.10 r ', /* Use number as increment */
   '| k: lookup autoadd count increment w3 ', /* Sum remain by board */
   '\ l: ',
   '\ o: ',
   '| pick w2 == ,5, ',               /* Winning row or column       */
   '| l: ',                           /* .. add to winners list      */
   '\ k: ',
   '\ k: ',
   '| *: ',




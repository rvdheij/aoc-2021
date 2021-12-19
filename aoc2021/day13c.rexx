/* DAY13C   REXX                                                     */
/*                   Author: Rob van der Heij, 19 Dec 2021           */

signal on error
'callpipe (end \ name DAY13C.REXX:5)',
   '\ *: ',
   '| strip ',
   '| p: pick to w1 == ,fold, ',
   '| locate w1 ',
   '| buffer ',
   '| spec fs , f2 1.10 r f1 11.10 r',/* Do row/col                  */
   '| d: day13d ',
   '| *: ',
   '\ p: ',
   '| d: ',



error: return rc * ( rc <> 12)

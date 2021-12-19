/* DAY13H   REXX                                                     */
/*                   Author: Rob van der Heij, 19 Dec 2021           */

signal on error
signal on novalue

'callpipe (end \ name DAY13H.REXX:4)',
   '\*: ',
   '| p: pick to w1 == ,fold, ',
   '| locate w1 ',
   '| spec fs , f2 1.10 r f1 n.10 r ',
   '| day13f ',
   '| d: day13g ',
   '|*: ',
   '\ p: ',
   '| d: '



error: return rc * (rc <> 12)

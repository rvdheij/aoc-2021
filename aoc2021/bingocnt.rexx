/* BINGOCNT REXX      Score against both rows and columns            */
/*                    Author: Rob van der Heij, 4 Dec 2021           */

'callpipe (end \ name BINGOCNT.REXX:7)',
   '\ *: ',
   '| bingohit ',                     /* Report matched bingo cells  */
   '| o: fanout ',
   '| chop 10 ',                      /* Keep just chosen number     */
   '| j: juxtapose ',                 /* .. as prefix                */
   '| *: ',
   '\ o: ',
   '| spec 11.20 1 ',                 /* Board and row as key        */
   '| lookup autoadd before trackcount count 1.20 master ',
   '| j: ',
   '\ o: ',
   '| spec 11.10 1 31.10 n ',         /* Board and column as key     */
   '| lookup autoadd before trackcount count 1.20 master ',
   '| j: '

error: return rc * ( rc <> 12 )

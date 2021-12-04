/* MAKECOOR REXX      Transform the up/down/forward n into dX dY     */
/*                    Author: Rob van der Heij, 2 Dec 2021           */

'callpipe (end \ name MAKECOOR.REXX:4)',
   '\ *: ',
   '| d: deal streamid substr 1.4 of w1 ',        /* Deal on keyword */
   '\ d.up: ',
   '| spec ,0 -, 1 w2 n ',            /* Up is as  "0 -n"            */
   '| i: faninany ',
   '| *: ',
   '\ d.down: ',
   '| spec ,0 , 1 w2 n ',             /* Down is "0 n"               */
   '| i: ',
   '\ d.forw: ',
   '| spec w2 1 ,0, nw',              /* Forward is "n 0"            */
   '| i: ',

error: return rc * ( rc <> 12 )


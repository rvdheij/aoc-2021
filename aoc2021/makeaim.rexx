/* MAKEAIM  REXX      Compute the AIM from the dX and dY values      */
/*                    Author: Rob van der Heij, 2 Dec 2021           */

'callpipe (end \ name MAKEAIM.REXX:4)',
   '\ *: ',
   '| spec printonly eof a:w1 - b:w2 - ',          /* #0 is position */
          'set #0+=a;#2+=b;#1+=(#2*a) ',         /* #1 depth, #2 aim */
          'eof print #0*#1 1 ',       /* Compute product             */
   '| *: '

error: return rc * ( rc <> 12 )


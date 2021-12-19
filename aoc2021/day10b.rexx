/* DAY10B   REXX     Add all number in columns 1.10                  */
/*                   Author: Rob van der Heij, 19 Dec 2021           */

signal on error
signal on novalue

'callpipe (end \ name DAY10B.REXX:9)',
   '\ *: ',
   '| spec printonly eof a: 1.10 - set #0+=a eof print #0 1 ',
   '| *: '

error: return rc * ( rc <> 12 )


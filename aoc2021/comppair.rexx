/* COMPPAIR REXX      Compare pairs of consecutive numbers           */
/*                    Author: Rob van der Heij, 1 Dec 2021           */

'callpipe (name COMPPAIR.REXX:4)',
   '| *: ',
   '| dup ',
   '| drop ',
   '| drop last ',
   '| spec w1 1.10 r ',
   '| join ',
   '| pick 1.10 << 11.10 ',
   '| *: '

return rc * ( rc <> 12 )

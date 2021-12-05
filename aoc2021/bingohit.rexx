/* BINGOHIT REXX      Match the chosen numbers against board cells   */
/*                    Author: Rob van der Heij, 4 Dec 2021           */

'callpipe (end \ name BINGOHIT.REXX:4)',
   '\ *: ',
   '| t: take ',                      /* The numbers to score        */
   '| buffer ',
   '| split , ',
   '| l: lookup w1 allmasters',
   '| *: ',
   '\ t: ',
   '| bingo ',                        /* Tag with board, row and col */
   '| l: ',

error: return rc * ( rc <> 12 )

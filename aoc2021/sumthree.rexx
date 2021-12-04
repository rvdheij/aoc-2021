/* SUMTHREE REXX      Compute sum of 3 consecutive numbers           */
/*                    Author: Rob van der Heij, 1 Dec 2021           */

'callpipe (name SUMTHREE.REXX:4)',
   '| *: ',
   '| dup ',                          /* Make pairs                  */
   '| drop ',                         /* Align by dropping first     */
   '| drop last ',                    /* .. and last                 */
   '| join , , ',
   '| dup ',                          /* Make pairs of pairs         */
   '| drop ',
   '| drop last ',
   '| spec w1 1 read w1-* nw ',       /* Remove middle number        */
   '| spec a:w1 - b:w2 - c:w3 - print a+b+c 1.6 r ',     /* Add them */
   '| *: ',

error: return rc * ( rc <> 12 )

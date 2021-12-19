/* BINGONRS REXX      Tag bingo board cells with coordinates         */
/*                    Author: Rob van der Heij, 4 Dec 2021           */

/* This creates one line per cell, tagged with board, row and column */

'callpipe (end \ name BINGO.REXX:4)',
   '\ *: ',
   '| hdr: nlocate w1 ',              /* Select separator lines      */
   '| spec number 1.10 r ',           /* Make board#                 */
   '| j0: juxtapose count ',          /* .. count rows in a board    */
   '| spec 11.10 1 1.10 n ',          /* Make board# and row#        */
   '| j1: juxtapose ',                /* Prefix with board# and row# */
   '| spec 31.10 1 1.30 n ',          /* Cell before coordinates     */
   '| *: ',
   '\ hdr: ',
   '| o: fanout ',                    /* Use each row in a board     */
   '| chop 0 ',                       /* .. so they can be counted   */
   '| j0: ',                          /* .. in a juxtapose stage     */
   '\ o: ',
   '| chop 0 ',
   '| j2: juxtapose count ',          /* Count cells in a row        */
   '| j1: ',                          /* .. and add coordinates      */
   '\ o: ',
   '| split ',                        /* Split rows in cells         */
   '| spec w1 1.10 r ',               /* .. and align contents       */
   '| j2: '


error: return rc * ( rc <> 12 )

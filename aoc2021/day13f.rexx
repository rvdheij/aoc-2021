/* DAY13F   REXX     Plot row/col pairs on a grid                    */
/*                   Author: Rob van der Heij, 19 Dec 2021           */

/* Input records have row and column in two 10-byte fields. Sort on  */
/* row and drop duplicates to save resources.We then create records  */
/* with a '*' in the proper column (shifted by 12 to allow for the   */
/* row number and a space, and knowing the columns start at 0.       */

/* The OVERSTR combines the records for the same row. Admitted, this */
/* only produces an output record for rows that have any points on   */
/* them. In practice this should work out well to see patterns in an */
/* empty grid.                                                       */

'callpipe (end \ name DAY13F.REXX:4)',
   '\ *: ',
   '| sort unique ',
   '| spec b:1.10 1.10 a: 11.10 - ,*, (a+12) ',
   '| u: if unique 1.10 last ',
   '| insert x09 ',
   '| u: ',
   '| insert x01 ',
   '| u: ',
   '| overstr ',
   '| strnfind x00 ',
   '| substr 2-* ',
   '| spec a: 1.10 - ',
          'while #0<a do ',
               'print #0 1.10 r write',
               'set #0+=1 ',
          'done ',
          '1-* 1 set #0+=1 ',
   '| *: ',

error: return rc * ( rc <> 12)

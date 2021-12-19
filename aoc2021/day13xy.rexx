/* DAY13XY  REXX     Fold the grid along X or Y                      */
/*                   Author: Rob van der Heij, 19 Dec 2021           */

signal on error
signal on novalue

parse arg dir pos
if dir = 'y' then
  'callpipe (end \ name DAY07Y.REXX:6)',
     '\ *: ',
     '| t: take' pos ,                /* Hold first set of records   */
     '| buffer ',
     '| c: combine or ',             /* Overlay with reversed bottom */
     '| *: ',
     '\ t: ',
     '| drop ',
     '| instore reverse ',
     '| outstore ',                  /* Remainder in other direction */
     '| spec 11-* 11 ',
     '| c: '
else
  'callpipe (end \ name DAY07Y.REXX:20)',
     '\ *: ',
     '| z: chop' pos+12 ,             /* Chop after fold column      */
     '| copy ',
     '| c: combine or ',              /* Overlay left and right side */
     '| *: ',
     '\ z: ',
     '| pad' pos+1 ,                  /* Ensure it is full width     */
     '| reverse ',
     '| spec 1-* 11 ',                /* Position beyond row number  */
     '| c: ',


error: return rc * ( rc <> 12 )

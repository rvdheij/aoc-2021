/* DAY09C   REXX     Detect areas between '9' cells and count them   */
/*                   Author: Rob van der Heij, 10 Dec 2021           */

signal on novalue

'addpipe (end \ name DAY09D.REXX:5)',
   '\ *.input: ',
   '| xlate *-* 0-8 . 9 * ',          /* Mark edges and areas        */
   '| insert ,*, after ',
   '| *.input: '

'peekto row'
m = length(row)

/* The logic is to swep over the area row by row, painting each area */
/* surrounded by '9' cells. Each area is assigned a unique number as */
/* the paint to color the area. When scanning a row, we pick up the  */
/* paint from the row above, if any. When we run into a '9' fence    */
/* without a color, we assign a new one.                             */

/* It can happen that after scanning one or more rows, we eventually */
/* find that two areas are connected after all. In that case we keep */
/* the mapping in the EQU. table for when we count each area.        */

equ. = ''                             /* Track any connected areas   */
tot. = 0                              /* Accumulate per area         */

cnt = 0                               /* Count the colors            */
nxt = copies('0 ', m)                 /* Color 0 is uncolored        */
do forever
  'peekto row'
  if rc <> 0 then leave
  prv = nxt                           /* Previous row                */
  nxt = ''                            /* Current row                 */
  now = 0                             /* Previous cell this row      */
  p = 0                               /* Number of blank cells       */
  do col = 1 to m
    ch = substr(row, col, 1)          /* Current cell                */
    w  = subword(prv, col, 1)         /* Cell above                  */
    select
      when ch = '*' then              /* Ran into a ridge            */
        do
          if p > 0 then               /* Seen some blank cells       */
            do
              cnt = cnt + 1           /* Assign new color            */
              nxt = subword(nxt, 1, col-p-1) copies(cnt' ', p)
              p = 0
            end
          now = 0
        end
      when w > 0 then                 /* Cell above is painted       */
        do
          if p > 0 then               /* Seen some cells yet         */
            nxt = subword(nxt, 1, col-p-1) copies(w' ', p)
          else if now > 0 & now <> w then
            do
              if equ.w = '' then equ.w = now      /* Connected areas */
              else if equ.w <> now then
                say 'Ouch:' 'w:' w 'equ.w:' equ.w 'now:' now
            end
          p = 0
          now = w
        end
      when now > 0 then nop
      otherwise p = p + 1
    end
    nxt = nxt now
  end

  do i = 1 to m                       /* Count colors in this row    */
    w = subword(nxt, i, 1)
    if w > 0 then tot.w = tot.w + 1
  end
  'readto'
end

tot.0 = cnt                           /* Last color assigned         */
do i = 1 to tot.0
  tot = 0
  w = equ.i
  do while equ.w <> ''                /* Find where to count this    */
    w = equ.w
  end

  if w <> '' then parse value (tot.w + tot.i) 0 with tot.w tot.i
end

'callpipe (end \ name DAY09D.REXX:76)',
   '\ stem tot. ',
   '| spec number 1.5 r w1 nw.8 r ',  /* Arrange count by color      */
   '| sort 6-* d ',                   /* .. to find top-3            */
   '| take 3 ',
   '| substr w2 ',
   '| join * / / ',
   '| spec a:w1 - b:w2 - c:w3 - print a*b*c 1 ',      /* .. multiply */
   '| cons '

error: return rc * ( rc <> 12 )


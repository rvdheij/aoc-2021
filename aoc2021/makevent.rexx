/* MAKEVENT REXX                                                     */
/*                    Author: Rob van der Heij, 5 Dec 2021           */

signal on error
do forever
  'peekto line'
  parse var line c1 . c2
  parse var c1 x1 ',' y1
  parse var c2 x2 ',' y2
  parse value '0 0' with dx dy
  if x1 < x2 then dx = 1
  if x1 > x2 then dx = -1
  if y1 < y2 then dy = 1
  if y1 > y2 then dy = -1
  diag = right(abs(dx*dy),10)
  do while x1 <> x2 | y1 <> y2
    'output' right(x1,10)right(y1,10)diag
    x1 = x1 + dx
    y1 = y1 + dy
  end
  'output' right(x1,10)right(y1,10)diag
  'readto'
end
error: return rc * ( rc <> 12 )

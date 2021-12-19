/* DAY13D   REXX                                                     */
/*                   Author: Rob van der Heij, 19 Dec 2021           */

signal on error
signal on novalue

'callpipe *.input.1: | substr w3 | stem fold.'    /* Transformations */
pipe = ''
do i = 1 to fold.0
  parse var fold.i dir '=' p .
  if dir = 'x' then
    comp = 'if b>'p 'then print '2*p'-b 11.10 r fi'
  else
    comp = 'if a>'p 'then print '2*p'-a  1.10 r fi'

  pipe = pipe '| spec a: 1.10  1 b: 11.10 11 ' comp
  'readto'
end
'callpipe (end \) *:' pipe '| *: '

return rc * ( rc <> 12 )


/* DAY13G   REXX                                                     */
/*                   Author: Rob van der Heij, 19 Dec 2021           */

signal on error
signal on novalue

'callpipe *.input.1: | pick w1 == ,fold, | spec w3 | stem fold.'

pipe = ''
do i = 1 to fold.0
  parse var fold.i dir '=' pos .
  pipe = pipe ,
    '| day13xy' dir pos
end
'callpipe (end \) *:' pipe '| *:'

error: return rc * ( rc <> 12 )

/* DAY10A   REXX                                                     */
/*                   Author: Rob van der Heij, 19 Dec 2021           */

signal on error
signal on novalue

numeric digits 15

do forever
  'peekto line'
  'output' process(line)
  'readto'
end
error: return rc * ( rc <> 12 )



process: procedure
pairs = '()[]{}<>'
bad = '3 57 1197 25137'               /* Points on corrupt parse     */
parse arg line
stack = ''
res = 0
do i = 1 to length(line) while res = 0        /* Stop early on error */
  ch = substr(line,i,1)
  p = pos(ch, pairs)
  if p//2 then stack = substr(pairs,p+1,1) stack
  else
    do
      parse var stack pop stack
      if pop <> ch then res = subword(bad, p%2, 1)
    end
end
if res <> 0 then return right(res,10) 'bad'
do while stack <> ''
  parse var stack pop stack
  res = res * 5 + pos(pop, pairs)%2
end
return right(res,20) 'short'


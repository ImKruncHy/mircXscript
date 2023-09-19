on *:LOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4N94ick 4C94completer 4S94ystem 94| 4ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on *:UNLOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4N94ick 4C94completer 4S94ystem 94| 4DE-ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on *:tabcomp:*:{
  ; edit %f1 & %f2 to suit your style.
  var %f1 4(94nick4):
  var %f2 4(94nick4)

  var %t $target, %eb $1-, %nt $numtok(%eb,32), %f $iif(%nt > 1,%f2,%f1), %a 1
  while %a < $len(%f) {
    if $mid(%f,%a,4) == nick { dec %a | break }
    inc %a
  }
  var %aa $iif(%a,$mid(%f,1,%a)), %bb $mid(%f,$calc(%a + 5))
  var %et $gettok(%eb,1 - $calc(%nt - 1),32), %e $gettok(%eb,-1,32)
  var %ee $iif($remove(%e,%aa,%bb) == %nc.nick,%nc.nick,%e)
  var %p $iif($remove(%e,%aa,%bb) == %nc.nick,%nc.pos,$calc($editbox(%t).selstart - 1 - $iif(%nt > 1,$calc($len(%et) + 1),0))) 
  var %i $calc($nick(%t,%ee) + $iif($left(%nc.nick,%p) == $left(%ee,%p) && %nc.pos == %p,1,0))
  if %t ischan {
    var %n $nick(%t,$nc(%t,%i,%p,%ee))
    if !%n { var %n $nick(%t,$nc(%t,1,%p,%ee)) }
  }
  else { var %n $iif($+($mid(%ee,1,%p),*) iswm %t,%t) }
  if %n {
    haltdef
    var %lt $+(%aa,%n,%bb), %text $iif(%nt > 1,$+(%et,$chr(32),%lt),%lt)
    editbox -ap %text
    set -e %nc.pos %p
    set -e %nc.nick %n
  }    
}

alias -l nc {
  var %t $1, %i $2, %p $3, %ee $4, %b 1
  while $nick(%t,%i) {
    var %n $v1 
    if $+($mid(%ee,1,%p),*) iswm %n { var %b 0 | break }
    inc %i
  }
  return $calc(%i + %b) 
}

on *:LOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4A94uto-4A94cronyms 4A94ddon 94| 4ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on *:UNLOAD: { 
  .echo -s 0,0 -
    .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4A94uto-4A94cronyms 4A94ddon 94| 4DE-ACTIVATED 94|
    .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

#acros on
on *:START: acro.load
on *:INPUT:*:{
  if (/* !iswm $1) && (!$ctrlenter) {
    var %text = $1-
    if $hfind(acros,%text,0,R) {
      haltdef   
      var %x = $ifmatch, %acro
      while (%x) { 
        %acro = $hfind(acros,%text,%x,R) 
        !.echo -q $regsub(%text,/\b $+ %acro $+ \b/g,$hget(acros,%acro),%text) 
        dec %x 
      }
      msg $active %text 
    }
  }
}
#acros end
alias acro.add { 
  if !$2 { echo -a You have to specify a translation for the acronym: $1 | return }
  if !$hget(acros) { acro.load }
  if $hget(acros,$1) { hdel acros $1 }
  hadd acros $1 $2-
  hsave -oi acros $+(",$mircdir,acros.txt,")
  echo -a Added acronym: $1 to hash table acros with translation: $2-
}
alias acro.del {
  if !$1 { echo -a You must specify an acronym | return }
  if !$hget(acros) { acro.load }
  if !$hget(acros,$1) { echo -a There is no such acronym: $1 in the Acronym Database | return }
  hdel acros $1
  hsave -oi acros $+(",$mircdir,acros.txt,")
  echo -a Deleted acronym: $1 from hash table acros 
}
alias acro.load { 
  if $hget(acros) { hfree acros } 
  hmake acros 
  hload -i acros $+(",$mircdir,acros.txt,") 
}
on *:LOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4D94oor 4R94evolve 4K94ick 94| 4ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on *:UNLOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4D94oor 4R94evolve 4K94ick 94| 4DE-ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on @*:join:#: { set -u8 %door. [ $+ [ $wildsite ] $+ . $+ [ $chan ] ] 1 }
on @*:part:#: {
  if (%door. [ $+ [ $wildsite ] $+ . $+ [ $chan ] ] && %door.check == $null) {
    set -u6 %door.check 1
    ban -u60 # $nick 2
    .notice $nick You are now BANNED in $chan 4[ 91mircX.org 1© 4]
    echo -s *** 4 $nick 94is now banned under 4Door-Revolve Protection! - 4[ 91mircX.org 1© 4]
  }
}
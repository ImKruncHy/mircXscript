on *:LOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4N94otice 4F94lood 4P94rotection 94| 4ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on *:UNLOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4N94otice 4F94lood 4P94rotection 94| 4DE-ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on *:notice:*:*: {
  if ((%notice. [ $+ [ $wildsite ] ] == $null) && ($nick != *serv*)) {
    set -u8 %notice. [ $+ [ $wildsite ] ] 1
    return
  }
  else { inc %notice. [ $+ [ $wildsite ] ] }
  if (%notice. [ $+ [ $wildsite ] ] > 6 && %notice.check == $null) {
    set -u6 %notice.check 1
    .ignore -nu45 $wildsite
    echo -s *** 4N94otice-4F94lood 4D94etected from 4$wildsite 94- Ignoring4 $wildsite for 445secs94..
  }
}
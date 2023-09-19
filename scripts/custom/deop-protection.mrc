on *:LOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 94mircX.org 1© 4] 4P94ersonal 4D94eOP 4P94rotection 94| 4ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on *:UNLOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4P94ersonal 4D94eOP 4P94rotection 94| 4DE-ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on *:DEOP:#: {
  if (($opnick == $me) && ($nick != $me) && ($nick != Chanserv)) {
    /chanserv op # $me halt
    /kick $chan $nick Don't DeOP Me! 4[ 94mircX.org 1© 4] 
    /mode # +b $nick
    /notice $nick Don't mess with me! 4[ 94mircX.org 1© 4] 
  }
}

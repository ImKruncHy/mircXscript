on *:LOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4P94ersonal 4B94an 4P94rotection 94| 4ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on *:UNLOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4P94ersonal 4B94an 4P94rotection 94| 4DE-ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on @!*:ban:#: {
  if ($banmask iswm $address($me,5)) {
    /chanserv op # $me halt
    /mode # -b $banmask
    /kick # $nick Don't ban me! 4 $nick D94on't 4M94ess 4W94ith 4M94e! 4[ 94mircX.org v1.0 1© 4]
    /mode # +b $nick
    /notice 4 $nick D94on't 4M94ess 4W94ith 4M94e! 4[ 94mircX.org v1.0 1© 4]
  }
}
on *:LOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4A94uto 4T94hanks 4F94or 4OP/94Voice 94| 4ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on *:UNLOAD: { 
  .echo -s 0,0 -
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 4[ 91mircX.org 1© 4] 4A94uto 4T94hanks 4F94or 4OP/94Voice 94| 4DE-ACTIVATED 94|
  .echo -s 0,4#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
  .echo -s 0,0 -
}

on *:OP:#: {
  if (($opnick == $me) && ($nick != $me) && ($nick != Chanserv)) {
    /msg $chan 4 $nick 4T94hanks 4f94or 4t94he 4OP 4(94+o4)
    /msg $nick 4T94hanks 4f94or 4t94he 4OP 4(94+o4)
  }
}

on *:VOICE:#: {
  if (($vnick == $me) && ($nick != $me) && ($nick != Chanserv)) {
    /msg $chan 4 $nick 4T94hanks 4f94or 4t94he 4Voice 4(94+v4)
    /msg $nick 4T94hanks 4f94or 4t94he 4Voice 4(94+v4)
  }
}

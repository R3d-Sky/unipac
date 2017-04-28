#!/bin/sh

# Run a command as the root user

function as_root()
{
  if   [ $EUID = 0 ];        then $*                # We are already root
  elif [ -x /usr/bin/sudo ]; then sudo $*           # sudo found, use that
  else                            su -c \\"$*\\"    # Fallback to su
  fi
}

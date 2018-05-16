#!/bin/sh -e


# Add Custom UserID as "User" User
if [ "$(id -u)" != "0" ]; then
  sed "s/^user:\(.*\):[0-9]\+:\([0-9]\+\):.*:\(.*:.*\)/user:\1:$(id -u):\2:User:\3/g" < /etc/passwd > /tmp/passwd \
  && cat /tmp/passwd > /etc/passwd \
  && rm -f /tmp/passwd
fi

# Execute Everything from Entries
exec "$@"

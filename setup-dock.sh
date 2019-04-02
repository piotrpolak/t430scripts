#!/bin/bash

# See more https://feeding.cloud.geek.nz/posts/hooking-into-docking-undocking-events-to-run-scripts/
# See more http://www.thinkwiki.org/wiki/How_to_configure_acpid#Event_Script
# See more https://phihag.de/2012/thinkpad-docking.html

sudo bash -c 'cat > /etc/acpi/events/thinkpad-dock << EOF
event=ibm/hotkey LEN0068:00 00000080 00004010
action=/home/pepis/t430scripts/dock.sh
EOF'

sudo bash -c 'cat > /etc/acpi/events/thinkpad-undock << EOF
event=ibm/hotkey LEN0068:00 00000080 00004011
action=/home/pepis/t430scripts/undock.sh
EOF'

sudo systemctl restart acpid.service

#!/bin/sh

VNC_HOST="$(echo "${DOCKER_HOST:-localhost}" | sed 's#.*/##;s#:.*##')"
open vnc://user:secret@"$VNC_HOST":5900

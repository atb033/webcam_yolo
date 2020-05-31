#!/bin/bash
set -e

# Source ros_ws
source "/ros_ws/devel/setup.bash"
exec "$@"

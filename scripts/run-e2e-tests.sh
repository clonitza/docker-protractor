#!/bin/bash
# Move to the Protractor test project folder
cd $HOME
# X11 for Ubuntu is not configured! The following configurations are needed for XVFB.
# Make a new display :21 with virtual screen 0 with resolution 1024x768 24dpi
Xvfb :10 -screen 0 1920x1080x24 2>&1 >/dev/null &
# Export the previously created display
# export DISPLAY=:10.0
sleep 20
echo "Running Protractor tests..."
# The configuration file (e2e.conf.js) should be passed here.
DISPLAY=:10 protractor $@
export RESULT=$?
echo "Ending Protractor tests"
# Remove temporary folders
rm -rf .config .local .pki .cache .dbus .gconf .mozilla
exit $RESULT
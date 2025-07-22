#!/bin/bash

# ------------------------------------------
# Bash Script Safety Flags: -e, -x, -u, -o pipefail
# ------------------------------------------

# Uncomment each of these to see the behavior


set -e      # Exit on error
set -x      # Debug mode ON

echo "Running risky command..."
false       # This fails and script stops here due to -e

set +e      # Turn off exit-on-error
echo "Now we won't stop on errors"
false       # This will not stop the script
echo "Script continues even after the error."

set +x      # Turn off debug logging

set -u  # Treat unset vars as error

echo "This will fail:"
echo "$UNDEFINED_VAR"  # Error: unbound variable

# ---

set +u  # Allow unset vars
echo "This will not fail:"
echo "$UNDEFINED_VAR"  # Just prints an empty line


set -o pipefail

echo "With pipefail:"
false | grep "test"   # Returns failure status (false fails)

# ---

set +o pipefail

echo "Without pipefail:"
false | grep "test"   # Returns 0 (grep didn’t fail)

# ---


echo "Starting Bash Safety Flags Demo..."

# ----------------------------
# set -e example
# ----------------------------
echo "Demo: set -e (exit on error)"
echo "This will fail intentionally"
false                     # This command fails -> script exits if -e is enabled
echo "You won't see this line if -e is set"

# ----------------------------
# set -x example
# ----------------------------
echo "Demo: set -x (debug)"
name="Yashas"
echo "Hello, $name"

# ----------------------------
# set -u example
# ----------------------------
echo "Demo: set -u (undefined variable)"
echo "Now using undefined variable:"
echo "Value: $undefined_var"    # This will cause error if -u is set

# ----------------------------
# set -o pipefail example
# ----------------------------
echo "Demo: set -o pipefail"
# The 'false' command fails, but 'grep' would normally hide that
false | grep "something"
echo "You won't see this line if pipefail is set"

# ----------------------------
# End of demo
# ----------------------------
echo "End of script."
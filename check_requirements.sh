#!/bin/bash

# Checks to see if the required tools mentioned in the array are installed on the system
# Passes on the names of the missing tools to the main() function
function check_requirements() {
  local requirements=("curl" "jq" "wget")
  local missing=()

  for req in "${requirements[@]}"; do
    if ! command -v "$req" >/dev/null 2>&1; then
      missing+=("$req")
    fi
  done

  main "${missing[@]}"
}

# Prints either a success message
# Or specifies which tool is missing
function main() {
  if [[ $# -eq 0 ]]; then
    echo -e "All Requirements are fulfilled."
    echo -e "Run '\033[1msudo make install\033[0m' to install."
    exit 0;
  else
    echo -e "The following requirements are missing: \033[1m${missing[*]:-}\033[0m"
    echo -e "Please install the above named requirements to use HAL 2023."
    exit 1;
  fi
}

# Kicks off the script
check_requirements
#!/bin/bash

# Checks to see if the required tools mentioned in the array are installed on the system
# Currently only curl, jq and wget are required for HAL 2023
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
# 'glow' is an optional requirement
function main() {
  if [[ $# -eq 0 ]]; then
    echo -e "All requirements are fulfilled."
    echo -e "Run '\033[1msudo make install\033[0m' to install."
    if ! command -v "glow" >/dev/null 2>&1; then
      echo -e "\nOptionally, consider installing 'glow' for better formatted outputs and Markdown rendering"
      echo -e "Source: https://github.com/charmbracelet/glow"
    fi
    exit 0;
  else
    echo -e "The following core requirements are missing: \033[1m${missing[*]:-}\033[0m"
    echo -e "Please install these requirements to use HAL 2023 CLI."
    if ! command -v "glow" >/dev/null 2>&1; then
      echo -e "\nOptionally, consider installing 'glow' for better formatted outputs and Markdown rendering"
      echo -e "Source: https://github.com/charmbracelet/glow"
    fi
    exit 1;
  fi
}

# Kicks off this script
check_requirements
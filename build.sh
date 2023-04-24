#!/bin/bash

# This build scripts installed HAL 2023 CLI
# https://github.com/Brutuski/hal2023-cli

# Used to decorate the error messages etc. used in the script
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RESET='\033[0m'

# Presets
readonly DEST_DIR="/usr/local/bin/"

# Checks if the build script is being run as sudo or not
if [[ $EUID -ne 0 ]]; then
  echo -e "\n${BLUE}HAL 2023${RESET}"
  echo -e "${RED}Error${RESET}: Please run this build script as \033[1msudo\033[0m\n"
  exit 1
fi

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

  requirements "${missing[@]}"
}

# Prints either a success message
# Or specifies which tool is missing
# 'glow' is an optional requirement
function requirements() {
  if [[ $# -eq 0 ]]; then
    echo -e "${GREEN}All requirements are fulfilled.${RESET}"
    if ! command -v "glow" >/dev/null 2>&1; then
      echo -e "\nOptionally, consider installing 'glow' for better formatted outputs and Markdown rendering"
      echo -e "Source: https://github.com/charmbracelet/glow"
    fi
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

echo -e "\nWelcome to ${BLUE}HAL 2023${RESET}"

# Checking for requirements
check_requirements

# Fetches the script from the git repo and copies it into /usr/local/bin/
curl -sS https://raw.githubusercontent.com/Brutuski/hal2023-cli/main/hal2023 -o /usr/local/bin/hal2023

# Sets User's permission to read, write and execute.
# Sets Group's & Others permission to read and execute
chmod 755 /usr/local/bin/hal2023

echo -e "\nInstalled HAL 2023 in $DEST_DIR"
echo -e "Your OpenAI API Key will be stored in a hidden file as plain text in your Home directory."
echo -e "The file name will be ~/.chat-gpt-api"

echo -e "\nWould you like to proceed with that? Type: Yes/No"
read -re store_api

if [ "$store_api" == "Yes" ]  || [ "$store_api" == "yes" ]  || [ "$store_api" == "Y" ]  || [ "$store_api" == "y" ]  || [ "$store_api" == "Yes" ]; then
  read -rp "\nPlease enter your OpenAI API Key: " key_input
  echo "$key_input" > ~/.chat-gpt-api
  echo -e "${GREEN}Installation complete.${RESET}"
  echo -e "You can now start HAL2023 CLI by simply typing ${BLUE}hal2023${RESET} in your terminal."

  else
    echo -e "\nInstallation terminated."
    rm /usr/local/bin/hal2023
    echo -e "Removed hal2023 from $DEST_DIR"
    echo -e "You can proceed to install manually. Check the instructions at https://github.com/Brutuski/hal2023-cli\n"
fi
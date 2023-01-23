#!/bin/bash

## GLOBAL VARIABLES ##

_NAME="HAL 2023 CLI"
_VERSION="v1.0.0"
_SOURCE="https://www.github.com/brutuski/"
_ABOUT="A simple CLI to interract with OpenAI's ChatGPT"

## COLORS ##
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
RESET='\033[0m'

## FORMATTING ##
_ASCII=$(cat << EOF
██╗  ██╗ █████╗ ██╗         ██████╗  ██████╗ ██████╗ ██████╗
██║  ██║██╔══██╗██║         ╚════██╗██╔═████╗╚════██╗╚════██╗
███████║███████║██║          █████╔╝██║██╔██║ █████╔╝ █████╔╝
██╔══██║██╔══██║██║         ██╔═══╝ ████╔╝██║██╔═══╝  ╚═══██╗
██║  ██║██║  ██║███████╗    ███████╗╚██████╔╝███████╗██████╔╝
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚══════╝ ╚═════╝ ╚══════╝╚═════╝
EOF
)

## API RELATED ##
api_key=$(<api_key.txt)

## FUNCTIONS ##

function about(){
    echo -e "Name:    ${WHITE}$_NAME${RESET}"
    echo -e "Version: ${WHITE}$_VERSION${RESET}"
    echo -e "Source:  ${WHITE}$_SOURCE${RESET}"
    echo -e "About:   ${WHITE}$_ABOUT${RESET}"
    exit 0
}

function help(){
    echo "hal2023 -h -> Help"
    echo "hal2023 -v -> About"
    exit 0
}

while getopts "ha" opt; do
    case "$opt" in
        h) help;;
        a) about;;
        *) exit 1;;
    esac
done

printf "\033c"
echo -e "\n${YELLOW}${_ASCII}${RESET}\n"

while true; do
  echo -e "\n\033[2mType exit, quit or :q to exit.\033[0m"
  echo -e "${WHITE}Write a message...${RESET}"
  read input

  if [ "$input" == "exit" ]; then
      echo -e "\nSuccessfuly quit HAL2023\n"
      exit 0
  elif [ "$input" == "quit" ]; then
      echo -e "\nSuccessfuly quit HAL2023\n"
      exit 0
  elif [ "$input" == ":q" ]; then
      echo -e "\nSuccessfuly quit HAL2023\n"
      exit 0
  else

	response=$(curl https://api.openai.com/v1/completions -sS \
  		-H 'Content-Type: application/json' \
  		-H "Authorization: Bearer $api_key" \
  		-d '{
  			"model": "text-davinci-003",
  			"prompt": "'"${input}"'",
  			"max_tokens": 4000,
  			"temperature": 1.0
	}' | jq -r '.choices[].text' | sed '1d')

	echo -e "\n${CYAN}\033[1mChatGPT:\033[0m${RESET}\n${GREEN}${response}${RESET}"
  fi
done

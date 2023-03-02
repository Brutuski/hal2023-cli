#!/bin/bash

#Checks is both curl and jq commands are installed
if command -v curl &> /dev/null && command -v jq &> /dev/null; then
  echo -e "All Requirements satisfied."
  echo -e "Run '\033[1msudo make install\033[0m' to install."
else
  echo -e "At least one command does not exist"
  echo -e "Please make sure both '\033[1mcurl\033[0m' and '\033[1mjq\033[0m' are installed."
fi
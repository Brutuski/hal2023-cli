PREFIX ?= /usr/local/bin
API_KEY ?= $(shell bash -c 'read -p "Enter your OpenAI API key: " api_key; echo $$api_key > ~/.chat-gpt-api')

.PHONY: default
default:
	@echo "\n|================================================================|"
	@echo "|    Run '\033[1msudo make install\033[0m' to install HAL2023                  |"
	@echo "|    Run '\033[1msudo make uninstall\033[0m' to uninstall HAL2023              |"
	@echo "|    Run '\033[1mmake about\033[0m' for more information regarding  HAL2023    |"
	@echo "|================================================================|\n"

.PHONY: install
install:
	@sudo cp -v hal2023 $(PREFIX)/hal2023
	@sudo chmod 755 $(PREFIX)/hal2023
	@echo $(API_KEY)
	@echo "\n|=============================|"
	@echo "|                             |"
	@echo "|    \033[1mInstalled Successfully\033[0m   |"
	@echo "|                             |"
	@echo "|=============================|\n"

.PHONY: uninstall
uninstall:
	@sudo rm -rf -v $(PREFIX)/hal2023
	@sudo rm -rf -v ~/.chat-gpt-api
	@echo "\n|================================|"
	@echo "|                                |"
	@echo "|    \033[1mUninstalled Successfully\033[0m    |"
	@echo "|                                |"
	@echo "|================================|\n"

.PHONY: about
about:
	@echo "Name:    HAL2023 CLI"
	@echo "Version: v1.1.0"
	@echo "Source:  https://www.github.com/brutuski/hal2023-cli"
	@echo "         A simple CLI to interract with OpenAI's ChatGPT"

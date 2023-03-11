<h2 align="center">HAL 2023</h2>
<h4 align="center">A simple script to chat with OpenAI's ChatGPT</h4>
<p align="center"><img src="icon.png" width="150" height="150"><p>
<p align="center">
        <img alt="Script" src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white">
        <img alt="License" src="https://img.shields.io/badge/MIT-LICENSE-1976D2?style=for-the-badge">
</p>

### Index

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Screenshots & Demo](#screenshots)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Uninstall](#uninstall)
- [Options](#options)
- [Changelog](#changelog)
- [Issues](#issues)
- [License](#license)

#### Introduction

Inspired by the infamous `HAL9000` from the cult classic `2001: A Space Odyssey`, this simple CLI enables you to
interact with [OpenAI](https://openai.com)'s [ChatGPT](https://openai.com/blog/chatgpt/).

#### Getting Started

You would need an API key from OpenAI to use this CLI.
Open [this link](https://beta.openai.com/account/api-keys) and generate an API key for yourself.
Upon installation, this CLI stores your personal API key in a file called `.chat-api-key` in your `Home` directory.

This CLI is using the `gpt-3.5-turbo` model by default. You can read more about
it [here](https://platform.openai.com/docs/guides/chat).

To interact with `text-davinci-003` model, simply start your query with `-davinci` followed by a space and the rest of
your query after that.

#### Screenshots

<p align="center"><img src="./Screenshots/screenshot-1.png"><p>
<p align="center"><img src="./Screenshots/screenshot-2.png"><p>

#### Requirements

- [curl](https://curl.se/)
- [jq](https://stedolan.github.io/jq/)

#### Installation

- Clone the repo
  ```sh
  git clone https://github.com/Brutuski/hal2023-cli.git
  ```
- Change directory
   ```sh
   cd hal2023-cli
   ```
- Run the script
  ```sh
  make install
  ```

#### Usage

- Run the command `hal2023`


- To exit simply type `exit` or `quit` or `:q`


- Default model is `gpt-3.5-turbo`. If you would like to interact with the `text-davinci-003` model simply start your
  query with `-davinci`


- More options:
  ```sh
  make check
  make about
  make help
  ```
- A history feature has been added as of `v1.4.1`. The history file is created and maintained
  at `~/.hal2023_history.txt`.

#### Uninstall

```sh
make uninstall
```

Please note: The history file (located at ~/.hal2023_history.txt) is not removed while uninstalling. You can delete it
manually if required.

#### Changelog

```vim
v 1.5.1
```
Changes can be tracked in the [CHANGELOG](https://github.com/Brutuski/hal2023-cli/blob/main/CHANGELOG.md)

#### Issues

Please report any bugs or issues [here](https://github.com/Brutuski/hal2023-cli/issues).

#### License [MIT](https://github.com/Brutuski/hal2023-cli/blob/main/LICENSE)


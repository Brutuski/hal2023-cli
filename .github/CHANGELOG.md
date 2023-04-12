<h2 align="center"> Changelog</h2>
<p align="center"><img src="../image-assets/icon.png" width="150" height="150"><p>
<p align="center">
        <img alt="Script" src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white">
        <img alt="License" src="https://img.shields.io/badge/MIT-LICENSE-1976D2?style=for-the-badge">
        <img alt="License" src="https://img.shields.io/badge/v-1.10.10-D8DEE9?style=for-the-badge">
</p>

#### v1.10.10

_12/04/2023_
- Added `glow` for better formatting.
  - Optional requirement. If `glow` is found on a system, it is used to format OpenAI's response.
- Update README + Minor formatting.
- Updates `check_requirements.sh` to check for `glow`.
- Loading message displayed while waiting for API response.
- Changed logo color to blue.

#### v1.10.9

_11/04/2023_
- Added the following documents in accordance with GitHub's community standards.
    - CONTRIBUTING.md
    - PULL_REQUEST_TEMPLATE.md
    - CODE_OF_CONDUCT.md

- Update README + Minor formatting.
- ISSUES_TEMPLATE.md added after the fact, coz I goofed up  with `git add`

#### v1.10.8

_07/04/2023_
- Added pre-defined prompt to generate single line shell commands.
    - Start your query with `-cmd`

#### v1.9.8

_06/04/2023_
- Text folding added for ChatGPT responses. Text folds and line breaks appear according to the width of the terminal.

#### v1.9.7

_05/04/2023_
- Added pre-defined prompts to make content generation easier. Prompts for the following have been added:
    - Email `-email` or `--e`
    - Articles `-article` or `--a`
- Further comments added
- Minor formatting

#### v1.8.7

_30/03/2023_
- Readline input mode added. Allows the user to navigate the query they are typing using the arrow keys and correct it
  as required
- Minor formatting

#### v1.8.6

_28/03/2023_
- `gpt-4` Model added

#### v1.7.6

_27/03/2023_
- Added comprehensive comments to the script

#### v1.7.5

_27/03/2023_
- Fixed `connection_error` function. It is no longer causing an error message by default.
- In case an error occurs, the specific error message from OpenAI is now displayed.

#### v1.7.4

_27/03/2023_
- Added 'Used Tokens' feature. Only available for text based queries
    - Tokens used are also reflected in the history file.
- Minor reformatting for history file to make it visually easier to read.

#### v1.6.4

_24/03/2023_
- More robust requirements checking.
    - `check_requirements.sh` has been updated to specifically point out which of the required tools is
      missing.

#### v1.6.3

_23/03/2023_
- Image URL shortener added. URL shortened using [tny.im API](https://tny.im/aboutapi.php)

#### v1.6.2

_22/03/2023_
- Better formatting, following this [source](https://google.github.io/styleguide/shellguide.html#s7-naming-conventions).

#### v1.6.1

_20/03/2023_
- Added image generation.
    - Pass arguments with `-image ` followed by the image generation prompt.

#### v1.5.1

_11/03/2023_
- Added option for interacting with `text-davinci-003`
    - Pass arguments with `-davinci ` followed by the query.

#### v1.4.1

_10/03/2023_
- Added a history feature.
    - History file is located at `~/.hal2023_history.txt`

#### v1.3.1

_07/03/2023_
- Changed default model to `gpt-3.5-turbo`

#### v1.2.1

_02/03/2023_
- Added 'Check Requirements' to Makefile

#### v1.2.0

_02/03/2023_
- Added Error Message Handling

#### v1.1.0

_24/01/2023_
- Added a `Makefile` for easy installation.
- Cleaned up the script.

#### v1.0.0

_23/01/2023_
- Initial Release.

#### Versioning System

HAL 2023 CLI uses [Semantic versioning 2.0.0](https://semver.org)

#### License [MIT](https://github.com/Brutuski/hal2023-cli/blob/main/LICENSE)

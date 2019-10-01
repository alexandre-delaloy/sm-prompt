<img src="./docs/logo.png" width="200" />

# sm-theme

<a href="https://github.com/blyndusk/sm-theme/releases/latest"><img src="https://img.shields.io/github/release/blyndusk/sm-theme.svg" alt="sm-theme last release"/></a>
<img src="https://img.shields.io/github/languages/top/blyndusk/sm-theme.svg?color=%23222222" alt="sm-theme top language"/>
<a href="https://github.com/blyndusk/sm-theme/blob/master/LICENSE" alt="sm license"><img src="https://img.shields.io/github/license/blyndusk/sm-theme.svg"/></a>

⛓ **sm-theme** is a **Simplistic** & **Minimalist** theme for **`ZSH`** prompts.

![sm-theme](./docs/sm-theme.gif)

> ⚠️ This theme better fit with **Fira Code** font.

## Install

<!-- ### 1. via Oh-My-Zsh -->

> I assume you have [Oh My Zsh](https://ohmyz.sh/) installed. If not, let's **get it** !

1. Install `sm.zsh-theme` in  `~/.oh-my-zsh` folder:

```bash
# at the root of this repository
> source install.sh --zsh
```

2. Update `ZSH_THEME` theme in your `.zshrc`

```bash
21    # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
22    ZSH_THEME="sm" # probably was ZSH_THEME="robbyrussell (default)
23
24    # Set list of themes to pick from when loading at random
```

<!-- ### 2. Via bash ( available soon ! )

```bash
# at the root of this repository
> source install.sh --bash
``` -->

## Customization

To custom this theme, there is **three** configuration variables:

- `SM_SMILEYS`: enable or disable **smileys**
- `SM_CORNERS`: enable or disable **corners**
- `SM_MULTILINES`: enable or disable **multilines**

By default, **all features are *enabled***.

```bash
# SM_SMILEYS=1 => with smileys, using "[ಠ_ಠ]" & "[･‿･]"
# SM_SMILEYS=0 => without smileys, using "✘" & "✔︎"
SM_SMILEYS=1

# SM_CORNERS=1 => the prompt's corner aren't rounded: "╭"
# SM_CORNERS=0 => the prompt's corner are rounded: "╓"
SM_CORNERS=1

# SM_MULTILINES=1 => the prompt is displayed on 3 lines
# SM_MULTILINES=0 => the prompt is displayed on 2 lines
SM_MULTILINES=1
```

### 1. Smileys

#### With smileys

```bash
07   SM_SMILEYS=1
```

![smileys clean](./docs/sm-smileys-clean.png)
![smileys dirty](./docs/sm-smileys-dirty.png)

#### Without smileys

```bash
07   SM_SMILEYS=0
```

![no smileys clean](./docs/sm-no-smileys-clean.png)
![no smileys dirty](./docs/sm-no-smileys-dirty.png)

### 2. Corners

#### With corners

```bash
11   SM_CORNERS=1
```

![corners](./docs/sm-smileys-clean.png)

#### Without corners ( rounded )

```bash
11   SM_CORNERS=0
```

![no corners](./docs/sm-no-corners.png)

### 3. Multiline

#### With mutliline ( on 3 lines )

```bash
15   SM_MULTILINES=1
```

![corners](./docs/sm-smileys-clean.png)

#### Without mutliline ( on 2 lines )

```bash
15   SM_MULTILINES=0
```

![no corners](./docs/sm-no-multilines.png)

## Curated List

- [oh-my-zsh themes](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes)
- [oh-my-zsh external themes](https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes)
- [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins)

## License

Under [MIT](https://github.com/blyndusk/sm-theme/blob/master/LICENSE) license.
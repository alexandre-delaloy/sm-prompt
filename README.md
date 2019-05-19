# sm-theme

<a href="https://github.com/blyndusk/sm-theme/releases/latest"><img src="https://img.shields.io/github/release/blyndusk/sm-theme.svg?color=orange" alt="sm-theme last release"/></a>
<img src="https://img.shields.io/github/languages/top/blyndusk/sm-theme.svg" alt="sm-theme top language"/>
<a href="https://github.com/blyndusk/sm-theme/blob/master/LICENSE" alt="sm license"><img src="https://img.shields.io/github/license/blyndusk/sm-theme.svg"/></a>

![sm-theme](./docs/sm-theme.png)


⛓ a **Simplist** & **Minimalist** theme for your **favorite** terminal.

## Install

### 1. via Oh-My-Zsh

> I assume you have [Oh My Zsh](https://ohmyz.sh/) installed. If not, let's get it !

1. Install `sm.zsh-theme` in  `~/.oh-my-zsh` folder:

```bash
# at the root of this repository
> source install.sh
```

2. Update `ZSH_THEME` theme in your `.zshrc`

```bash
21    # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
22    ZSH_THEME="sm" # probably was ZSH_THEME="robbyrussell (default)
23
24    # Set list of themes to pick from when loading at random
```

## Custom

> By default, smileys are enabled & there are 3 lines

### 1. Smileys

#### Without smileys

```bash
13    local SM_WITH_SMILEYS=0;
```

![without-smileys-clean](./docs/without-smileys-clean.png)
![without-smileys-dirty](./docs/without-smileys-dirty.png)

#### With smileys

```bash
13    local SM_WITH_SMILEYS=1;
```

![with-smileys-clean](./docs/with-smileys-clean.png)
![with-smileys-clean](./docs/with-smileys-dirty.png)

### 2. Lines

#### With 2 lines

```bash
16    local SM_PROMPT_LINES=2;
```

![2 lines](./docs/2-lines.png)

#### With 3 lines

```bash
16    local SM_PROMPT_LINES=3;
```

![3 lines](./docs/with-smileys-dirty.png)

## Curated List

- [oh-my-zsh themes](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes)
- [oh-my-zsh external themes](https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes)
- [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins)

## License

Under [MIT](https://github.com/blyndusk/sm-theme/blob/master/LICENSE) license.
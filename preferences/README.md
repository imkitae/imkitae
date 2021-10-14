## macOS

### Sysytem Preferences...

#### Dock
- `Size`: smaller
- `Position on screen`: left
- `Show recent application in Docker`: off

- `Automatically hide and show the Dock`: on
```bash
# No delay
defaults write com.apple.Dock autohide-delay -float 0 && killall Dock
# Restore
# defaults delete com.apple.Dock autohide-delay && killall Dock

# No animation
defaults write com.apple.dock autohide-time-modifier -int 0 && killall Dock
# Restore
# defaults delete com.apple.dock autohide-time-modifier && killall Dock
```

#### Keyboard
```bash
# Disabling press-and-hold for special keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
```
- `Key Repeat`: fast
- `Delay Until Repeat`: short
- On `Text` tab
    - `Correct spelling automatically`: off
    - `Capitalize words automatically`: off
    - `Add period with double-space`: off
    - `Touch Bar typing suggestions`: off
    - `Use smart quotes and dashes`: off
- On `Input Sources` tab
    - `Use the 한/영 key to switch to and from ABC`: on

#### Mouse
- `Tracking speed`: faster
- `Scrolling speed`: faster

#### Trackpad
```bash
# Increase `Tracking speed` maximum limit (deault = 3.0)
defaults write -g com.apple.trackpad.scaling -float 10.0
```
- `Tracking speed`: faster
- `Silent clicking`: on

#### Accessibility
- Mouse & Trackpad > Trackpad Options...
    - `Enable dragging`: on, three finger drag

#### Trackpad
- Update `Tracking speed` to max

#### Desktop & Screen Saver
- Screen Saver > `Start after 5 Minutes`

#### Display
- On `Night Shift` tab
    - `Schedule`: Sunset to Sunrise

### Finder > Preferences...

#### Advance
- `Show all filene extensions`: on

### Calendar > Preferences...

#### Accounts
- Google > `Calenders`: on

### Mute some system sounds
```bash
# Disable the startup sound
sudo nvram SystemAudioVolume=%80
# Return to the default
# sudo nvram -d SystemAudioVolume

# Disable the power chime (In fact, this doesn't work..)
defaults write com.apple.PowerChime ChimeOnNoHardware -bool true
killall PowerChime
```


## Chrome
https://www.google.com/chrome/


## 1password
https://1password.com/downloads/mac/


## Slack
https://slack.com/downloads/osx


## Spark
https://sparkmailapp.com/download

#### Create an app password
- [My account > Security & privacy > Create and manage app passwords](https://account.activedirectory.windowsazure.com/AppPasswords.aspx)

#### Add account
- IMAP
    - Username: ${MY_EMAIL_ADDRESS}
    - Password: ${APP_PASSWORD}
    - Server: imap-mail.outlook.com
    - Port: 993
    - Protection: SSL
- SMTP
    - Username: ${MY_EMAIL_ADDRESS}
    - Password: ${APP_PASSWORD}
    - Server: smtp-mail.outlook.com
    - Port: 587
    - Protection: STARTTLS


## HomeBrew
https://brew.sh/


## Git
```bash
brew install git
```

#### Edit ~/.gitignore_global
```bash
*~
.DS_Store
.idea
memo
memo.md
```


#### Register public key
```bash
ssh-keygen
open https://github.com/settings/ssh/new
open https://gitlab.com/profile/keys
```


## FiraCode font
https://github.com/tonsky/FiraCode


## vim ~/.vimrc
```bash
set hlsearch    " Highlight all search results
set smartcase   " Do case insensitive search if uppercase letter included
set incsearch   " Show incremental search results as you type
set number      " Display line number
set noswapfile  " Disable swap file

set list listchars=tab:→-   " Set markers for tabs
set list listchars+=trail:⋄ " Set markers for trailing whitespaces
```

## Oh My Zsh
https://github.com/robbyrussell/oh-my-zsh

#### Install `zsh-autosuggestions` plugin
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### Install `zsh-syntax-highlighting` plugin
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```

#### Update ~/.zshrc
```bash
# Change theme to agnoster
ZSH_THEME="agnoster"

# Remove username@computer from prompt
DEFAULT_USER="$USER"

# Enable some pugins
plugins=(
  aws
  docker
  git
  sudo
  web-search
  zsh-autosuggestions
  zsh-syntax-highlighting
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=23"

# Set timestamp
RPROMPT='%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M:%S}]%{$reset_color%}'

# Define `wifi` cli command
wifi ()
{
    if [ -z "${1}" ]; then
        echo "Usage: wifi [SID]"
    else
        echo -n "${1} Password: "; read -s WIFI_PASSWORD
        echo
        echo "Connecting.."
        networksetup -setairportnetwork en0 ${1} ${WIFI_PASSWORD}
    fi
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
```


## iTerm2
https://www.iterm2.com/

#### Import Profiles
Set `Dynamic Profiles` from preferences/iTerm2
```bash
cp preference/iTerm2/* ~/Library/Application Support/iTerm2/DynamicProfiles/
```


## PHP
```bash
brew install brew-php-switcher
brew-php-switcher 7.2

# Fix tidy-html5 lib error
cd /opt/homebrew/opt/tidy-html5/lib
ln -s libtidy.58.dylib libtidy.5.dylib

# Disable Apache server
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist
```


## Composer
https://getcomposer.org/

#### Install Prestission for install in pararrel
```bash
composer global require hirak/prestissimo
```


## Node
```bash
brew install nvm
nvm install --default ${NODE_VERSION}
npm install -g yarn
```


## Sublime Text
https://www.sublimetext.com/

#### Enable CLI
```bash
# Sublime Text3
ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
```


## Docker for Mac
https://docs.docker.com/docker-for-mac/


## Jetbrains Toolbox
https://www.jetbrains.com/toolbox/app/

#### Remove old versions
- `Keep only the latest version`: on

### PHPStorm

#### Download plugins
- .ignore
- .env files support
- BashSupport
- gfm
- HashiCorp Terrraform / HCL language support
- Material Thema UI

#### Import preferences
- File > Import Settings.. > Select `preferences/PhpStorm` directory

#### Activate the license
- Search `PHPStorm license` from my email


## Sourcetree
https://www.sourcetreeapp.com/

#### Preferences
- `Keep bookmarks closes on startup`: on
- `Confirm before adding / removing files`: off
- `Refresh automatically when files change`: off
- `Check default remotes for updates every N minutes`: off
- `Disable desktop notifications`: off

#### WORKSPACE
- File status view modes
    - Pending files, sorted by path
    - Flat list
    - Fluid staging


## SwitchHosts!
https://github.com/oldj/SwitchHosts


## Postman
https://www.getpostman.com/


## Sequel Pro
https://sequelpro.com/


## mysql-client
```bash
brew install mysql-client
echo 'export PATH="/usr/local/opt/mysql-client/bin:$PATH"' >> ~/.zshrc
```

## terraform
https://www.terraform.io/downloads.html


## aws-cli
```
brew install python3
pip3 install awscli --upgrade --user
echo 'export PATH="$HOME/Library/Python/3.7/bin:$PATH"' >> ~/.zshrc
```

## ecs-cli
```bash
curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-darwin-amd64-latest
chmod +x /usr/local/bin/ecs-cli
```

## jq
```bash
brew install jq
```

## tree
```bash
brew install tree
```

## Amphetamine
https://apps.apple.com/kr/app/amphetamine/id937984704?l=en&mt=12

## Spectacle
https://www.spectacleapp.com

## Clipy
https://github.com/Clipy/Clipy/releases

## Dozer
```bash
brew install --cask dozer
```

## Hammerspoon
https://www.hammerspoon.org/
Copy scripts from preferences/Hammerspoon
```bash
cp -r preference/Hammerspoon/* ~/.hammerspoon/
```

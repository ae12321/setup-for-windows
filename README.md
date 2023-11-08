# README

# alias
```
### .bash_profile

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi



### .bashrc

# for Git
ga() { git add .; }
gcan() { git commit --amend --no-edit; }
glo() { git log --oneline; }
gg() {
    git add .
    git commit -m "commit by bashscript at $(date '+%Y-%m-%d %H:%M:%S')"
}

# for Docker
dcup() { docker compose up -d; }
dcdown() { docker compose down; }
dcdownv() { docker compose down --volumes; }

# for util
open() { explorer .; }
c() { clear; }
```

# custom Git bash prompt
```
%PROGRAMFILES%\Git\etc\profile.d

customize git-prompt.sh

参考
https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60



```
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS=--require-sha

export GOPATH="$HOME/Documents/golang"
export GOROOT="/usr/local/opt/go/libexec"

if (( $+commands[brew] )); then
  fpath=(/usr/local/share/zsh/site-functions $fpath)
fi

if (( $+commands[gcloud] )); then
  local GCPREFIX="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
  path=("$GCPREFIX/path.zsh.inc" $path)
  fpath=("$GCPREFIX/completion.zsh.inc" $fpath)
fi

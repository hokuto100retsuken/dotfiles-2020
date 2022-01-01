# -------------------------------------
# 環境変数
# -------------------------------------
# if [[ ! -n $TMUX ]]; then
#     which tmux && tmux new-session
# fi
# ZSH=$HOME/.oh-my-zsh
# source $ZSH/oh-my-zsh.sh
# plugins=(git vi-mode osx)
# ZSH_THEME="mh"
# wget http://mimosa-pudica.net/src/incr-0.2.zsh

# anyenv 初期設定
eval "$(anyenv init -)"

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# -------------------------------------
# zshのオプション
# -------------------------------------
## 補完機能の強化
autoload -Uz compinit
compinit -u
# 補完候補を ←↓↑→ で選択 (補完候補が色分け表示される)
zstyle ':completion:*:default' menu select=1
# 補完の時に大文字小文字を区別しない (但し、大文字を打った場合は小文字に変換しない)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# カレントディレクトリに候補がない場合のみ cdpath 上のディレクトリを候補
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*' list-colors 'di=;00;38;05;44' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=00;38;05;44' 'cd=00;38;05;44'
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' use-cache true # 補完候補をキャッシュ
zstyle ':completion:*' verbose yes # 詳細な情報

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

setopt APPEND_HISTORY         # .zsh-history を上書きではなく追加
setopt AUTO_CD                # ディレクトリ名だけを入力した時にそこに cd する
setopt AUTO_LIST              # 候補が複数ある時に自動的に一覧を出す
setopt AUTO_MENU              # TAB で順に補完候補を切り替える
setopt AUTO_PARAM_SLASH       # 変数名補完時に、その値がディレクトリ名なら直後にスラッシュも補う
setopt AUTO_PARAM_KEYS        # カッコの対応などを自動的に補完
setopt AUTO_RESUME            # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt CHECK_JOBS             # シェルを抜ける (exit) 時に、zsh: you have runnning jobs と警告を出す
setopt EXTENDED_GLOB          # ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt EXTENDED_HISTORY       # zsh の開始, 終了時刻をヒストリファイルに書き込む
#setopt GLOB_DOTS              # . で開始するファイル名にマッチさせるとき、先頭に明示的に . を指定する必要がなくなる。
setopt HASH_CMDS              # 各コマンドが実行されるときにパスをハッシュに入れる
setopt HIST_EXPIRE_DUPS_FIRST # ヒストリリストに追加されるコマンド行が古いものと同じなら古いものを削除する
setopt HIST_NO_STORE          # history コマンドを history に保存しない
setopt HIST_IGNORE_DUPS       # 直前と同じコマンドをヒストリに追加しない
setopt HIST_REDUCE_BLANKS     # 余分な空白は詰めて記録
setopt HIST_SAVE_NO_DUPS      # ヒストリファイルに書き出すときに、古いコマンドと同じものは無視する
setopt INC_APPEND_HISTORY     # 履歴をインクリメンタルに追加
setopt LIST_TYPES             # 補完候補一覧でファイルの種別をマーク表示
#setopt MARK_DIRS              # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt NUMERIC_GLOB_SORT      # 数字を数値と解釈してソートする
setopt NOBEEP                 # ビープを鳴らさない
setopt NO_FLOW_CONTROL        # disable C-q, C-s
setopt PROMPT_SUBST           # PROMPT 変数に対して変数展開、コマンド置換、算術展開を施す
#setopt RM_STAR_WAIT           # rm * を実行する前に確認
setopt SHARE_HISTORY          # 履歴の共有
setopt AUTOPUSHD              # cd 時に自動で push
setopt PUSHD_IGNORE_DUPS      # 同じディレクトリを pushd しない

setopt AUTO_PUSHD
setopt LIST_PACKED            # 補完候補を詰めて表示
setopt NOLISTBEEP             # 補完表示時にビープ音を鳴らさない
#setopt COMPLETE_ALIASES       # エイリアスを設定したコマンドでも補完機能を使えるようにする -> zの補完が効かなくなるので comment out
setopt TRANSIENT_RPROMPT      # コピペしやすいようにコマンド実行後は右プロンプトを消す。
setopt COMPLETE_IN_WORD       # カーソル位置で補完する。
setopt GLOB_COMPLETE          # globを展開しないで候補の一覧から補完する。
setopt HIST_EXPAND            # 補完時にヒストリを自動的に展開する。
setopt NO_BEEP                # 補完候補がないときなどにビープ音を鳴らさない。
setopt BRACE_CCL              # {a-c} を a b c に展開する機能を使えるようにする
unsetopt IGNORE_EOF
bindkey "^I" menu-complete   # 展開する前に補完候補を出させる(Ctrl-iで補完するようにする)

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# ビープを鳴らさない
setopt nobeep

## 色を使う
setopt prompt_subst

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# 補完
## タブによるファイルの順番切り替えをしない
unsetopt auto_menu

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

# historyを共有する
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list

# -------------------------------------
# パス
# -------------------------------------

# パスの設定
export PATH=/usr/local/opt:/opt/local/bin:/opt/local/sbin:/opt/local/include:/usr/local/opt/openssl/bin/:$PATH

# エディタ
export EDITOR=/usr/local/bin/vim

# vim
export PATH="/usr/local/bin:$PATH"

# ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager

# openssl
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

#packer
export PACKER_ROOT="$HOME/packer"

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
    $HOME/bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $path
)

# -------------------------------------
# プロンプト
# -------------------------------------

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

# begin VCS
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:*" formats "(%s)-[%b]"
zstyle ":vcs_info:*" actionformats "(%s)-[%b|%a]"
zstyle ":vcs_info:(svn|bzr):*" branchformat "%b:r%r"
zstyle ":vcs_info:bzr:*" use-simple true

zstyle ":vcs_info:*" max-exports 6

if is-at-least 4.3.10; then
    zstyle ":vcs_info:git:*" check-for-changes true # commitしていないのをチェック
    zstyle ":vcs_info:git:*" stagedstr "<S>"
    zstyle ":vcs_info:git:*" unstagedstr "<U>"
    zstyle ":vcs_info:git:*" formats "(%b) %c%u"
    zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a] %c%u"
fi

function vcs_prompt_info() {
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && echo -n " %{$fg[yellow]%}$vcs_info_msg_0_%f"
}
# end VCS

PROMPT="[%*] "
PROMPT+="%F{blue}%~%f"
PROMPT+="\$(vcs_prompt_info)
"
PROMPT+="%% "

RPROMPT=""
zstyle ':vcs_info:bzr:*' use-simple true
# -------------------------------------
# エイリアス
# -------------------------------------
# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="egrep -s -I --exclude='*.tar.gz' --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# ls
alias ls="ls -G" # color for darwin
alias l1="ls -1"
alias Grep="grep"

#more
alias more="more -R"

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける

alias history="history -1000"
alias be="bundle exec"
setopt share_history

alias be='nocorrect bundle exec'

alias gitlog='git log | more'

alias gotest='go test $(go list ./... | grep -v /vendor/)'
alias vgotest='vgo test $(go list ./... | grep -v /vendor/)'
alias glint='golint ./... | grep -v vendor'
alias tk='tmux kill-session'
alias cn='terminal-notifier -message "done command"'

# alias vi="reattach-to-user-namespace /usr/local/bin/vim"
# alias vim="reattach-to-user-namespace /usr/local/bin/vim"
# alias view="reattach-to-user-namespace view"
# alias tig="reattach-to-user-namespace tig"
alias ssh='TERM=xterm ssh'

# -------------------------------------
# キーバインド
# -------------------------------------

bindkey -e
bindkey "^R" history-incremental-search-backward

# Peco
if [ `which peco >/dev/null 2>&1 ; echo $?` -eq 0 ]; then
  bindkey '^s' peco-src
  bindkey '^b' peco-branch
  bindkey '^h' peco-ssh
  bindkey '^te' peco-docker-login
  bindkey '^tl' peco-docker-log
  bindkey '^td' peco-docker-delete
  bindkey '^kn'  peco-kube-namespace
  bindkey '^ke'  peco-kube-exec
  bindkey '^kl'  peco-kube-logs
  bindkey '^kd'  peco-kube-delete-pods
  bindkey '^ks'  peco-kube-describe-pods
  bindkey '^kc'  peco-kube-context
fi

# -------------------------------------
# その他
# -------------------------------------

# iTerm2のタブ名を変更する
function title {
    echo -ne "\033]0;"$*"\007"
}

function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src


function peco-branch() {
    # commiterdate:relativeを commiterdate:localに変更すると普通の時刻表示
    local selected_line="$(git for-each-ref --format='%(refname:short) | %(committerdate:relative) | %(committername) | %(subject)' --sort=-committerdate refs/heads refs/remotes \
        | column -t -s '|' \
        | grep -v 'origin' \
        | peco \
        | head -n 1 \
        | awk '{print $1}')"
    if [ -n "$selected_line" ]; then
        BUFFER="git checkout ${selected_line}"
        CURSOR=$#BUFFER
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-branch

function peco-keypass() {
    if [ -e ~/src/git.pepabo.com/fukuoka-admin/files-secret/keepass/ver1.x/fukuoka.txt ]; then
        local selected="$(sed -e 's/\(.*\), \(.*\), \(.*\)$/\1, \2/g' ~/src/git.pepabo.com/fukuoka-admin/files-secret/keepass/ver1.x/fukuoka.txt | \
            peco --query "$LBUFFER")"
        local -a array
        local line

        if [ -n "$selected" ]; then
            selected="$(grep "^$selected" ~/src/git.pepabo.com/fukuoka-admin/files-secret/keepass/ver1.x/fukuoka.txt)"
            if [ -x "`which pbcopy`" ]; then
                array=("${(s/, /)selected}")

                if [ ${#array[*]} -gt 1 ]; then
                    local host="$array[1]"
                    local user="$array[2]"
                    local password="$array[3]"

                    echo "${password}" | pbcopy

                    local mysql_user=`echo ${(s/mysql-/)user}`
                    echo oiPKVemzTUgxMGy2Xw1ZdiyjhmSTevLW
                    if [ $user = $mysql_user ]; then
                        line="ssh ${user}@${host}"
                    else
                        line="mysql -u${mysql_user} -h${host} -p "
                    fi
                fi
            fi

            if ! [ -n "$line" ]; then
                line="$selected"
            fi
            BUFFER="${line}"
            CURSOR=$#BUFFER
        fi

        zle clear-screen
    fi
}
zle -N peco-keypass
bindkey '^l' peco-keypass

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# gitのリポジトリを開く
function open-git-remote() {
  git rev-parse --git-dir >/dev/null 2>&1
  if [[ $? == 0 ]]; then
    git config --get remote.origin.url | sed -e 's#ssh://git@#https://#g' -e 's#git@#https://#g' -e 's#github.com:#github.com/#g' | xargs open
  else
    echo ".git not found.\n"
  fi
}

zle -N open-git-remote
bindkey '^o' open-git-remote


_rake_does_task_list_need_generating () {
  if [[ ! -f .rake_tasks ]]; then return 0;
  else
    return $([[ Rakefile -nt .rake_tasks ]])
  fi
}

_rake () {
  if [[ -f Rakefile ]]; then
    if _rake_does_task_list_need_generating; then
      #echo "\nGenerating .rake_tasks..." >&2
      bin/rake --silent --tasks | cut -d " " -f 2 >| .rake_tasks &
    fi
    compadd $(<.rake_tasks)
  fi
}

compdef _rake rake

# cdr
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 200
zstyle ':chpwd:*' recent-dirs-default true

# brew install ctags
alias ctags="`brew --prefix`/bin/ctags" 

# added by travis gem
[ -f /Users/pyama/.travis/travis.sh ] && source /Users/pyama/.travis/travis.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

# # k8s
# alias k='kubectl-cluster-caution'
# source <(k completion zsh | gsed -e 's/__start_kubectl kubectl/__start_kubectl kubectl-cluster-caution/g')
# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# PS1='$(kube_ps1)'$PS1

# peco
function peco-ssh() {
    local host_ip=$(cat ~/hosts| peco --query "$LBUFFER")
    if [ -n "$host_ip" ]; then
      BUFFER="ssh $(echo $host_ip | cut -d' ' -f 1)"
      CURSOR=$#BUFFER
      zle accept-line
    fi
    zle clear-screen
}
zle -N peco-ssh

# function peco-docker-login() {
#     local cid=$(docker ps |grep -v 'CONTAINER ID' | peco --query "$LBUFFER"| cut -d ' ' -f1)
#     if [ -n "$cid" ]; then
#       BUFFER="docker exec -it $(echo $cid) /bin/bash"
#       CURSOR=$#BUFFER
#       zle accept-line
#     fi
#     zle clear-screen
# }
# zle -N peco-docker-login

# function peco-docker-log() {
#     local cid=$(docker ps |grep -v 'CONTAINER ID' | peco --query "$LBUFFER"| cut -d ' ' -f1)
#     if [ -n "$cid" ]; then
#       BUFFER="docker logs -f $(echo $cid)"
#       CURSOR=$#BUFFER
#       zle accept-line
#     fi
#     zle clear-screen
# }
# zle -N peco-docker-log
# function peco-docker-delete() {
#     local cid=$(docker ps |grep -v 'CONTAINER ID' | peco --query "$LBUFFER"| cut -d ' ' -f1)
#     if [ -n "$cid" ]; then
#       BUFFER="docker rm -f $(echo $cid)"
#       CURSOR=$#BUFFER
#       zle accept-line
#     fi
#     zle clear-screen
# }
# zle -N peco-docker-delete

# function peco-kube-namespace() {
#     local cid=$(kubectl get namespace |grep -v 'NAME' | peco --query "$LBUFFER"| cut -d ' ' -f1)
#     if [ -n "$cid" ]; then
#       BUFFER="kubectl config set-context $(kubectl config current-context) --namespace=$(echo $cid)"
#       CURSOR=$#BUFFER
#       zle accept-line
#     fi
#     zle clear-screen
# }
# zle -N peco-kube-namespace
# function peco-kube-context() {
#     local cid=$(kubectx | peco --query "$LBUFFER"| cut -d ' ' -f1)
#     if [ -n "$cid" ]; then
#       BUFFER="kubectx $cid"
#       CURSOR=$#BUFFER
#       zle accept-line
#     fi
#     zle clear-screen
# }
# zle -N peco-kube-context

# function peco-kube-exec() {
#     local cid=$(kubectl get pods |grep -v 'NAME' | peco --query "$LBUFFER"| cut -d ' ' -f1)
#     if [ -n "$cid" ]; then
#       BUFFER="kubectl exec -it $(echo $cid) /bin/bash"
#       CURSOR=$#BUFFER
#       zle accept-line
#     fi
#     zle clear-screen
# }
# zle -N peco-kube-exec

# function peco-kube-logs() {
#     local cid=$(kubectl get pods |grep -v 'NAME' | peco --query "$LBUFFER"| cut -d ' ' -f1)
#     if [ -n "$cid" ]; then
#       BUFFER="kubectl logs $(echo $cid)"
#       CURSOR=$#BUFFER
#       zle accept-line
#     fi
#     zle clear-screen
# }
# zle -N peco-kube-logs

# function peco-kube-delete-pods() {
#     local cid=$(kubectl get pods |grep -v 'NAME' | peco --query "$LBUFFER"| cut -d ' ' -f1)
#     if [ -n "$cid" ]; then
#       BUFFER="kubectl delete pods $(echo $cid)"
#       CURSOR=$#BUFFER
#       zle accept-line
#     fi
#     zle clear-screen
# }
# zle -N peco-kube-delete-pods

# function peco-kube-describe-pods() {
#     local cid=$(kubectl get pods |grep -v 'NAME' | peco --query "$LBUFFER"| cut -d ' ' -f1)
#     if [ -n "$cid" ]; then
#       BUFFER="kubectl describe pods $(echo $cid)"
#       CURSOR=$#BUFFER
#       zle accept-line
#     fi
#     zle clear-screen
# }
# zle -N peco-kube-describe-pods

# export PATH="/usr/local/opt/openssl/bin:$PATH"
# export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
# export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# function ssh() { # tmux起動時
#     if [[ -n $(printenv TMUX) ]] ; then
#         # 現在のペインIDを退避
#         local pane_id=$(tmux display -p '#{pane_id}')

#         hostAddr=notfound
#         for arg in $@
#         do
#           (echo $arg | grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$" > /dev/null) && hostAddr=$arg
#         done
#         name=$(grep $hostAddr  ~/hosts | awk '{ print $2 }')
#         if [[ `echo $name | grep 'staging'` ]] ; then
#             tmux select-pane -t $pane_id -P 'default'
#         elif [[ `echo $name | grep 'dev'` ]] ; then
#             tmux select-pane -t $pane_id -P 'default'
#         else
#             # prod
#             tmux select-pane -P 'bg=colour52,fg=white'
#         fi

#         # 通常通りssh続行
#         command ssh $@

#         # デフォルトの背景色に戻す
#         tmux select-pane -t $pane_id -P 'default'
#     fi
# }

# function nodes() {
#   ls nodes |grep -v staging | xargs -n1 -I@ cat nodes/@ | jq -c -r '[.normal.knife_zero.host, .name] | @csv' | sed -e 's/"//g' -e 's/,/ /g' |grep -v 10.51.78
# }

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/pyama/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pyama/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/pyama/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pyama/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# wsl brew設定
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)


#!/usr/bin/env bash
set -ue

link_to_homedir() {
  if [ ! -d "$HOME/.dotbackup" ];then
     echo "$HOME/.dotbackup not found. Auto Make it"
     mkdir "$HOME/.dotbackup"
  fi
  
  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})

  if [[ "$HOME" != "$dotdir" ]];then
    for f in $script_dir/.??*; do
    echo $f
      [[ `basename $f` == ".git" ]] && continue
      if [[ -L "$HOME/`basename $f`" ]];then
         rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
         mv "$HOME/`basename $f`" "$HOME/.dotbackup"
      fi
       ln -snf $f $HOME
    done
  else
     echo "same install src dest"
  fi
}

link_to_homedir
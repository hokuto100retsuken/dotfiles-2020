brew install git

brew install ghq 

cat <<EOF > ~/.gitconfig
[ghq]
vcs = git
root = ~/src
EOF

echo "gitfile"
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /home/jlk/.cargo/bin
  /home/jlk/.local/bin
  /home/jlk/.node_modules/bin
  $path
)

# add dir with some completions to fpath
fpath=(
  /home/jlk/.zsh-completions
  $fpath
)


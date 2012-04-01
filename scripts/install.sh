

# add the line that includes .vim/vimrc (this lib's version) from ~/.vimrc (the default vim file)

LINE="source ~/.vim/vimrc"
FILE=$HOME/.vimrc

touch "$FILE"
if ! grep -Fxq "$LINE" "$FILE"
then
  echo "$LINE" >> "$FILE"
fi





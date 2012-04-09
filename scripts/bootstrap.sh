function die()
{
    echo "${@}"
    exit 1
}

# Add .pre-adegan to any existing Vim file in the home directory
PREV=$HOME/.vim
if [[ ( -e $PREV ) || ( -h $PREV ) ]]; then
  rm -rf "${PREV}.pre-adegan"
  mv "${PREV}" "${PREV}.pre-adegan" || die "Could not move ${PREV} to ${PREV}.pre-adegan"
  echo "${PREV} has been renamed to ${PREV}.pre-adegan"
fi

# move .vimrc to .vimrc.pre-adegan if it's a symlink
PREV=$HOME/.vimrc
if [ -L "$PREV" ]; then
  rm -rf "${PREV}.pre-adegan"
  mv "${PREV}" "${PREV}.pre-adegan" || die "Could not move ${PREV} to ${PREV}.pre-adegan"
  echo "${PREV} has been renamed to ${PREV}.pre-adegan"
end

# Clone adegan into .vim
git clone https://github.com/kikito/adegan.git $HOME/.vim \
  || die "Could not clone the repository to ${HOME}/.vim"

# Run install.sh inside .vim
cd $HOME/.vim || die "Could not go into the ${HOME}/.vim"
bash scripts/install.sh || die "install.sh failed."

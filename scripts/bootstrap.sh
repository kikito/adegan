function die()
{
    echo "${@}"
    exit 1
}

# Add .back to any existing Vim file in the home directory
PREV=$HOME/.vim
if [[ ( -e $PREV ) || ( -h $PREV ) ]]; then
  echo "${PREV} has been renamed to ${PREV}.bak"
  mv "${PREV}" "${PREV}.bak" || die "Could not move ${PREV} to ${PREV}.bak"
fi

# Clone adegan into .vim
git clone https://kikito@github.com/kikito/adegan.git $HOME/.vim \
  || die "Could not clone the repository to ${HOME}/.vim"

# Run install.sh inside .vim
cd $HOME/.vim || die "Could not go into the ${HOME}/.vim"
scripts/install.sh || die "install.sh failed."

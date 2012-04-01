
echo 'updating main .vim repo ...'
cd $HOME/.vim
git fetch

echo 'updating plugins ...'
git submodule init
git submodule update
git submodule foreach git pull

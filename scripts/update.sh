
echo 'Updating main .vim repo ...'
cd $HOME/.vim
git pull > /dev/null

echo 'Updating plugins ...'
git submodule sync > /dev/null
git submodule update --init > /dev/null

echo 'Finished updating agedan'

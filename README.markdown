# Adegan

> They're Adegan crystals—precious and hard to find. Jedi use them to make the best lightsabers.
>
> -- <cite>Andur Sunrider</cite>

This is my custom vim installation. I've tested it over Ubuntu only.

## Installation

You need certain prerequisites. Make sure you have git, bash, grep and curl installed in your machine before attempting to install this.

    sudo apt-get install git bash grep curl

Once the prerequisites are satisfied, install Adegan by executing this command:

    curl -Lo- https://raw.github.com/kikito/adegan/master/scripts/bootstrap.sh | bash

## Credits

I've included lots of plugins using pathogen: http://github.com/tpope/vim-pathogen

I'm using a good amount of pathogen plugins on this distribution; you may find the complete list inside the /bundle/ directory.

Some of the scripts inside the /scripts/ directory, as well as lots of settins inside the vimrc file, are inspired by janus:

https://github.com/carlhuda/janus

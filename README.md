# How I set up my dotfiles

This repo contains my personal dotfiles. To set these up on a new machine, I currently
create symbolic links from the files in this repo to the appropriate locations in my home directory.

E.g. to link my `.vimrc` file, I would run:

```bash
ln -s ~/path/to/my-dotfiles/.vimrc ~/.vimrc
```

However, this is only one way to manage dotfiles. There are several tools available that can help automate
the process of setting up dotfiles.
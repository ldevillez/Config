local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Auto completion
  use {
    'Shougo/deoplete.nvim',
    run = ':UpdateRemotePlugins',
    requires = {{'deoplete-plugins/deoplete-jedi'}}
  }

  -- Status bar
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

  -- auto adding matching parenthesis
  use "jiangmiao/auto-pairs"

  -- Comment
  use "scrooloose/nerdcommenter"

  -- Code jump
  use "davidhalter/jedi-vim"

  -- NerdTree
  use {
    "scrooloose/nerdtree",
    requires={
      {"Xuyuanp/nerdtree-git-plugin"},
      {"ryanoasis/vim-devicons"},
      {"tiagofumo/vim-nerdtree-syntax-highlight"},
      {"PhilRunninger/nerdtree-buffer-ops"}
    }
  }

  -- Latex
  use "lervag/vimtex"

  -- Snipets
  use {
    "SirVer/ultisnips",
    requires={
      "honza/vim-snippets"
    }
  }

  -- Linting and syntax checking
  use "dense-analysis/ale"


  -- Code folding
  -- use "tmhedberg/SimpylFold"

  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


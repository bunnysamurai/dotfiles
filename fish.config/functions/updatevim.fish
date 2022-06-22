function updatevim
    set -lx SHELL (which sh)
    if type -q vim
        set_color blue; echo "Updating vim plugins"; set_color normal
        vim +PlugInstall! +PlugUpdate! +PlugClean +qall
    end
    if type -q nvim
        set_color blue; echo "Updating nvim plugins"; set_color normal
        nvim +PlugInstall! +PlugUpdate! +PlugClean +qall
    end
end

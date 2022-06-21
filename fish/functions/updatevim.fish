function updatevim
    set -lx SHELL (which sh)
    vim +PlugInstall! +PlugUpdate! +PlugClean +qall
end


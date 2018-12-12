function c --wraps=(cd $PROJECTS)
  if count $argv > /dev/null
    cd $PROJECTS/$argv
  else
    cd $PROJECTS
  end
end
complete --command c --arguments '(__fish_complete_directories $PROJECTS/)'

#function c --wraps=(cd ~/projects)
  #cd ~/projects/$argv
#end
#complete --command c --arguments '(__fish_complete_directories ~/projects/)'

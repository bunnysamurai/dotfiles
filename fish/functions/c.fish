function c --wraps=(cd $PROJECTS)
  cd "$PROJECTS/$argv"
end
complete --command c --arguments '(__fish_complete_directories $PROJECTS/)'

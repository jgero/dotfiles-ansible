# STARTUP SCRIPT ------------------------------------------------------------------------------

# go to git root if in a git repo
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  cd $(git rev-parse --show-toplevel)
fi;


#!/bin/bash

if [ -z "$(which git)" ]; then
  EXIT_CODE=1
  return
fi

if [ $PLATFORM == 'OSX' ]; then
  # git auto complete
  source $CELLAR_PATH/git/2.1.1/etc/bash_completion.d/git-completion.bash

  # git prompt
  source $CELLAR_PATH/git/2.1.1/etc/bash_completion.d/git-prompt.sh
fi

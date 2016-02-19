:" If +eval feature supported quit here, No create 'noeval' file.
:" Otherwise create 'noeval' file.
:if 1 | q! | endif
:w! noeval
:qa!

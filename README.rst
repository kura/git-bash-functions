git-bash-functions
==================

This file provides 5 functions and 4 prompt colours, plus a reset colour.

.. image:: example.png
    :alt: Example $PS1


Installation
------------

Copy bash.d to $HOME

.. code:: bash

    cp -R bash.d $HOME

Add the following lines to the $HOME/.bashrc, you'll want them near the top,
usually after `[ -z "$PS1" ] && return`

.. code::

    for f in $HOME/bash.d/*
    do
        source $f
    done


Functions
---------

_git_is_instance
~~~~~~~~~~~~~~~~

Returns `true` if we're inside a git repository, `false` if not.

_git_parse_branch
~~~~~~~~~~~~~~~~~

Returns the current git branch name.

_git_new
~~~~~~~~

Returns an `A` if there are any new, unstaged files.

_git_staged
~~~~~~~~~~~

Retuns an `S` if there are any staged files that need a commit.

_git_modified
~~~~~~~~~~~~~

Returns an `M` if you have modified any files git is already aware of but need
to be staged.

Usage inside $PS1
-----------------

.. code:: bash

    PS1='\u@\h:$PWD $(_git_parse_branch)'

This should return something similar too

.. code::

    kura@hel:/home/kura/git-bash-functions master

See below for how to add colour in to the prompt.


Colours
-------

_git_branch_colour
~~~~~~~~~~~~~~~~~~
Bold + Purple

_git_unadded_colour
~~~~~~~~~~~~~~~~~~~
Bold + Red

_git_staged_colour
~~~~~~~~~~~~~~~~~~
Bold + Green

_git_modified_colour
~~~~~~~~~~~~~~~~~~~~
Bold + Blue

_git_reset_color
~~~~~~~~~~~~~~~~

Reset colour palette


Example colour usage
--------------------

.. code:: bash

    PS1='\u@\h:$PWD $_git_branch_colour$(_git_parse_branch)$_git_reset_color'

How I use these functions
-------------------------

.. code:: bash

    PS1='\u@\h:$PWD $_git_branch_colour$(_git_parse_branch)$_git_reset_color'

Below is an example of my $PS1 with colours and all functions enabled.

.. image:: example.png
    :alt: Example $PS1
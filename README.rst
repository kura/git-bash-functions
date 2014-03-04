git-bash-functions
==================

This file provides 5 functions and 4 prompt colours, plus a reset colour.

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

Returns an `S` if you have modified any files git is already aware of but need
to be staged.

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

    echo $_git_branch_colour$(git_branch)$_git_reset_colour
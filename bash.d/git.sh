#!/bin/bash

# (The MIT License)
#
# Copyright (c) 2014 Kura
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

_git_branch_colour="\[\033[01;35m\]"
_git_unadded_colour="\[\033[01;31m\]"
_git_staged_colour="\[\033[01;32m\]"
_git_modified_colour="\[\033[01;34m\]"
_git_reset_color="\[\033[00m\]"

function _git_is_instance {
    if [[ "git rev-parse --is-inside-work-tree &> /dev/null)" != 'true' ]] && git rev-parse --quiet --verify HEAD &> /dev/null
    then
        return 0
    fi
    return 1
}

function _git_parse_branch {
    if _git_is_instance
    then
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
    fi
}

function _git_new {
    if _git_is_instance
    then
        if [[ $(git ls-files --other --exclude-standard 2> /dev/null) ]]
        then
            echo "N"
        fi
    fi
}

function _git_staged {
    if _git_is_instance
    then
        git diff-index --cached --quiet --ignore-submodules HEAD 2> /dev/null
        (( $? && $? != 128 )) && echo "S"
    fi
}

function _git_modified {
    if _git_is_instance
    then
        git diff --no-ext-diff --ignore-submodules --quiet --exit-code || echo "M"
    fi
}
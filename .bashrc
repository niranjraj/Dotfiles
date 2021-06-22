#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

green=$(tput setaf 051 );
yellow=$(tput setaf 214 );
red=$(tput setaf 161 );
purple=$(tput setaf 183 );
reset=$(tput sgr0 );
bold=$(tput bold);

function git_color {
	  local git_status="$(git status 2> /dev/null)"

	    if [[ $git_status =~ "working directory clean" ]]; then
	          echo -e $green
	    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
		     echo -e $yellow
	    elif [[ $git_status =~ "nothing to commit" ]]; then
		    echo -e $green
	    elif [[ $git_status =~ "Changes not staged for commit" ]]; then
		    echo -e $red
	    else
	            echo -e $red
	    fi

    }

function git_branch {
 	 local git_status="$(git status 2> /dev/null)"
 	 local on_branch="On branch ([^${IFS}]*)"
	 local on_commit="HEAD detached at ([^${IFS}]*)"

  	if [[ $git_status =~ $on_branch ]]; then
	    local branch=${BASH_REMATCH[1]}
	    echo "($branch)"
        elif [[ $git_status =~ $on_commit ]]; then
	     local commit=${BASH_REMATCH[1]}
	     echo "($commit)"
	fi
	 }

alias ls='ls --color=auto'
PS1="\[${bold}\]\n";
PS1+="\[\$(git_color)\]\$(git_branch)";
PS1+="\[${purple}\] $ \[${reset}\] "

export PATH="$PATH:/usr/local/bin/python"

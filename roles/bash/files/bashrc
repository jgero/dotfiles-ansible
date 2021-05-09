# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/Android/flutter/bin" ]]
then
    PATH="$PATH:$HOME/Android/flutter/bin"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
# User specific autocompletion
if [ -d ~/.bash_completion.d ]; then
	for rc in ~/.bash_completion.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

##################################### AUTO GENERATED SOMEHOW ######################################

alias luamake=/home/jgero/.cache/nvim/nlua/sumneko_lua/lua-language-server/3rd/luamake/compile/luamake

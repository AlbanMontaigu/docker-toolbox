
# ============================================================
# Misc custom commands
# ============================================================

# Want a good editor by default
alias vi="vim"

# To show and execute commands in a didactic mode
show_exec() {
    echo "[CMD] $@"
    eval "$@"
}
alias sx="show_exec"

# Show dir facility
alias ls='ls -p --color=tty'
alias ll='ls -al'

# Human readable
alias df='df -h'
alias du='du -h'

# Avoid errors... use -f to skip confirmation.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Tool to test ports
test_port(){
    if [ $# -eq 2 ]; then
        nc -z -v -w5 $1 $2
    else
        echo "Usage: test-port HOST PORT"
    fi
}
alias test-port="test_port"

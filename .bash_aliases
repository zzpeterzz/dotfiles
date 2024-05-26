alias sad="ssh-add ~/.ssh/id_ed25519_elgentos"

# JeroenBoersma/docker-compose-development voor elgentos
export PATH=/home/peter/development/bin:${PATH};
alias cdw="cd /home/peter/development/workspace";

# ls
alias la='ls -a'

# navigation
alias home='cd ~'

# system operations
alias shutdown='sudo shutdown now'
alias restart='sudo restart now'
alias bye='dev down && shutdown'

repo() {
    repo=$(git remote -v | awk '{print $2}' | uniq | head -n1 | sed -e 's#\(git@\|\.git\)##g' -e 's#:#/#' -e 's#^#https://#');

    if [ -n "${repo}" ]; then
        echo "${repo}";
        # open "${repo}";
        return $?;
    fi

    return 1;
}

# code specific
alias c="code"

# magento
alias cc="cache-clean --watch"

bm() {
    if [ "$1" = "up" ]; then
        command bin/magento setup:upgrade
    elif [ "$1" = "cc" ]; then
        command bin/magento cache:cle
    elif [ "$1" = "i:re" ]; then
        command bin/magento index:reindex
    elif [ "$1" = "i" ]; then
        command bin/magento index:reindex
    else
        command bin/magento "$@"
    fi
}
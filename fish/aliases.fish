#Basic
alias l la
function lsd -d 'List only directories (in the current dir)'
    la -d */ | sed -Ee 's,/+$,,'
end
alias sf 'source ~/.config/fish/config.fish'
alias fishconfig "nvim ~/.config/fish/config.fish"
alias aliases "nvim ~/.config/fish/aliases.fish"
alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias cx 'chmod +x'
alias c-x 'chmod -x'

#Sudo
alias eject "sudo eject"
alias ifconfig "sudo ifconfig"
alias airodump-ng "sudo airodump-ng"
alias airmon-ng "sudo airmon-ng"
alias setoolkit "sudo setoolkit"
alias sqlmap "workon sqlmap && python ~/kali/sqlmap-dev/sqlmap.py"
alias wireshark "sudo /Applications/Wireshark.app/Contents/MacOS/Wireshark"
function login_item -d "Usage: silence [-h, --hidden] <application_path>"
    set hidden false

    for option in $argv
        switch "$option"
            case -h --hidden
                set hidden true
            case \*.app
                set name (basename $option .app)
                osascript -e 'tell application "System Events" to make login item at end with properties {path:"'$option'", hidden:'$hidden', name:"'$name'"}'
                return
            case \*
                echo "Usage: login_item [-h, --hidden] <application_path>"
                return 1
        end
    end
end

#VIM
alias vim nvim
function v
	if test (count $argv) -ge 1
		nvim "$argv"
	else
		nvim .
    end
end
function vimff
    nvim (ffind -tf $argv)
end
alias vimconfig "nvim ~/.vimrc"

#VSCODE insiders
function vs
	if test (count $argv) -eq 1
		code-insiders "$argv"
	else
		code-insiders .
    end
end

#Work env
alias g git
function da -d "Allow or disallow .envrc after printing it."
    echo ------------------------------------------------
    cat .envrc
    echo ------------------------------------------------
    echo "To allow, hit Return."
    read answer
    direnv allow
end

#Docker/Podman
# function docker
#     if test "$argv[1]" = "compose"
#         if test (count $argv) -gt 1
#             podman-compose "$argv[2..-1]"
#         else
#             podman-compose
#         end
#     else
#         podman "$argv"
#     end
# end
# alias d podman
alias p podman
# alias dc podman-compose
# alias docker-compose podman-compose
alias dc docker-compose
alias d docker

#AWS
alias awsl "aws ssm start-session --target"
alias awsp "aws_profiles"

#K8S
alias k "kubectl"
alias kc "kubie ctx"

#GCP
alias gc "gcloud"
alias gcc "gcloud container"
alias gccc "gcloud container clusters"

alias tf "terraform"
alias o "open"

#Code
alias parquet "parquet-tools"
alias c cargo
alias python python3
alias py python3
alias pyclean "rm -rf **/*.pyc"
alias sourcelist "v /etc/apt/sources.list"
alias hosts "nvim /etc/hosts"

. "$HOME/.config/fish/aliases-work.fish"

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

#VIM
alias vim nvim
function v
	if test (count $argv) -eq 1
		nvim "$argv[1]"
	else
		nvim .
    end
end
function vimff
    nvim (ffind -tf $argv)
end
alias vimconfig "nvim ~/.vimrc"

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
alias k "kubectl"
alias d docker
alias dc docker-compose
alias awsl "aws ssm start-session --target"
alias awsp "aws_profiles"
alias tf "terraform"
alias o "open"

#Platform
alias cc "clickhouse-client"
alias ccpro "clickhouse-client -h clickhouse.production.virtusize.jp --port 9000"
alias ccpro1 "clickhouse-client -h ec2-54-250-36-125.ap-northeast-1.compute.amazonaws.com --port 9000"
alias ccpro2 "clickhouse-client -h ec2-18-183-165-44.ap-northeast-1.compute.amazonaws.com --port 9000"
alias ccstg "clickhouse-client -h clickhouse.staging.virtusize.jp --port 9000"

#Code
alias parquet "parquet-tools"
alias python python3
alias py python3
alias pyclean "rm -rf **/*.pyc"
alias sourcelist "v /etc/apt/sources.list"
alias hosts "nvim /etc/hosts"

# ZSH Theme
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%B⛩  [whereis%n.today]%{$reset_color%} %2~ $(git_prompt_info)%{$reset_color%}%B$%b '
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%B‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

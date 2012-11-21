function _git_prompt() {
  local git_status="`git status -unormal 2>&1`"
  if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
    if [[ "$git_status" =~ nothing\ to\ commit ]]; then
      local ansi=42
    elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
      local ansi=43
    else
      local ansi=41
    fi
    if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
      branch=${BASH_REMATCH[1]}
    else
      # Detached HEAD. (branch=HEAD is a faster alternative.)
      branch="(`git describe --all --contain --abbrev=4 HEAD 2> /dev/null || echo HEAD`)"
    fi
    echo -n '\[\033[0;37;'"$ansi"';1m\]'"(git-branch: $branch)"'\[\033[0m\]'
  fi
}

function _prompt_command() {
  PS1='\n\w '"`_git_prompt`"'\n\u@\h$ '
}
PROMPT_COMMAND=_prompt_command

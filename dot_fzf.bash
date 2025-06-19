if command -v fzf >/dev/null 2>&1
then
    eval "$(fzf --bash)"
fi

export FZF_COMPLETION_TRIGGER='--'
export FZF_DEFAULT_OPTS="--tmux 80% --color=bg+:0,border:0,spinner:4,hl:8,header:8,info:4,pointer:4,marker:4,prompt:4,hl+:4"
export FZF_CTRL_T_OPTS="
  $FZF_DEFAULT_OPTS
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_ALT_C_OPTS="
  $FZF_DEFAULT_OPTS
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
_fzf_setup_completion path rg git kubectl
_fzf_setup_completion dir tree br
# option-c to `cd autocomplete`
bind -m emacs-standard '"ç": " \C-b\C-k \C-u`__fzf_cd__`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'
bind -m vi-command '"ç": "\C-z\ec\C-z"'
bind -m vi-insert '"ç": "\C-z\ec\C-z"'
# TODO: bind ^F to copy of ^T but with `rg` as in ~/bin/rfv
# ^g git autocomplete for commits, branches, hashes

[ -f ~/bin/fzf-git.sh ] && source ~/bin/fzf-git.sh

command -v kubectl >/dev/null 2>&1 && { 
	source <(kubectl completion bash | sed 's#"${requestComp}" 2>/dev/null#"${requestComp}" 2>/dev/null | head -n -1 | fzf  --multi=0 #g')
}

pods() {
  command='kubectl get pods --all-namespaces' fzf \
    --info=inline --layout=reverse --header-lines=1 \
    --prompt "$(kubectl config current-context | sed 's/-context$//')> " \
    --header $'╱ Enter (kubectl exec) ╱ CTRL-O (open log in editor) ╱ CTRL-R (reload) ╱\n\n' \
    --bind 'start:reload:$command' \
    --bind 'ctrl-r:reload:$command' \
    --bind 'ctrl-/:change-preview-window(80%,border-bottom|hidden|)' \
    --bind 'enter:execute:kubectl exec -it --namespace {1} {2} -- bash' \
    --bind 'ctrl-o:execute:${EDITOR:-vim} <(kubectl logs --all-containers --namespace {1} {2})' \
    --preview-window up:follow \
    --preview 'kubectl logs --follow --all-containers --tail=10000 --namespace {1} {2}' "$@"
}

rgf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	open "$file"
}

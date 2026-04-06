export PATH="$HOME/.local/bin:$PATH"

# 开启代理指令
alias proxy='export all_proxy=socks5://127.0.0.1:10808; export http_proxy=http://127.0.0.1:10808; export https_proxy=http://127.0.0.1:10808; echo "Proxy ON"'

# 关闭代理指令
alias unproxy='unset all_proxy http_proxy https_proxy; echo "Proxy OFF"'

# 查看当前 IP 状态（用于测试）
alias myip='curl -L ip.gs'

# 机器本地的私密变量不进入 Git，统一从私有文件加载。
if [ -f "$HOME/.config/shell/private_env.zsh" ]; then
	source "$HOME/.config/shell/private_env.zsh"
fi

function yazi() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

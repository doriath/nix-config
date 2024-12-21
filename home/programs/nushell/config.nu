$env.EDITOR = "hx"
$env.VISUAL = "hx"

$env.config = {
  show_banner: false,
  buffer_editor: "hx",
  history: {
    file_format: "sqlite",
    isolation: true,   
  },
}
alias zj = zellij

def nixconfig [] {
  cd $"($env.HOME)/.config/home-manager"
  hx
}

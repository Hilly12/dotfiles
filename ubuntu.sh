sudo apt update
sudo apt install zsh
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc
echo """
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p' | sed 's/$/ /'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{blue}'
COLOR_DIR=$'%F{cyan}'
COLOR_GIT=$'%F{green}'

setopt PROMPT_SUBST
export PROMPT=' \${COLOR_USR}%n \${COLOR_DIR}%~ \${COLOR_GIT}\$(parse_git_branch)'
""" >> ~/.zshrc

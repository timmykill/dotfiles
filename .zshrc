# Theme
case `hostname` in
	'portal')
		ZSH_THEME="adben"
		;;
	'elite')
		ZSH_THEME='candy'
	;;
esac
if [[ `whoami` == 'root' ]]; then
    ZSH_THEME='gentoo'
fi

#Plugins
plugins=(git, history-substring-search)

#Oh my zsh stuff
DISABLE_AUTO_UPDATE='true'
export ZSH=/usr/local/share/oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Env vars
export PATH="/home/timmykill/bin/:$PATH"
export EDITOR='vim'
export XDG_RUNTIME_DIR=/tmp/
export XKB_DEFAULT_LAYOUT=it


# Global aliases
alias mydotfiles="git --git-dir=$HOME/.mydotfiles --work-tree=$HOME"
alias mydotfiles_up="mydotfiles add -u; mydotfiles commit -m 'stuff'; mydotfiles push"
alias nano="nano -w"
alias tmuxrefresh="tmux kill-session -a"
alias gping="ping 8.8.8.8"
alias mdkir="mkdir"
alias ll="ls -al"
alias cduni="cd ~/Documenti/Uni/"
alias ssh="TERM=xterm-256color ssh"
alias feh="feh --keep-zoom-vp"
alias wolp="wol 38:d5:47:19:43:c3 #portal"
toggle_touchpad(){
	oldstate=$(synclient | grep TouchpadOff | rev | cut -d' ' -f1);
	#dont know any better
	if test $oldstate = "0"; then newstate="1"; else newstate="0"; fi
	synclient TouchpadOff=$newstate
}
alias -s txt=vim
alias -s png=feh
alias -s jpg=feh
alias -s jpeg=feh
alias -s pdf=xpdf

# Machine_dependant aliases
case `hostname` in
	'portal')
		alias xpdf='firefox'
		alias emerge="emerge --ask"
		
		# Superuser stuff
		alias upall="
			sudo mount -o remount,size=10G /var/tmp/portage/
			sudo emerge --sync
			sudo layman -s ALL
			sudo emerge --ask --newuse --update --deep --with-bdeps=y @world --jobs 2 --quiet-build
			sudo emerge --depclean
			sudo mount -o remount,size=4G /var/tmp/portage/
		"

		alias start_virt="
			sudo modprobe vfio-iommu-type1
			sudo modprobe vfio-pci
			sudo rc-service libvirtd start
			sudo rc-service virtlockd start
		"
		alias stop_virt="
			sudo rc-service libvirtd stop
			sudo rc-service virtlockd stop
			sudo rc-service virtlogd stop
			sudo modprobe -r vfio-iommu-type1
			sudo modprobe -r vfio-pci
		"

		alias switch_to_intel="echo 0 | sudo tee /sys/class/vtconsole/vtcon1/bind > /dev/null && modprobe -r nouveau && modprobe i915"
		alias switch_to_nouveau="echo 0 | sudo tee /sys/class/vtconsole/vtcon1/bind > /devu/null && modprobe -r i915 && modprobe nouveau"
	;;
	'elite')
		alias mem='echo mem | sudo tee /sys/power/state > /dev/null'
	;;
esac

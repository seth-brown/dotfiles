# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

#  img-resize input.jpg output.jpg 4000
function img-resize() {
  DEFAULT_WIDTH="1000"
  WIDTH=${3:-$DEFAULT_WIDTH}
  # convert $1 -resize "600x" -unsharp 2x0.5+0.7+0 -quality 98 $2
  convert $1 -resize "${WIDTH}x" -unsharp 2x0.5+0.7+0 -quality 98 $2
}

# generate gif from mov
# mov2gif FILE.mov
# mov2gif FILE.mov 1080 15
function mov2gif() {
  DEFAULT_WIDTH="650"
  DEFAULT_FPS="30"
  #
  WIDTH=${2:-$DEFAULT_WIDTH}
  FPS=${3:-$DEFAULT_FPS}
  echo $WIDTH $FPS
  OUT="$(echo $1 | sed 's/\.mov$/\.gif/')"
  ffmpeg -i $1 -vf "scale=min(iw\,$WIDTH):-1" -r "$FPS" -sws_flags lanczos -f image2pipe -vcodec ppm - \
    | convert -delay 5 -layers Optimize -loop 0 - "$OUT"
}

# PDF resolution can be set with -dPDFSETTINGS, e.g. -dPDFSETTINGS=/printer
#
# other resolution options:
#   /screen   (73 dpi)
#   /ebook    (150 dpi)
#   /prepress (300 dpi)
#   /primer   (300 dpi)
#   /default  (300 dpi)
function pdfmerge() {
  gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress \ -sOutputFile="$@"
}

function lc() {
    if hash exa 2>/dev/null; then
        exa -1
    else 
        ls -1
    fi
}

# use exa if installed
function lt() {
    if hash exa 2>/dev/null; then
        exa -T --level=2
    else 
        ls
    fi
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
	local tmpFile="${@%/}.tar";
	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

	size=$(
		stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
	);

	local cmd="";
	if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
		# the .tar file is smaller than 50 MB and Zopfli is available; use it
		cmd="zopfli";
	else
		if hash pigz 2> /dev/null; then
			cmd="pigz";
		else
			cmd="gzip";
		fi;
	fi;

	echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
	"${cmd}" -v "${tmpFile}" || return 1;
	[ -f "${tmpFile}" ] && rm "${tmpFile}";

	zippedSize=$(
		stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
	);

	echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
}

# determines what type of archive you have (based on file extension) and
# executes the correct incantation to unarchive it.
function extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.Z)        uncompress $1                       ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
function vf() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fh - find item from command history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

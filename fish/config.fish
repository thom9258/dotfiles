#  _____ ___ ____  _   _   ____  _   _ _____ _     _     
# |  ___|_ _/ ___|| | | | / ___|| | | | ____| |   | |    
# | |_   | |\___ \| |_| | \___ \| |_| |  _| | |   | |    
# |  _|  | | ___) |  _  |  ___) |  _  | |___| |___| |___ 
# |_|   |___|____/|_| |_| |____/|_| |_|_____|_____|_____|
#   ____             __ _       
#  / ___|___  _ __  / _(_) __ _ 
# | |   / _ \| '_ \| |_| |/ _` |
# | |__| (_) | | | |  _| | (_| |
#  \____\___/|_| |_|_| |_|\__, |
#                         |___/                                                        
#
#   https://fishshell.com
#
#
#   -------------------------------
#   | Written by Thomas Alexgaard |
#   -------------------------------
#
#   Change Log:
#   DDMMYY  CHANGE
#   110720  Renamed ytdownload to ytdown
#   120720  Function for listing disk space and adding ls to cd functions
#           Added la as list all 
#   130720  Renamed mpconv to fileconv and made copy of cdl called cl
#           Added listen function as moc player (mocp)
#   160720  Reformatted layout and added asciitext function
#Pre230920  Added a lot of school specific functions
#   240920  Updated qdir echos for fuzzylite and made a ... function to go back 2 directories
#           make a fuzzylite command function and removed function that goes to .config 
#
# Help and documentation:
# https://fishshell.com/docs/current/index.html
# acess multible arguments using $argv[1] and $argv[2] (no zero indent needed)
#
#
#
#   ---------------------
#   | Startup Functions |
#   ---------------------
#
# Run bash scripts from here that start on every terminal start

# fish greeting
#set fish_greeting Keep on keeping on.
#set fish_greeting Hello Alexgaard!
#set fish_greeting "Are you going to destroy the whole world?"
set fish_greeting ""

#   -------------
#   | Functions |
#   -------------

function cl
    #echo cdl 
    cd $argv 
    ls -a -l
end

function c
    cd $argv 
    ls -a -l
end
# vpn (surfshark)
function vpn
    #echo vpn
    sudo surfshark-vpn $argv
end

# list all items
function lsa
    ls -a
end

# media player (mplayer)
function play
    mplayer $argv
end

# download yt video as mp4
function ytmp4
    # note the arg has to be in quotes (" ")
    youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $argv
    cdl ~/Music/youtube-dl_downloads/
end
# https://github.com/ytdl-org/youtube-dl/blob/master/README.md#output-template-examples
# https://www.ostechnix.com/youtube-dl-tutorial-with-examples-for-beginners/
# https://unix.stackexchange.com/questions/272868/download-only-format-mp4-on-youtube-dl

# download a yt video as mp3
function ytmp3
    # note the arg has to be in quotes (" ")
    youtube-dl --extract-audio --audio-format mp3 $argv
    cdl ~/Music/youtube-dl_downloads/
end

# download a yt video as both mp3 and mp4 just because you can
function ytdown
# note the arg has to be in quotes (" ")
    youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $argv
    youtube-dl --extract-audio --audio-format mp3 $argv
    cdl ~/Music/youtube-dl_downloads/
end

# conversion between media files (ex. mp4 to mp3)
function fileconv
    ffmpeg -i $argv[1] $argv[2]
    ls -a -l
end

# go back one directory
function ..
    cd ..
    ls -a -l
end
function ...
    cd ..
    cd ..
    ls -a -l
end

function cd..
    cd ..
    ls -a -l
end

# go back to home directory
function home
    cd ~
    ls -a -l
end
function cd~
    cd ~
    ls -a -l
end

# go to different configs
function changei3config
    nvim ~/.config/i3/config
end
function changefishconfig
    nvim ~/.config/fish/config.fish
end

# list disk usage using ncdu
function diskusage
    ncdu $argv[1]
end
function dirsize
    ncdu $argv[1]
end

# list everything in directory
function la
    ls -a
end

function ll 
    ls -a -l 
end


# play music using moc player (mocp)
function listen
    mocp $argv[1]
end

# ascii text using figlet
function asciitext
    # echo figlet
    figlet $argv[1]
end

# go to school directory
function 5sem
    cd ~/Dropbox/5sem
    ls -a -l
end
function pcloud
    cd ~/.pcloud
    ./pcloud
    echo "#################################################"
    echo "pcloud should now be running!"
    echo "#################################################"
end
# neovim
function v
    nvim $argv
end


# matlab
function matlab
    /usr/local/bin/matlab $argv
end

# pandoc functions for easier conversion
function mdtopdf
    pandoc $argv[1] -f markdown-implicit_figures -t latex -s -o $argv[2]
    echo "Pandoc converted your .md to a .pdf" 
    ls -a -l
end
function textopdf
    echo "#################################################"
    echo "to force a conversion, write 'R'" 
    echo "#################################################"
    pdflatex $argv
    echo "#################################################"
    echo "pdflatex converted your .tex to a .pdf" 
    echo "by using the command pdflatex $argv"
    rm *.aux
    rm *.log
    echo "#################################################"
    echo "the .aux and .log files were removed,"
    echo "to ceate them, run the origianl command."
    echo "#################################################"
    ls -a -l
end
function texpdf
    echo "#################################################"
    echo "to force a conversion, write 'R'" 
    echo "#################################################"
    pdflatex $argv
    echo "#################################################"
    echo "pdflatex converted your .tex to a .pdf" 
    echo "by using the command pdflatex $argv"
    rm *.aux
    rm *.log
    echo "#################################################"
    echo "the .aux and .log files were removed,"
    echo "to ceate them, run the origianl command."
    echo "#################################################"
    ls -a -l
end

function mdtotex
    pandoc $argv[1] -f markdown-implicit_figures -t latex -s -o $argv[2]
    echo "Pandoc converted your .md to a .tex" 
    ls -a -l
end
# create code related files
function texdoc
    cp ~/Documents/Latex/latexblueprint.tex $argv
    echo "copied ~/Documents/Latex/latexblueprint.tex"
    ls -a -l
end
function cppdoc
    cp ~/Documents/Cpp/cpp-main-blueprint.cpp $argv
    echo "copied ~/Documents/Cpp/cpp-main-blueprint.cpp"
    ls -a -l
end
function hppdoc
    cp ~/Documents/Cpp/hpp-blueprint.hpp $argv
    echo "copied ~/Documents/Cpp/hpp-blueprint.hpp"
    ls -a -l
end

# remove EVERYTHING inside a directory
function purge
    rm -r $argv
    ls -a -l
end

# print out new vim tricks to learn
function vimtricks
    echo 'o giver dig en ny linje og går i insert mode'
    echo '= betyder strukturer, så gg=G strukturerer hele dit c/cpp dokument'
    echo 'husk at Ctrl+n giver dig file browser'
end
# vifm file manager
function fm
    vifm .
end
function vifm.
    vifm .
end

# tmux
function mux
    tmux -f ~/.config/tmux/tmux.conf
end
function muxhelp
    man tmux
end

function rpi
    sudo screen /dev/ttyUSB0 115200
end

function qdir 
    cppdoc main.cpp
    echo "#################################################"
    echo ">> Created main.cpp"
    echo "#################################################"
    qmake -project
    echo "# OPENCV PATH" >> *.pro
    echo "INCLUDEPATH += /usr/include/opencv4/" >> *.pro
    echo "LIBS += `pkg-config --cflags --libs opencv4`" >> *.pro
    echo "# FUZZYLITE PATH" >> *.pro
    echo "INCLUDEPATH += /home/th/Documents/Cpp/lib/fuzzylite-6.0/fuzzylite">> *.pro
    echo "LIBS += /home/th/Documents/Cpp/lib/fuzzylite-6.0/fuzzylite/release/bin/libfuzzylite-static.a">> *.pro
    echo "LIBS += /home/th/Documents/Cpp/lib/fuzzylite-6.0/fuzzylite/release/bin/libfuzzylite.so.6.0">> *.pro
    echo "LIBS += /home/th/Documents/Cpp/lib/fuzzylite-6.0/fuzzylite/release/bin/libfuzzylite.so">> *.pro
    echo "#################################################"
    echo ">> Created project file"
    echo "#################################################"
    qmake -makefile
    echo "#################################################"
    echo ">> Crated main file"
    echo "#################################################"
    bear make
    echo "#################################################"
    echo ">> Created compile_commands.json"
    echo "#################################################"
    touch project_help.txt
    echo "To add further external files to the project, you should add" >> project_help.txt
    echo "the external files using the *.pro file created by qmake, then run 'bear make'"  >> project_help.txt
    echo "in the root directory" >> project_help.txt
    echo "#################################################"
    echo ">> Created project_help for adding further external"
    echo "#################################################"
    ls -la
end

function fuzzylite
    ~/Documents/Cpp/lib/fuzzylite-6.0/release/bin/fuzzylite $argv
end

#   ------------------------
#   | Enviroment variables |
#   ------------------------

# i dont understand it..

#   ------------
#   | Alias'es |
#   ------------
# dont write an alias, write a function


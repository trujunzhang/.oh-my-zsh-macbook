CURRENT_DIR=$PWD
FONTS_DIR=~/Library/Fonts
POWERLINE_FONTS_DIR=$FONTS_DIR/powerline/

echo Installing Powerline patched fonts
if [ ! -d $POWERLINE_FONTS_DIR/.git ]
then
    git clone --depth 1 https://github.com/powerline/fonts.git $POWERLINE_FONTS_DIR
else
    cd $POWERLINE_FONTS_DIR
    git pull
    cd $CURRENT_DIR
fi

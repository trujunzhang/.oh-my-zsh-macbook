# Aliases in alphabetical order

alias ma='meteor add' # Add a package to this project.
alias map='meteor add-platform' # Add a platform to this project.
alias mad='meteor admin' # Administrative commands.
alias mau='meteor authorized' # View or change authorized users and organizations for a site.
alias mb='meteor build' # Build this project for all platforms.
alias mcl='meteor claim' # Claim a site deployed with an old Meteor version.
alias mca='meteor configure-android' # Run the Android configuration tool from Meteor's ADK environment.
alias mc='meteor create' # Create a new project.
alias mdb='meteor debug' # Run the project, but suspend the server process for debugging.
alias mde='meteor deploy' # Deploy this project to Meteor.
alias mis='meteor install-sdk' # Installs SDKs for a platform.
alias ml='meteor list' # List the packages explicitly used by your project.
alias mlp='meteor list-platforms' # List the platforms added to your project.
alias mls='meteor list-sites' # List sites for which you are authorized.
alias mli='meteor login' # Log in to your Meteor developer account.
alias mlo='meteor logout' # Log out of your Meteor developer account.
alias mlog='meteor logs' # Show logs for specified site.
alias mm='meteor mongo' # Connect to the Mongo database for the specified site.
alias mp='meteor publish' # Publish a new version of a package to the package server.
alias mpa='meteor publish-for-arch' # Builds an already-published package for a new platform.
alias mpr='meteor publish-release' # Publish a new meteor release to the package server.
alias mr='meteor remove' # Remove a package from this project.
alias mrp='meteor remove-platform' # Remove a platform from this project.
alias mre='meteor reset' # Reset the project state. Erases the local database.
alias m='meteor run' # [default] Run this project in local development mode.
alias ms='meteor search' # Search through the package server database.
alias msh='meteor shell' # Launch a Node REPL for interactively evaluating server-side code.
alias msw='meteor show' # Show detailed information about a release or package.
alias mt='meteor test-packages' # Test one or more packages.
alias mu='meteor update' # Upgrade this project's dependencies to their latest versions.
alias mw='meteor whoami' # Prints the username of your Meteor developer account.
alias mnp='meteor npm install --verbose' # Run npm install after creating a new meteor project.

alias mios='meteor run ios' # Run npm install after creating a new meteor project.
alias mandroid='meteor run android' # Run npm install after creating a new meteor project.

alias mtest='meteor test --full-app --driver-package practicalmeteor:mocha --port 3100 --settings settings.json' # This will execute all your *.app-test[s].* and *.app-spec[s].* files.

alias mm='npm run test-with-meteor-mocha'
alias mps='npm run run-with-settings'
alias mpsmg='npm run run-with-settings-and-mongo'

# alias mps='meteor debug --settings settings.json' # Run meteor for the politicl project with settings paras.
alias mpps='meteor debug --production --settings settings.json' # Run meteor for the politicl project with settings paras.

alias npmt='npm test' # Run the test script from package.json.
alias npmtp="npm run test:puppeteer"

#npm config
alias nconfig_set_registry="npm config set registry https://registry.npm.taobao.org"
alias nconfig_get_registry="npm config get registry"
alias nconfig_list_local="npm config list"
alias nconfig_list_system="npm config list -l"
alias nconfig_ssl_false="npm config set strict-ssl false"
alias nconfig_ssl_true="npm config set strict-ssl true"
alias nconfig_set_cache_local="npm config set cache /tmp/npm_cache"
alias nconfig_verify_cache="npm --global cache verify"

alias psrun='php bin/console server:run' # Run the test script from package.json.

alias pslrun='php -S localhost:8080 -t web web/index.php'


# ssh-agent.plugin

alias slssh="ssh djzhang@192.168.1.106"
alias sdssh="ssh deploy@192.168.1.106"

alias vpssh="ssh root@162.243.193.200"
alias vdssh="ssh deploy@104.236.77.182"
alias vaassh="ssh deploy@139.59.15.125"

alias ecssh="sudo ssh -i "/Applications/scruby-ubuntu-virginia.pem" ubuntu@ec2-107-22-106-218.compute-1.amazonaws.com"

alias capd='cap production deploy --trace'

# react-native.plugin
#
alias set_node_env_production='export NODE_ENV=production'
alias rnstart='npx react-native start'
alias rnand='npx react-native run-android'
alias rnios='npx react-native run-ios'
alias rnios4s='react-native run-ios --simulator "iPhone 4s"'
alias rnios5='react-native run-ios --simulator "iPhone 5"'
alias rnios5s='react-native run-ios --simulator "iPhone 5s"'

alias rnlnk='npx react-native link'

alias rnapk='cd android && ./gradlew assembleRelease'

alias rnandb='npm run android:build'
alias rnandi='npm run android:install'
alias rnandd='npm run android:device'
alias rnandl='npm run android:logcat'
alias rnands='npm run android:shake'

alias rninfo='npx react-native info'
alias rnnewapp='npx react-native init'

# rebuild android/ios folders
#  The solution if ur version of react-native >= 0.61.0 :
#  $ sudo rm -rf android/ ios/
#  $ yarn add react-native-eject
#  $ npx react-native eject

# python
alias pnote="jupyter notebook"
alias pinstall="pip install -i https://pypi.tuna.tsinghua.edu.cn/simple"

# python env
alias peinit="pipenv shell"
alias peinstall="pipenv install --dev"
alias pegraph="pipenv graph"
# https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world
alias penv="python3 -m venv venv"
alias peactive="source venv/bin/activate"

# gatsby
alias gatsbynewtsapp='npm init gatsby -ts'

# typescript
## https://www.npmjs.com/package/create-typescript-project
alias ynewtsapp='npm init typescript-project'

# yarn.all
alias yupdate='ncu -u'
alias yinstall='yarn'
alias ytest='yarn test'
alias yserve='yarn serve'
alias ydev='yarn dev'
alias ydevelop='yarn develop'
alias ystartclient='yarn start:client'
alias ystart='yarn start'
alias yrandroid='yarn android'
alias yrios='yarn ios'
alias yallrios='bundle install && ninstall && npm run pod-install && yarn ios'
alias yallrandroid='bundle install && ninstall && yarn android'
alias yripad='yarn ipad'
alias yrweb='yarn web'
alias yrstorybook='yarn storybook'
alias yrmac='yarn desktop'
alias ydebug='yarn debug'
alias ybuild='yarn build'
alias ygeneratecss='yarn generate:styles'
alias ystart='yarn start'
alias ycheck='yarn lint'
alias yarntc='yarn test.client'
alias yarntw='yarn test.web'
alias yarnita='yarn install && yarn test.web && yarn test.client'
alias yarnta='yarn test.web && yarn test.client'

alias ytailwatch='yarn dev:tailwind'

alias ytscheck='yarn ts:check'
alias ylint='yarn lint'
alias ylintfix='yarn lint:fix'
alias yadd='yarn add'
alias yadddev='yarn --dev add'
alias yaddexpo='npx install-expo-modules@latest'
alias ydlnode_modules='rm -rf node_modules'

alias yarnitc='yarn install && yarn test.client'
alias yarnitw='yarn install && yarn test.web'

# yarn.plugin
alias yarnab='yarn android:build'
alias yarnai='yarn android:install'

alias yupdate='ncu -u'

# cocoapods
alias ypodi='npx pod-install'
alias podSpacsUpdate='cd /Volumes/MacDevelop/.cocoapods/Specs && git pull'

# npm clean
alias nclear="npm cache clear --force"

# npm sketch-app
alias npmrr="npm run sketch:render"

# npm.plugin
alias ninstallxxx='npm install --verbose && offline_local_ios_pods'
alias ninstall='npm install --verbose --no-cache'
alias npmi='npm install --verbose --no-cache'

alias nvscode_langservers='npm i -g vscode-langservers-extracted'

alias ninstall_dev='npm install --verbose --save-dev --no-cache'
alias ninstall_save='npm install --verbose --save --no-cache'

alias nrpodi='npm run pod-install'
alias nrprettier='npm run prettier'
alias nrstart='npm run start'
alias nrweb='npm run web'
alias nrios='npm run ios'
alias nripad='npm run ipad'
alias nrandroid='npm run android'
alias nbuild-android='npm run android-build'

# run dev
alias npmd='npm run dev'
alias npmda="npm run dev-all"
alias npmdo="npm run dev-only"
alias npmdd='npm run dev-debug'

alias npmtda="npmt && npmda"

# run lint
alias npmtl='npm run ts-lint'

alias npmbp="npm run beauty"
alias npmbb="npm run build"
alias npmf="npm run fix"

# npm update
alias npmo="npm outdated"
alias npmu="npm update"

alias npma="npmi && npmt && npmbb && npmdo"

alias npmready="yarn ready.assets && yarn && npmf && yarn tests && yarn checks && yarn ts.lints && yarn build.current.pending && yarn build.web.server && yarn build.web.cloud"
alias npmreadyclient="yarn && npmf && yarn test.client && yarn check.client &&  yarn ts.lint.client"
alias npmeasy="yarn ready.assets && yarn"

# npm typedoc
alias npmdoc="npm run doc"
alias npmigdoc="npm run doc:ignoreError"
alias npmpubdoc="npm run doc:publish"

# npm-scripts-info
alias npminfo="npm run info"

# gradle
alias gradleClean='./gradlew clean'
alias gradleBundleRelease='./gradlew bundleRelease'
alias gradleAssembleRelease='./gradlew assembleRelease'

# gitbook.plugin

alias gitbs='gitbook serve'

# cocoapods.plugin

alias podi='pod install --verbose'

# git.plugin
alias gitsubupdate="git submodule update --remote"
alias gitpullsubmodule="git pull --recurse-submodules"

# ios-sim.plugin
# npm install ios-sim -g
# https://github.com/phonegap/ios-sim
# Refer: http://arteksoftware.com/easily-launch-the-ios-simulator-from-the-command-line/

alias ipdair="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPad-Air"
alias iph6p="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-6-Plus"
alias iph6="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-6"
alias iph7p="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-7-Plus"
alias iph7="ios-sim start --devicetypeid com.apple.CoreSimulator.SimDeviceType.iPhone-7"

# cocos
# $ which cocos
# $ $HOME/Library/cocos2d/sdk/tools/cocos2d-console/bin/cocos

alias cpnew="cocos new MyAndroidGame -p com.MyCompany.MyGame -l cpp  -t binary"

alias ccios="cocos compile -p ios"
alias ccand="cocos compile -p android"

alias crunios="cocos run -p ios"
alias crunand="cocos run -p android"

alias crunand86="cocos run -p android --ap android-21 --app-aib x86"

# Homebrew
alias brewUpgrade='brew upgrade'
alias brewOutDated='brew outdated'

# bundletool
alias bundleApks='chmod +x bundletool/build_apk.sh & sh bundletool/build_apk.sh'
alias bundleInstall='bundletool install-apks --apks='

# watchman
alias watchmanClean='watchman watch-del-all'

# Expo
alias expnewapp='expo init'
alias expnewtsapp='npx create-expo-app -t expo-template-blank-typescript'
alias expUpdate='EXPO_BETA=1 expo-cli upgrade'
alias expstart="exp start -c"
alias expios="exp ios"
alias expand="exp android"
alias expdoctor='expo doctor --fix-dependencies'
alias expfix="npx expo install --fix"
alias expprebuild='npx expo prebuild --clean'
alias expdevclient='npx expo start --dev-client'
alias expandroidkeystore='npx expo fetch:android:keystore'

# Expo generator
alias expoProjectUpdate="yinstall && yupdate && yinstall && expUpdate && yinstall && expdoctor && yinstall"
alias expogenimages="node $TRUJUNZHANG_DOTFILES_HOME/bash/expo/expo_gen_images.js"
alias expogensvgs="node $TRUJUNZHANG_DOTFILES_HOME/bash/expo/expo_gen_svgs.js"
alias expogenfonts="node $TRUJUNZHANG_DOTFILES_HOME/bash/expo/expo_gen_fonts.js"

# Expo(eas)
alias easLogin='eas login'
alias eas_Publish_Apk_Production='eas update --branch production --message "Updating the app"'
alias eas_Build_OnlineApk_Preview='eas build --platform android --profile preview --no-wait'
alias eas_Build_OnlineApk_Production='eas build --platform android --profile production --no-wait'
alias eas_Build_LocalApk_Production='eas build --local --output bundletool/app_release.apk --platform android --profile production'
alias eas_Build_IOS='eas build --platform ios'
alias eas_Build_All='eas build --platform all'

# Expo(eas)(Update)
alias easUpdateConfigure='eas update:configure'

# geny motion
alias gmgeny="open -a /Applications/Genymotion.app/Contents/MacOS/player.app --args --vm-name 'genymotion'"

# macvim
# alias gvim='$ORGANIZATIONS_HOME/__APPLICATIONS/IDES/MacVim.app/Contents/MacOS/Vim -g'

# xcode
alias rosetta_install='softwareupdate --install-rosetta'
alias xcodeselect='sudo xcode-select --switch /Volumes/MacXcode/Applications/Xcode.app/Contents/Developer'
alias xcode_download_ios='xcodebuild -downloadPlatform iOS'
alias iosdevices='xcrun simctl list devices --json'
alias iosopen='open -a Simulator'

alias ioskill='killall "Simulator"'
alias ioslist='xcrun simctl list devices available'
alias iosiphone15pro='open -a Simulator --args -CurrentDeviceUDID 72CFAFB2-E1BA-4C0D-B865-2369CCA1444E iPhone16promax'
alias iosiphone15promaxabc='ioskill && sleep 3 && open -a Simulator --args -CurrentDeviceUDID D3571A3E-61B5-4190-A005-8C3F1F869D8B iPhone16promax'
alias iosiphone15promax='open -a Simulator --args -CurrentDeviceUDID D3571A3E-61B5-4190-A005-8C3F1F869D8B iPhone16promax'
alias iosiphone3se='open -a Simulator --args -CurrentDeviceUDID 9AF53831-AF2E-4F84-AC62-91D4FB2A0E76 iPhone3se'
alias androidopen='$ANDROID_SDK_ROOT/emulator/emulator -avd  genymotion'

# Flutter
alias fclean="flutter clean"
alias fkill="killall -9 dart"
alias fdoctor='flutter doctor -v'
alias fnewlib="flutter create --template=package"
alias fnewapp="flutter create"
alias frapp='flutter run --verbose'
alias frappdev='flutter run -t lib/main_dev.dart --web-port=1234'
alias frweb='flutter run --verbose --web-port=1234 -d chrome'
alias frwebdev='flutter run -t lib/main_dev.dart --web-port=1234 -d chrome'
# https://dart.dev/null-safety/unsound-null-safety
alias frunnull='flutter run --no-sound-null-safety'
alias ftest='flutter test'
alias fdevices='flutter devices'
alias fbapk='flutter build apk --split-per-abi'
alias fpget='flutter packages get'
alias fpgetlock='rm -f pubspec.lock && flutter packages get'
alias fprundevgetlock='rm pubspec.lock && flutter packages get && flutter run -t lib/main_dev.dart'
alias fpupdate='flutter pub upgrade --major-versions'
alias fbuildapk='flutter build apk --split-per-abi --verbose'
# https://docs.flutter.dev/deployment/web
alias fbuildweb='flutter build web'
alias fjson='flutter packages pub run json_model'
# https://flutter.dev/docs/development/tools/web-renderers
alias fwebrun='flutter run -d chrome --web-hostname localhost --web-port 5000'
alias fwebrelease='flutter build web --release'
alias fpubspecupdate='flutter pub upgrade'
alias fpubspecoutdated='flutter pub outdated'
alias fdartupdate='dart pub upgrade --null-safety'
alias fpubspecout='flutter pub outdated'
alias fanalyze='flutter analyze'
alias fsdkout='rm -f flutter && fdoctor > flutter '
alias frmlocks="find . -name 'pubspec.lock' -type f | xargs rm -rf"

# plugins
alias fintlgenerate='flutter pub run intl_utils:generate'
alias fbuildgenerate='flutter pub run build_runner build --delete-conflicting-outputs'
alias flaunchericonsgenerate='flutter pub run flutter_launcher_icons_maker:main'
alias frgenerate='./scripts/run_generate.sh'
alias frupdate='./scripts/run_update.sh'
alias frcopy='./scripts/run_copy.sh'
alias frtest='./scripts/run_test.sh'

# library
alias fcoderest='cd plugin/app_rest && code .'
alias fcodelanguage='cd plugin/app_language && code .'
alias fassets='fgen --no-watch -o ../packages/app_config/lib/src/resource.dart'

# projects
alias fcdapp='cd app'
alias fcddocwidget='cd doc_widget_app'
alias fcdpgconfig='cd packages/app_config'
alias fcdpgrest='cd packages/app_rest'

# install apk
alias finstallapkrelease='adb install build/app/outputs/apk/release/app-arm64-v8a-release.apk'
alias fopenapkrelease='open build/app/outputs/apk/release'

# Global library
# melos
#   Splitting up large code bases into separate independently versioned packages is extremely useful for code sharing.
#   https://pub.dev/packages/melos
# asset generator
#   Automatically generate the dart file for pubspec.yaml
#   https://pub.dev/packages/flutter_asset_generator
# dartdoc
#   Use dartdoc to generate HTML documentaton for your Dart package.
#   https://pub.dev/packages/dartdoc
# dhttpd
#   An easy way to run an HTTP server locally is to use the dhttpd package.
#   https://pub.dev/packages/dhttpd
alias fglobal='pub global activate melos && pub global activate flutter_asset_generator && pub global activate dartdoc && pub global activate dhttpd'
alias fgendoc='dartdoc'
alias fhttpdoc='dhttpd --path doc/api'
alias fhttpweb='dhttpd --path build/web'

# python
alias pjnote='jupyter notebook'

# Conda
alias cinfo='conda info'
alias cenvlist='conda env list'
alias clist='conda list'
alias crevisionlist='conda list --revision'
alias cactive='conda activate'

# VPS
alias wsshbwg='ssh -p 27449 root@176.122.172.101'
alias wsshcopybwg='ssh-copy-id -p 27449 root@176.122.172.101'
alias wsshlocal='ssh ubuntu@'
alias wsshcopylocal='ssh-copy-id ubuntu@'
# alias wsshtmp='ssh root@'
# alias wsshcopytmp='ssh-copy-id root@'
alias wsshtmp='ssh root@'
alias wsshcopytmp='ssh-copy-id root@'
alias wsshdns='ssh root@ok.myv2ray.xyz'

# Firebase
## Firebase-tool
alias fblogin='firebase login'
alias fbcreatefunction='firebase init functions'
alias fbdeploy='firebase deploy --only functions'

## Install, configure and integrate Local Emulator Suite
alias femulatorsstart="firebase emulators:start"

# django
alias djrun='python manage.py runserver'
alias djmj='python manage.py migrate'
alias djmmj='python manage.py makemigrations'

# neovim
alias neovimcheck="nvim +checkhealth"
alias neovimplugininstall="nvim +PlugInstall"

# djzhang's cmd
alias dfpython="cd $ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook/USERS/python"
alias drunvpn="cd $ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook/USERS/python && python vpn_connect.py"
alias drv="cd $ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook/USERS/python && python vpn_connect.py"
alias drun_onekeymac="cd $ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook && ./one_key_macbook.sh"
alias drun_onekeyenv="cd $ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook && ./envLinks.sh"
alias drun_git_offline="cd $ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook/USERS/cocoapods && ./generator_git_offline.sh"
alias drun_grpc__branch="cd $ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook/USERS/cocoapods/grpc && ./generator_grpc_git_branch.sh"
alias drun_local_gitpull="cd $ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook/bash && ./local_git_update.sh"
alias drun_pods_offline="cd $ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook/USERS/cocoapods && node offline.js"
alias drun_http='cd $ORGANIZATIONS_HOME/__CACHES/github && python -m http.server --cgi 8080'
alias dkill_paralles_desktop="sh $ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook/bash/umac/kill_macos_apps.sh 'prl_client_app'"
alias wcdxxx="mkdir -p /tmp/xxx && cd /tmp/xxx"
alias wdwxxx="mkdir -p ~/Downloads/xxx && cd ~/Downloads/xxx"

# nvm
alias dnvmreset="cd ~/ && rm -rf .nvm && git clone file://$ORGANIZATIONS_HOME/IDES/nvm/localNVM .nvm && cd ~/.nvm  && git checkout v0.39.3 && . ~/.nvm/nvm.sh && nvm install 16.16 && nvm use 16.16 && npm install -g yarn"

# supabase
function supabase_gen
    set project-id $argv[1]
    set dest_fold plugins/app-supabase/types
    mkdir -p "$dest_fold"
    supabase gen types typescript --project-id "$project-id" --schema public >"$dest_fold/supabase.ts"
end

# cocoapods
# https://blog.csdn.net/qq_41110569/article/details/106501098
alias cocoapodsMaster="git clone https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git master"

# clojure
alias clnewapp='lein new app'
alias clinstall='lein deps'
alias clrepl='lein repl'
alias cljar='lein uberjar'
alias clrun='lein run'
alias cltest='lein test'
alias clsearch='lein search'

# chemacs2
# https://github.com/plexus/chemacs2
alias emacsdoom="emacs --with-profile=doom"
alias emacsspace="emacs --with-profile=spacemacs"
alias etspace="echo 'spacemacs' > ~/.emacs-profile"
alias etdoom="echo 'doom' > ~/.emacs-profile"
alias edoominstall="$ORGANIZATIONS_HOME/IDES/emacs-shim/doom-emacs/bin/doom install"
alias edoomsync="$ORGANIZATIONS_HOME/IDES/emacs-shim/doom-emacs/bin/doom sync"
alias edoomdoctor="$ORGANIZATIONS_HOME/IDES/emacs-shim/doom-emacs/bin/doom doctor"

#
# youtube-dl(pending)
# https://ostechnix.com/youtube-dl-tutorial-with-examples-for-beginners/
#
# yt-dlp
# https://github.com/yt-dlp/yt-dlp#usage-and-options
alias ydl="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt"
alias ydl_hd="yt-dlp -f 'bestvideo[ext=webm]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt"
alias yl16="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start 1 --playlist-end 6"
alias yl712="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start 7 --playlist-end 12"
alias yl1318="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start 13 --playlist-end 18"
alias yl1924="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start 19 --playlist-end 24"
alias yl2530="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start 25 --playlist-end 30"
alias yl3136="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start 31 --playlist-end 36"
alias yl3742="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start 37 --playlist-end 42"
alias yl4348="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start 43 --playlist-end 48"
alias yl4954="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start 49 --playlist-end 54"

alias wydlcache="yt-dlp --rm-cache-dir"
alias wdownyl="yt-dlp --rm-cache-dir && nohup ydlcron > /tmp/foo.out 2> /tmp/foo.err < /dev/null &"

alias wprocessyl="pgrep yt-dlp"
alias wjobs="jobs -l"

# crontab
alias whcronedit="crontab -e"
alias whcroninfo="crontab -l"

# docker
alias wdockps="docker ps -a"
alias wdocklsimg="docker image ls"
alias wdockrm='docker rm -f $(docker ps -a -q)'
alias wdockimgrm='docker rmi $(docker images -q)'
alias wdocklog='docker-compose logs --tail=all -f | grep'

#vps
alias pingPort='sudo netstat -tunlp'

# v2ray
# 查看端口 Port
alias v2rayport='cat /etc/v2ray/config.json | grep port'
# 查看 id (UUID)
alias v2rayip='cat /etc/v2ray/config.json | grep id'
alias v2raytime='date -R'

alias linuxportscan="sudo lsof -i -P -n | grep LISTEN"

# https://github.com/xieyezi/monia-cli
alias fmoniacreate='monia create'
alias fmoniainit='monia init'

# oh-my-zsh
alias zshupdate='omz update'

# github
alias wsshgithub='ssh -T git@github.com'
alias wgithubflutter='cd /tmp && gcl https://github.com/flutter/flutter'

# clone website
alias clonewebsite="wget --mirror --convert-links --wait=2"

# vscode
# alias visualstudiocodeExport="code --list-extensions |
# xargs -L 1 echo code --install-extension |
# sed 's/$/ --force/' |
# sed '\$!s/$/ \&/' > /tmp/install-extensions.sh"

# conda
alias condaUpdate='conda update -n base -c conda-forge conda'

alias vpsDownload="wget https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.10.3-stable.zip "

# bitbucket
# https://bitbucket.org/blog/ssh-host-key-changes
alias bitbucket_update_ssh="ssh-keygen -R bitbucket.org && curl https://bitbucket.org/site/ssh"
alias bitbucket_host_key="ssh git@bitbucket.org host_key_info"

# homebrew
# brew services start d12frosted/emacs-plus/emacs-plus@30
function binstall-emacs
    if not test -d "$HOMEBREW_HOME/opt/emacs-plus@30"
        brew tap d12frosted/emacs-plus
        brew install emacs-plus@30 --with-spacemacs-icon --with-native-comp
        brew link emacs-plus@30
    end
    if not test -d "/Applications/Emacs.app"
        ln -s $HOMEBREW_HOME/opt/emacs-plus@30/Emacs.app /Applications
    end
end

function binstall-nerd-font
    brew tap homebrew/cask-fonts
    brew install font-hack-nerd-font
end

function killvim
    kill $(ps aux | grep 'neovim' | awk '{print $2}')
end

# brew
alias bcubc='brew upgrade --cask && brew cleanup'
alias bcubo='brew update && brew outdated --cask'
alias bcubc='brew upgrade --cask && brew cleanup'
alias brewp='brew pin'
alias brewsp='brew list --pinned'
alias bubc='brew upgrade --verbose && brew cleanup --verbose'
alias bugbc='brew upgrade --greedy && brew cleanup'
alias bubo='brew update --verbose && brew outdated --verbose'
alias bubu='bubo && bubc'
alias bubug='bubo && bugbc'
alias bfu='brew upgrade --formula'
alias buz='brew uninstall --zap'

# macos
alias wh_shutdown_mac="sudo shutdown -h now"
alias wh_restart_mac="sudo shutdown -r now"

# lunarvim
alias lvimUpdateReset="lvim +LvimUpdate +LvimCacheReset +q"
alias wrmvimsession="rm -rf $HOME/.local/share/nvim/sessions"

# vpn
alias wcloudflareip="curl https://raw.githubusercontent.com/badafans/better-cloudflare-ip/master/shell/cf.sh -o /tmp/cf.sh && chmod +x /tmp/cf.sh && cd /tmp && ./cf.sh"

alias https_proxy_v2ray="export https_proxy=http://127.0.0.1:1087"
alias http_proxy_v2ray="export http_proxy=http://127.0.0.1:1087"

# git clone
alias dclone_expensify="git clone https://github.com/expensify/App.git --depth 1 expensify && cd expensify"
alias dclone_ieatta="git clone git@bitbucket.org:trujunzhang/ieatta-three-apps.git --depth 1 check-ieatta && cd check-ieatta"
alias dclone_used_expensify="git clone git@github.com:trujunzhang/App-1.4.26-2-fixed.git --depth 1 usedExpApp && cd usedExpApp"
alias dclone_cocoapods="git clone https://github.com/CocoaPods/Specs --depth 1"
alias dclone_asdf_plugins="git clone https://github.com/asdf-vm/asdf-plugins --depth 1"
alias dclone_transforms="git clone https://github.com/huggingface/transformers --depth 1"
alias dclone_tensor="git clone https://github.com/tensorflow/tensorflow --depth 1"
alias dclone_superbase="git clone https://github.com/supabase/supabase --depth 1"
#see: https://github.com/CodyReichert/awesome-cl
alias dclone_lisp_matrix="git clone https://github.com/blindglobe/lisp-matrix --depth 1"
alias dclone_singbox_rules="git clone https://github.com/MetaCubeX/meta-rules-dat && cd meta-rules-dat && git checkout sing"

alias git_set_v2ray_proxy="git config --global http.proxy http://127.0.0.1:1087"
alias git_set_clash_proxy_http="git config --global http.proxy http://127.0.0.1:7890"
alias git_set_clash_proxy_https="git config --global https.proxy https://127.0.0.1:7890"
alias git_set_clash_proxy="git_set_clash_proxy_http && git_set_clash_proxy_https"
alias git_checkout_proxy="git config --global http.proxy"

alias git_checkout_submodules="git submodule update --init --recursive --depth=1"

#nvim
alias wclean_cache_homebrew="rm -rf $HOME/Library/Caches/Homebrew"
alias wclean_cache_webstorm="rm -rf $HOME/Library/Caches/JetBrains"
alias wclean_lvimCache="rm -rf $HOME/.cache/lvim && rm -rf $HOME/.local/state/lvim && rm -rf $HOME/.local/share/lvim && rm -rf $HOME/.local/share/lunarvim/lazy && rm -rf $HOME/.local/share/lunarvim/site"
alias wclean_nvimCache="rm -rf $HOME/.cache/nvim && rm -rf $HOME/.local/state/nvim && rm -rf $HOME/.local/share/nvim"
alias wclean_nvchad-cache_wSedlacek="rm -rf $HOME/.cache/nvchad-wSedlacek && rm -rf $HOME/.local/state/nvchad-wSedlacek && rm -rf $HOME/.local/share/nvchad-wSedlacek"
alias wclean_nvchad-cache_mgastonportillo="rm -rf $HOME/.cache/nvchad-mgastonportillo && rm -rf $HOME/.local/state/nvchad-mgastonportillo && rm -rf $HOME/.local/share/nvchad-mgastonportillo"
alias wclean_nvchad-cache_Alexis12119="rm -rf $HOME/.cache/nvchad-Alexis12119 && rm -rf $HOME/.local/state/nvchad-Alexis12119 && rm -rf $HOME/.local/share/nvchad-Alexis12119"
alias wclean_nvim-cache_2kabhishek="rm -rf $HOME/.cache/nvim-2kabhishek && rm -rf $HOME/.local/state/nvim-2kabhishek && rm -rf $HOME/.local/share/nvim-2kabhishek"
alias wclean_nvim-cache_craftzdog="rm -rf $HOME/.cache/nvim-craftzdog && rm -rf $HOME/.local/state/nvim-craftzdog && rm -rf $HOME/.local/share/nvim-craftzdog"
alias wclean_all_nvim_cache="wclean_nvimCache && wclean_nvim-cache_2kabhishek && wclean_nvim-cache_craftzdog && wclean_nvchad-cache_wSedlacek && wclean_nvchad-cache_mgastonportillo && wclean_nvchad-cache_Alexis12119"

#rvm
alias set_rvm_source='echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db'

#nix
alias dnix_build_default_debug="darwin-rebuild switch --option http2 false  --flake $TRUJUNZHANG_DOTFILES_HOME/config/nix-darwin/universal --show-trace --print-build-logs --verbose"
# alias dnix_build_default="darwin-rebuild switch --flake $TRUJUNZHANG_DOTFILES_HOME/config/nix-darwin/universal"
alias dnix_build_local="darwin-rebuild switch --option http2 false  --flake ."
alias dnix_install_third="NIX_INSTALLER_NIX_BUILD_USER_ID_BASE=400 curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --extra-conf 'trusted-users = $(whoami)'"
alias dnix_uninstall_third="/nix/nix-installer uninstall"
alias dnix_install_nix_official="export NIX_FIRST_BUILD_UID=30001 && sudo curl -L https://nixos.org/nix/install | sh"
alias dnix_run_garbage="nix-collect-garbage --delete-old"
alias dnix_config="nix config show"
alias dnix_info='nix-shell -p nix-info --run "nix-info -m"'
alias dnix_bin="ls /etc/profiles/per-user/djzhang/bin"
alias dnix_install_act="nix-shell -p act"

function dnix_build_default
    #if [ -d /tmp/neovim-flake-jordanisaacs ]
    #    rm -rf /tmp/neovim-flake-jordanisaacs
    #end
    #cp -Rvp "$TRUJUNZHANG_DOTFILES_HOME/config/neovim-flake-jordanisaacs" /tmp/neovim-flake-jordanisaacs
    darwin-rebuild switch --option http2 false --flake $TRUJUNZHANG_DOTFILES_HOME/config/nix-darwin/universal
end

alias dmac_unzip_common_apps='unzip -o "/Volumes/MacGame/MacCache/apps/Applications/*.zip" -d /Applications'
alias dmac_unzip_vpn_apps='unzip -o "/Volumes/MacGame/MacCache/apps/v2ray/*.zip" -d /Applications'
alias dmac_switch_off_spotlight="sudo mdutil -a -i off"
alias dmac_link_homebrew="sudo ln -s /Volumes/MacGame/MacCache/homebrew /opt/homebrew"
alias dmac_vim_jenkins_plist="sudo vim /opt/homebrew/opt/jenkins-lts/homebrew.mxcl.jenkins-lts.plist"

alias dmac_jenkins_services_restart="brew services restart jenkins-lts"

function dmac_install_common_apps
    mkdir -p /tmp/Applications/unzip
    cp /Volumes/MacGame/MacCache/apps/Applications/*.zip /tmp/Applications
    unzip "/tmp/Applications/*.zip" -d /tmp/Applications/unzip
    # cp -Rvp "/tmp/Applications/unzip/*.app" "/Applications"

    open /tmp/Applications/unzip
end

function dnix_install_nix_darwin
    sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.bak
    nix run nix-darwin -- switch --flake "$TRUJUNZHANG_DOTFILES_HOME/config/nix-darwin/$(uname -m)"
end

function dnix_uninstall_nix_darwin
    nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A uninstaller
    ./result/bin/darwin-uninstaller
end

alias dcd_home="cd $TRUJUNZHANG_DOTFILES_HOME"

# crossover
function linkCrossOverBottle
    set bottle $argv[1]
    echo $bottle
    # ln -s "/Volumes/MacGame/CrossOver/Bottles/$bottle" "$HOME/Library/Application Support/CrossOver/Bottles/$bottle"
    ln -s /Volumes/MacGame/crossover "$HOME/Library/Application Support/CrossOver/Bottles"
end

# djzhang's git
function dgitreset
    set currentGitPath "$PWD/.git"
    echo " <.git >Path: $currentGitPath"
    if [ -d $currentGitPath ]
        echo "already have git repository"
    else
        git init && git add . && git commit -m 'first commit' && git checkout -b tmp
    end
end

function copy_new_ieatta_to_checkout
    set check_ieatta /tmp/xxx/check-ieatta
    if [ -d $check_ieatta ]
        echo "already exist: $check_ieatta"
    else
        mkdir -p "$check_ieatta"
        cp -Rvp "$ORGANIZATIONS_HOME/__CODING/WORKING/ieatta-three-apps/.git" "$check_ieatta/.git"
        cd $check_ieatta
    end
end

function link_Ccache
    sudo ln -s $(which ccache) /usr/local/bin/gcc
    sudo ln -s $(which ccache) /usr/local/bin/g++
    sudo ln -s $(which ccache) /usr/local/bin/cc
    sudo ln -s $(which ccache) /usr/local/bin/c++
    sudo ln -s $(which ccache) /usr/local/bin/clang
end

function open_ieatta_xcode_document
    set result $(xcrun simctl get_app_container booted com.ieatta.track.dev data)
    open "$result"
end

alias open_ieatta_android_release_fold="open $ORGANIZATIONS_HOME/__CODING/WORKING/ieatta-three-apps/android/app/build/outputs/apk/production/release"
alias dinstall_ieatta_android_release="adb install $ORGANIZATIONS_HOME/__CODING/WORKING/ieatta-three-apps/android/app/build/outputs/apk/production/release/app-production-release.apk"

# python
alias pip_clean_cache="pip cache purge"

# neovim
alias l="lvim"
# alias n="nvim"
alias vsc="code ."

alias h="nix run ~/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook/config/neovim-flake-gvolpe --"
alias d="nix run ~/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook/config/neovim-flake-gvolpe --"

# Switching Configs in Neovim
# see: https://michaeluloth.com/neovim-switch-configs/
# UpdateRemotePlugins

alias NVIM_APPNAME='nvim-lazyvim nvim'
alias vd='nvim' # default Neovim config
alias vz='NVIM_APPNAME=nvim-lazyvim nvim' # LazyVim
alias vc='NVIM_APPNAME=nvim-nvchad nvim' # NvChad
alias vk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart
alias va='NVIM_APPNAME=nvim-astrovim nvim' # AstroVim
alias v='NVIM_APPNAME=nvchad-wSedlacek nvim' # NvChad
alias m='NVIM_APPNAME=nvchad-mgastonportillo nvim' # NvChad
alias a='NVIM_APPNAME=nvchad-Alexis12119 nvim' # NvChad
alias n='NVIM_APPNAME=nvim-2kabhishek nvim' # Standard neovim
alias c='NVIM_APPNAME=nvim-craftzdog nvim' # Standard neovim

alias uv='NVIM_APPNAME=nvchad-wSedlacek neovide' # NvChad
alias un='NVIM_APPNAME=nvim-2kabhishek neovide' # Standard neovim
alias uc='NVIM_APPNAME=nvim-craftzdog neovide' # Standard neovim

# Emacs
# alias emacs='open -a $ORGANIZATIONS_HOME/__APPLICATIONS/IDES/Emacs.app $1'
alias emacsd="emacs -debug-init"
alias e="emacs -nw"

alias fish_reload="source ~/.config/fish/config.fish"

#python
# see: https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments
alias pvenv_new="python -m venv .venv"
alias pvenv_envrc='echo -e "export VIRTUAL_ENV=.venv\nlayout python" > .envrc'
alias pip_install="pip install -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple"
# Verify the installation:
alias pverify_tensorflow='python -c "import tensorflow as tf
print(tf.reduce_sum(tf.random.normal([1000, 1000])))"'
alias pverify_transforms="python -c \"from transformers import pipeline
print(pipeline('sentiment-analysis')('we love you'))\""

alias dmac_install_rosetta="softwareupdate --install-rosetta"

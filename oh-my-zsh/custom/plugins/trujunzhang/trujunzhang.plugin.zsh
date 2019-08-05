# Aliases in alphabetical order

alias ma='meteor add'                  # Add a package to this project.
alias map='meteor add-platform'        # Add a platform to this project.
alias mad='meteor admin'               # Administrative commands.
alias mau='meteor authorized'          # View or change authorized users and organizations for a site.
alias mb='meteor build'                # Build this project for all platforms.
alias mcl='meteor claim'               # Claim a site deployed with an old Meteor version.
alias mca='meteor configure-android'   # Run the Android configuration tool from Meteor's ADK environment.
alias mc='meteor create'               # Create a new project.
alias mdb='meteor debug'               # Run the project, but suspend the server process for debugging.
alias mde='meteor deploy'              # Deploy this project to Meteor.
alias mis='meteor install-sdk'         # Installs SDKs for a platform.
alias ml='meteor list'                 # List the packages explicitly used by your project.
alias mlp='meteor list-platforms'      # List the platforms added to your project.
alias mls='meteor list-sites'          # List sites for which you are authorized.
alias mli='meteor login'               # Log in to your Meteor developer account.
alias mlo='meteor logout'              # Log out of your Meteor developer account.
alias mlog='meteor logs'               # Show logs for specified site.
alias mm='meteor mongo'                # Connect to the Mongo database for the specified site.
alias mp='meteor publish'              # Publish a new version of a package to the package server.
alias mpa='meteor publish-for-arch'    # Builds an already-published package for a new platform.
alias mpr='meteor publish-release'     # Publish a new meteor release to the package server.
alias mr='meteor remove'               # Remove a package from this project.
alias mrp='meteor remove-platform'     # Remove a platform from this project.
alias mre='meteor reset'               # Reset the project state. Erases the local database.
alias m='meteor run'                   # [default] Run this project in local development mode.
alias ms='meteor search'               # Search through the package server database.
alias msh='meteor shell'               # Launch a Node REPL for interactively evaluating server-side code.
alias msw='meteor show'                # Show detailed information about a release or package.
alias mt='meteor test-packages'        # Test one or more packages.
alias mu='meteor update'               # Upgrade this project's dependencies to their latest versions.
alias mw='meteor whoami'               # Prints the username of your Meteor developer account.
alias mnp='meteor npm install --verbose'         # Run npm install after creating a new meteor project.

alias mios='meteor run ios'         # Run npm install after creating a new meteor project.
alias mandroid='meteor run android'         # Run npm install after creating a new meteor project.

alias mtest='meteor test --full-app --driver-package practicalmeteor:mocha --port 3100 --settings settings.json'  # This will execute all your *.app-test[s].* and *.app-spec[s].* files.

alias mm='npm run test-with-meteor-mocha'
alias mps='npm run run-with-settings'
alias mpsmg='npm run run-with-settings-and-mongo'

# alias mps='meteor debug --settings settings.json' # Run meteor for the politicl project with settings paras.
alias mpps='meteor debug --production --settings settings.json' # Run meteor for the politicl project with settings paras.

alias npmt='npm test'   # Run the test script from package.json.
alias npmtp="npm run test:puppeteer"

alias psrun='php bin/console server:run'   # Run the test script from package.json.

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

alias rnand='react-native run-android'
alias rnios4s='react-native run-ios --simulator "iPhone 4s"'
alias rnios5='react-native run-ios --simulator "iPhone 5"'
alias rnios5s='react-native run-ios --simulator "iPhone 5s"'
alias rnios='react-native run-ios'

alias rnlnk='react-native link'

alias rnapk='cd android && ./gradlew assembleRelease'

alias rnios='react-native run-ios'

alias rnandb='npm run android:build'
alias rnandi='npm run android:install'
alias rnandd='npm run android:device'
alias rnandl='npm run android:logcat'
alias rnands='npm run android:shake'

# yarn.all
alias yarntc='yarn test.client'
alias yarntw='yarn test.web'
alias yarnita='yarn install && yarn test.web && yarn test.client'
alias yarnta='yarn test.web && yarn test.client'

alias yarnitc='yarn install && yarn test.client'
alias yarnitw='yarn install && yarn test.web'

# yarn.plugin
alias yarns='yarn start'
alias yarnab='yarn android:build'
alias yarnai='yarn android:install'

# npm sketch-app
alias npmrr="npm run sketch:render"

# npm.plugin
alias npmi='npm install --verbose'
alias yarni='yarn install --verbose'

alias npmsvi='npm install --verbose --save-dev '
alias npmsi='npm install --verbose --save '

alias npmsc='yarn start:client'
alias npmso='yarn start'

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

# gitbook.plugin

alias gitbs='gitbook serve'

# cocoapods.plugin

alias podi='pod install --verbose'

# git.plugin
alias gitsubupdate="git submodule update --remote"

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
# $ /Users/djzhang/Library/cocos2d/sdk/tools/cocos2d-console/bin/cocos

alias cpnew="cocos new MyAndroidGame -p com.MyCompany.MyGame -l cpp  -t binary"

alias ccios="cocos compile -p ios"
alias ccand="cocos compile -p android"

alias crunios="cocos run -p ios"
alias crunand="cocos run -p android"

alias crunand86="cocos run -p android --ap android-21 --app-aib x86"

# digital ocean

alias wsshp="ssh root@139.59.15.125"

# Expo
alias exps="exp start"
alias expios="exp ios"
alias expand="exp android"

# Emacs
alias emacs='open -a /Users/djzhang/Documents/Organizations/__APPLICATIONS/IDES/Emacs.app $1'
alias emacsd="emacs -debug-init"

# geny motion
alias gmgeny="open -a /Applications/Genymotion.app/Contents/MacOS/player.app --args --vm-name 'genymotion'"

# macvim
alias gvim='$HOME/Documents/Organizations/__APPLICATIONS/IDES/MacVim.app/Contents/MacOS/Vim -g'

# xcode
alias iosopen='open -a Simulator'

# Flutter
alias fkill="killall -9 dart"
alias fcheck="flutter analyze"
alias frun='flutter run'
alias ftest='flutter test'
alias fbapk='flutter build apk --split-per-abi'
alias fpget='flutter packages get'
alias fpupdate='flutter pub upgrade'

# django
alias djrun='python manage.py runserver'
alias djmj='python manage.py migrate'
alias djmmj='python manage.py makemigrations'

# python
alias pjnote='jupyter notebook'

alias wjsglobal='npm install -g typescript @babel/plugin-proposal-decorators babel-plugin-module-resolver babel-core babel-jest @types/jest jest @babel/cli @babel/core @babel/runtime @babel/polyfill @babel/preset-env @babel/preset-react @babel/preset-typescript @babel/plugin-transform-runtime @babel/plugin-proposal-class-properties @babel/plugin-proposal-object-rest-spread @types/react-test-renderer react-test-renderer'


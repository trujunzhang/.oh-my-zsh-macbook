1. You can allow local checkouts anyway by setting the system property 'hudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT' to true
   fixed: https://stackoverflow.com/questions/72341686/jenkins-allow-local-checkout

If you're using macOS and installed Jenkins-LTS using Homebrew, you only need to edit the /usr/local/opt/jenkins-lts/homebrew.mxcl.jenkins-lts.plist file and add <string>-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true</string> before <string>-jar</string>. Save the file and run brew services restart jenkins-lts. The complete contents of this file after the edits:

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>homebrew.mxcl.jenkins-lts</string>
    <key>LimitLoadToSessionType</key>
    <array>
        <string>Aqua</string>
        <string>Background</string>
        <string>LoginWindow</string>
        <string>StandardIO</string>
        <string>System</string>
    </array>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/opt/openjdk@17/bin/java</string>
        <string>-Dmail.smtp.starttls.enable=true</string>
        <string>-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true</string>
        <string>-jar</string>
        <string>/usr/local/opt/jenkins-lts/libexec/jenkins.war</string>
        <string>--httpListenAddress=127.0.0.1</string>
        <string>--httpPort=8080</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>

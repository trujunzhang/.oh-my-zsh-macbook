function welcome_message
    echo "Welcome here! checking the current macos system type..."
    set -l current_hostname (scutil --get LocalHostName)
    # djzhangs-Mac-mini

    if string match -qi "*mac-mini*" $current_hostname
        echo " fish shell Substring found!"
    else
        echo " fish shell Substring not found."
    end
end

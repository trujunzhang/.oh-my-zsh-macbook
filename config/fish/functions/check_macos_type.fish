function welcome_message
    set -l current_hostname (scutil --get LocalHostName)
    # djzhangs-Mac-mini

    set -gx MY_MAC_TYPE unknown

    if string match -qi "*mac-mini*" $current_hostname
        set -gx MY_MAC_TYPE $MAC_TYPE_MINI
    end

    if string match -qi "*macbook-pro*" $current_hostname
        set -gx MY_MAC_TYPE $MAC_TYPE_PRO
    end

    if string match -qi "*mac-neo*" $current_hostname
        set -gx MY_MAC_TYPE $MAC_TYPE_NEO
    end

    echo "Welcome $USER! checking the current macos system type is $MY_MAC_TYPE"
end

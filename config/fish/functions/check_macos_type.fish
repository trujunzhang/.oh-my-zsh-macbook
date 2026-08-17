function welcome_message
    set -l current_hostname (scutil --get LocalHostName)
    # djzhangs-Mac-mini

    set -gx MY_MAC_TYPE unknown
    set -gx MY_MAC_NAME unknown

    if string match -qi "*mac-mini*" $current_hostname
        set -gx MY_MAC_TYPE $MAC_TYPE_MINI
        set -gx MY_MAC_NAME $MAC_NAME_MINI
    end

    if string match -qi "*macbook-pro*" $current_hostname
        set -gx MY_MAC_TYPE $MAC_TYPE_PRO
        set -gx MY_MAC_NAME $MAC_NAME_PRO
    end

    if string match -qi "*mac-neo*" $current_hostname
        set -gx MY_MAC_TYPE $MAC_TYPE_NEO
        set -gx MY_MAC_NAME $MAC_NAME_NEO
    end

    echo "Welcome $USER! Checking the current macos system type is $MY_MAC_TYPE, name is $MY_MAC_NAME"
end

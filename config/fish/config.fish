if status is-interactive
    source ~/.config/fish/manpages.fish

    mail -e
    switch "$status"
        case 0
            echo "You have mail"
    end
end
set fish_greeting

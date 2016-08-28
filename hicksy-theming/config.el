(configuration-layer/declare-layer '(theming :variables
             theming-modifications
             '((monokai

                ;;Modeline modifications
                (header-line :background "#272822")
                (mode-line-inactive :foreground "#F8F8F0" :background "#49483E")
                (powerline-inactive1 :foreground "#F8F8F0" :background "#35331D")
                (powerline-inactive2 :foreground "#F8F8F0" :background "#272822")

                ;;selection
                (hl-line :background "#49483E")
                (helm-selection :background "#49483E")

                ;;Line number modifications
                (linum-relative-current-face :background "#272822" :foreground "#75715E")))))

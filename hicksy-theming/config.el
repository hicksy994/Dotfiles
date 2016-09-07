(configuration-layer/declare-layer
 '(theming :variables
     theming-modifications

     '((gruvbox

        ;;Helm
        (helm-source-header :background "#3c3836")

        ;;Modeline
        (header-line :background "#282828")
        (mode-line-inactive :foreground "#d5c4a1" :background "#504945")
        (powerline-active1 :foreground "#d5c4a1" :background "grey22")
        (powerline-inactive1 :foreground "#d5c4a1" :background "grey22")
        (powerline-active2 :foreground "#d5c4a1" :background "grey40")
        (powerline-inactive2 :foreground "#d5c4a1" :background "grey40")


        ;;Line number
        (linum-relative-current-face :background "#282828"))

       (solarized-dark

        ;;Modeline
        (header-line :background "#002b36" :underline nil)
        (mode-line :underline nil)
        (mode-line-inactive :background "#073642" :foreground "#839496" :underline nil)
        (powerline-active1 :underline nil)
        (powerline-inactive1 :background "#002b36" :foreground "#657b83" :underline nil)
        (powerline-active2 :underline nil)
        (powerline-inactive2 :background "#073642" :foreground "#657b83" :underline nil)

        ;;Helm
        (helm-selection :underline nil)
        (helm-selection-line :underline nil))

       (monokai

        ; Modeline

        (header-line :background "#272822")
        (mode-line-inactive :foreground "#F8F8F0" :background "#49483E")
        (powerline-inactive1 :foreground "#F8F8F0" :background "#35331D")
        (powerline-inactive2 :foreground "#F8F8F0" :background "#272822")

        ;;selection/helm
        (hl-line :background "#49483E")
        (helm-selection :background "#49483E")
        (helm-selection-line :background "#49483E")
        (helm-lisp-show-completion :background "#49483E")
        (helm-candidate-number :background "#49483E")

        ;;company
        (company-preview :background "#49483E")
        (company-tooltip :background "#49483E")
        (company-template-field :background "#49483E")
        (company-tooltip-annotation :background "#49483E")

        ;;Line number
        (linum :foreground "#75715E" :weight normal)
        (linum-relative-current-face :background "#272822" :foreground "#75715E" :weight normal)

        ;;misc
        (lazy-highlight :background "#A19C70")
        (isearch :background "#74AD00")
        (git-gutter+-unchanged :background "#49483E")
        (git-gutter:unchanged :background "#49483E")))))

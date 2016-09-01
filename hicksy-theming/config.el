(configuration-layer/declare-layer
 '(theming :variables
     theming-modifications

     '((gruvbox

        ;;Helm
        (helm-source-header :background "#3c3836")

        ;;Line number modifications
        (linum-relative-current-face :background "#282828"))

     (monokai

      ;;Modeline modifications

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

        ;;Line number modifications
        (linum :foreground "#75715E")
        (linum-relative-current-face :background "#272822" :foreground "#75715E")

        ;;misc
        (lazy-highlight :background "#A19C70")
        (isearch :background "#5A7523")
        (git-gutter+-unchanged :background "#49483E")
        (git-gutter:unchanged :background "#49483E")))))

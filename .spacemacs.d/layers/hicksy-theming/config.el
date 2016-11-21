;; (configuration-layer/declare-layer
;;  '(theming :variables

(setq-default 
   theming-modifications

     '((gruvbox

        ;;Helm
        (helm-source-header :background "#3c3836" :weight bold)
        (helm-buffer-file :foreground "#fdf4c1") (helm-ff-file :foreground "#fdf4c1")
        (helm-buffer-size :foreground "#fdf4c1")

        ;;company
        (company-preview :background "#504945")
        (company-tooltip-common :underline nil)
        (company-preview-common :underline nil)
        (company-tooltip-common-selection :underline nil)

        ;;erc
        (erc-prompt-face :background "#282828" :foreground "Green")
        (erc-input-face :foreground "#fe8019")

        ;;Modeline
        (header-line :background "#282828")
        (mode-line-inactive :foreground "#d5c4a1" :background "#504945")
        (powerline-active1 :foreground "#d5c4a1" :background "grey22")
        (powerline-inactive1 :foreground "#d5c4a1" :background "grey22")
        (powerline-active2 :foreground "#d5c4a1" :background "grey40")
        (powerline-inactive2 :foreground "#d5c4a1" :background "grey40")

        ;;Line number
        (linum :background "#282828" :foreground "#7c6f64" :weight normal)
        (linum-relative-current-face :background "#282828" :foreground "#7c6f64" :weight normal))

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
        (helm-selection-line :underline nil)
        (helm-source-header :weight bold))

       (monokai

        ; Modeline
        (header-line :background "#272822" :box nil)
        (mode-line-inactive :foreground "#F8F8F0" :background "#49483E")
        (powerline-inactive1 :foreground "#F8F8F0" :background "#35331D")
        (powerline-inactive2 :foreground "#F8F8F0" :background "#272822")

        ;; ;;selection/helm
        ;; (hl-line :background "#49483E")
        ;; (helm-selection :background "#49483E")
        ;; (helm-selection-line :background "#49483E")
        ;; (helm-lisp-show-completion :background "#49483E")
        ;; (helm-candidate-number :background "#49483E")

        ;; ;;company
        ;; (company-preview :background "#49483E")
        ;; (company-tooltip :background "#49483E")
        (company-tooltip-common :underline nil)
        (company-preview-common :underline nil)
        (company-tooltip-common-selection :underline nil)
        ;; (company-template-field :background "#49483E")
        ;; (company-tooltip-annotation :background "#49483E")

        ;; ;;Line number
        (linum :foreground "#75715E" :weight normal)
        (linum-relative-current-face :background "#272822" :foreground "#75715E" :weight normal)

        ;; ;;org
        (org-block-begin-line :background "#272822")
        (org-block :background "#272822")
        (org-block-end-line :background "#272822"))))

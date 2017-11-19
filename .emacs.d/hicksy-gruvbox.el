(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox t)
  (custom-theme-set-faces
   'gruvbox
   '(mode-line ((t(:background "#504945"))))
   '(mode-line-inactive ((t(:background "#383432" :foreground "#a89984"))))
   '(sml/filename ((t(:foreground "#fe8019" :weight normal))))
   '(sml/modes ((t(:foreground "#fe8019"))))
   '(sml/line-number ((t(:foreground "#fdf4c1"))))

   '(company-preview ((t(:background "#504945"))))
   '(company-tooltip-common ((t(:underline nil))))
   '(company-preview-common ((t(:underline nil))))
   '(company-tooltip-common-selection ((t(:underline nil))))

   '(org-block-begin-line ((t(:foreground "#7c6f64"))))
   '(org-block ((t(:foreground "#fdf4c1"))))
   '(org-block-end-line ((t(:foreground "#7c6f64"))))

   '(erc-prompt-face ((t(:background "#282828" :foreground "Green"))))
   '(erc-input-face ((t(:foreground "#fe8019"))))

   '(show-paren-match ((t (:foreground "#ff0000"))))

   '(ivy-current-match((t (:background "#504945"))))

   '(linum ((t(:background "#282828" :foreground "#7c6f64" :weight normal))))
   '(linum-relative-current-face ((t(:background "#282828" :foreground "#7c6f64" :weight normal))))))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (custom-theme-set-faces
   'doom-one

   '(ivy-virtual ((t(:foreground "#5B6268"))))
   
   '(show-paren-match ((t(:background "#282c34" :foreground "#ff6c6b"))))

   '(sml/prefix ((t(:foreground "#ECBE7B"))))
   '(sml/minor-modes ((t(:foreground "#bbc2cf"))))
   '(sml/line-number ((t(:foreground "#bbc2cf"))))
   '(sml/col-number ((t(:foreground "#bbc2cf"))))
   '(sml/position-percentage ((t(:foreground "#bbc2cf"))))
   '(sml/filename ((t(:foreground "#51afef"))))))

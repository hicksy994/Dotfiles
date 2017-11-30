(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (custom-theme-set-faces
   'doom-one

   '(ivy-minibuffer-match-face-1 ((t(:foreground "#52565c"))))
   '(ivy-minibuffer-match-face-2 ((t(:foreground "#c678dd"))))
   '(ivy-minibuffer-match-face-3 ((t(:foreground "#98be65"))))
   '(ivy-minibuffer-match-face-4 ((t(:foreground "#ECBE7B"))))
   '(ivy-virtual ((t(:foreground "#5B6268"))))
   
   '(show-paren-match ((t(:background "#282c34" :foreground "#ff6c6b"))))

   '(sml/prefix ((t(:foreground "#ECBE7B"))))
   '(sml/minor-modes ((t(:foreground "#bbc2cf"))))
   '(sml/line-number ((t(:foreground "#bbc2cf"))))
   '(sml/col-number ((t(:foreground "#bbc2cf"))))
   '(sml/position-percentage ((t(:foreground "#bbc2cf"))))
   '(sml/filename ((t(:foreground "#51afef"))))

   ;; '(mode-line ((t(:background "#1c1e24" :foreground "#bbc2cf"))))
   ;; '(mode-line-inactive ((t(:background "#1d2026" :foreground "#545668"))))))
   '(mode-line ((t(:background "#393F4D" :foreground "#bbc2cf"))))
   '(mode-line-inactive ((t(:background "#1c1e24" :foreground "#545668"))))))

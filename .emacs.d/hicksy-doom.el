(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (custom-theme-set-faces
   'doom-one

   '(linum-relative-current-face ((t(:background "#282c34" :foreground "#bbc2cf"))))

   '(ivy-minibuffer-match-face-1 ((t(:foreground "#52565c"))))
   '(ivy-minibuffer-match-face-2 ((t(:foreground "#c678dd"))))
   '(ivy-minibuffer-match-face-3 ((t(:foreground "#98be65"))))
   '(ivy-minibuffer-match-face-4 ((t(:foreground "#ECBE7B"))))
   '(ivy-virtual ((t(:foreground "#5B6268"))))

   '(show-paren-match ((t(:background "#282c34" :foreground "#ff6c6b"))))

   '(powerline-active2 ((t(:background "#21252B"))))
   '(powerline-inactive2 ((t(:background "#21252B"))))

   '(org-todo ((t(:background "#282c34" :foreground "#c678dd" :weight bold))))
   '(org-level-1 ((t(:background "#282c34" :foreground "#51afef" :weight semi-bold))))
   '(org-level-2 ((t(:background "#282c34" :foreground "#a9a1e1" :weight semi-bold))))
   '(org-level-3 ((t(:background "#282c34" :foreground "#98be65" :weight semi-bold))))))

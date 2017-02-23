;; Ici, les modification de commandes prévues pour modifier emacs

;; Objectifs:
;;   - Reperer les quelques commandes que j'utilise sans arrêt
;;   - Re-mapper les quelques commandes que j'utilise sans arrêt
;;   - Pouvoir passer à une disposition emacs pour BÉPO aisément
;;   - Un déplacement dans le fichier à la vim, peut-être


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Deplacement main droite ;;;;;;   OK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Déplacement avec grain 1:
(global-set-key [?\C-o] 'move-beginning-of-line)
(global-set-key [?\C-t] 'backward-char)
(global-set-key [?\C-r] 'next-line)
(global-set-key [?\C-s] 'previous-line)
(global-set-key [?\C-n] 'forward-char)
(global-set-key [?\C-v] 'move-end-of-line)

;; Déplacement avec grain 2:
(global-set-key [?\M-o] 'beginning-of-buffer)
(global-set-key [?\M-t] 'backward-word)
(global-set-key [?\M-r] (lambda () (interactive) (next-line 14)))
(global-set-key [?\M-s] (lambda () (interactive) (previous-line 14)))

(global-set-key [?\M-n] 'forward-word)
(global-set-key [?\M-v] 'end-of-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Suppression main droite ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [?\C-'] 'grep-find)

(global-set-key [?\C-q] 'delete-char)
(global-set-key [?\M-q] 'kill-word)

(global-set-key [?\C-g] 'kill-whole-line)
(global-set-key [?\M-g] 'kill-region)

(global-set-key [?\C-f] 'isearch-forward)
(global-set-key [?\M-f] 'isearch-forward-regexp)

(global-set-key [?\C-h] 'query-replace)
(global-set-key [?\M-h] 'query-replace-regexp)

(global-set-key [?\C-l] 'yank)
(global-set-key [?\M-l] 'kill-ring-save)



;autocompletion ou center curseur
(global-set-key [?\C-d] 'dabbrev-expand)
(global-set-key [?\M-d] 'recenter-top-bottom)



;indent region
(global-set-key [?\C-k] 'indent-rigidly-1)
(global-set-key (kbd "C-S-K") 'outdent-rigidly-1)


;comment-region et uncomment-region
(global-set-key [?\C-z] 'comment-region)
(global-set-key [?\M-z] 'uncomment-region)

;goto et "repeat X times"
(global-set-key [?\M-w] 'goto-line)
(global-set-key [?\C-w] 'universal-argument)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Touches Fx, deux mains ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;main gauche: Macros, repetition et minibuffer (commandes)
(global-set-key [f1] 'kmacro-start-macro) 
(global-set-key [f2] 'kmacro-end-and-call-macro)
(global-set-key [f3] 'repeat)
(global-set-key [f4] 'execute-extended-command)
(global-set-key [f5] 'keyboard-escape-quit)

;main droite: undo, compilation, extinction d'emacs et help
(global-set-key [f6] 'text-scale-increase)
(global-set-key [C-f6] 'text-scale-decrease)

(global-set-key [f7] 'undo)
(global-set-key [f8] 'next-error)
(global-set-key [f9] 'compile)
(global-set-key [f11] 'save-buffers-kill-terminal)
(global-set-key [f12] 'help-for-help)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Buffers main gauche ;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ligne de repos auie,
(global-set-key [?\C-p] 'write-print)
(global-set-key [?\C-e] 'other-window)
(global-set-key [?\M-e] 'previous-buffer)

;; ligne au dessus du repos bépoè
(global-set-key [?\C-b] 'delete-window)
(global-set-key [?\M-b] 'delete-other-windows)
(global-set-key [?\C-u] 'split-window-horizontally)
(global-set-key [?\M-u] 'split-window-vertically)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fichiers main gauche ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Sous ligne de repos auie,
(global-set-key [?\C-y] 'save-buffer)

(global-set-key [?\C-a] 'find-file)
(global-set-key [?\M-a] 'kill-buffer)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Comportement logique pour les flèches, supr et backspace ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;ESPACE
(global-set-key [C-space] 'set-mark-command)
(global-set-key [M-space] 'mark-whole-buffer)


;; Déplacement avec les différents grains: (haut bas gauche droite avec C- et M-)
;;    caractère : gauche droite ;;NATIF
;;    mot : ctrl + gauche droite
(global-set-key [C-left] 'backward-word)
(global-set-key [C-right] 'forward-word)

;;    debut/fin ligne : alt + gauche droite
(global-set-key [M-left] 'beginning-of-line)
(global-set-key [M-right] 'end-of-line)

;;    ligne : haut bas ;;NATIF
;;    paragraphe : ctrl + haut bas ;;NATIF
;;    début/fin de texte : alt + haut bas
(global-set-key [M-up] 'beginning-of-buffer)
(global-set-key [M-down] 'end-of-buffer)

;;    Scroll Up/Scroll down : ;;NATIF page up&donw


;; Suppression avec différents grains: backspace et del
;;    Vers l'avant/ vers l'arrière:
;;      caractère :
(global-set-key [delete] 'delete-char) ;; avant
(global-set-key (kbd "DEL") 'delete-backward-char) ;; arrière
;;(global-set-key [backspace] 'backward-delete-char-untabify) 
;;      mot
(global-set-key [C-delete] 'kill-word) ;; avant
(global-set-key [C-backspace] 'backward-kill-word) ;; arrière

;;      reste de la ligne
(global-set-key [M-delete] 'backward-kill-line) ;; avant
(global-set-key [M-backspace] 'kill-line) ;; arrière

(global-set-key (kbd "RET") 'newline-and-indent) ;; arrière

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bonux ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)

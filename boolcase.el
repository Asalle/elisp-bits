(defvar boolscase-mode-words '("true" "false")
  "Words to capitalize")

(defun boolcase-mode-check ()
  (message "wo")
  (if (= last-command-event 101)
  (boolcase-mode-fix)))

(defun boolcase-mode-fix()
  (message "hello")
  (save-excursion
    (copy-region-as-kill (point) (progn (backward-sexp) (point)))
  (when (member (current-kill 0) boolscase-mode-words)
    (capitalize-word 1))
  ;; remove the element we just saved from kill ring
  (setq kill-ring (cdr kill-ring))))

(define-minor-mode boolcase-mode
  "Auto capitalize booleans"
  :lighter " BC"

  (if boolcase-mode
      (add-hook 'post-self-insert-hook
                'boolcase-mode-check nil  t)
    (remove-hook 'post-self-insert-hook 'boolcase-mode-check t)))


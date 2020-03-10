(setq my-name 9)

(setq my-list '(1 2 3 4 5 6 7 8 9))

(dolist (el my-list)
  (when (= (mod el 2) 0)
    (message (number-to-string el))))

(let (some-var)
  (when (null some-var)
    (message "var is null"))
  )

(let ((some-var 0)
      (other-var 1))
  (if (null some-var)
      (progn
      (message "not supposed to happen"))
    (message "yay"))
  )

(defun sum-events (some-list)
  (let ((sum 0))
    (dolist (el some-list)
      (when (= (mod el 2) 0)
        (setq sum (+ sum el))
        )
      )
    sum
    ))

(sum-events my-list)

(require 'ert)

(ert-deftest sum-events-test ()
  (should (= (sum-events '(1 3 5 7)) 0))
  (should (= (sum-events '(2 4 6)) 12)))

(setq new-list '(1 2 3 4))

(defun cheap-count-words()
  (interactive)
  (let ((words 0))
    (save-excursion
    (goto-char (point-min))
    (while (forward-word)
      (setq words (1+ words))))
    (message (format "Words in buffer: %s" words))
    words))

(ert-deftest conunt-words-test()
  (get-buffer-create "*test*")
  (with-current-buffer "*test*"
    (erase-buffer)
    (insert "Hello world")
    (should (= (cheap-count-words) 2))
    )
  (kill-buffer "*test*"))

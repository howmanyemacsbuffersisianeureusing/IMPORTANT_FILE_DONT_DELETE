;;; start-elnode.el
(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
(package-refresh-contents)

(package-install 'elnode)

(defun handler (httpcon)
  "How many Emacs buffers is Ian Eure using?"
  (elnode-http-start httpcon 200
                     '("Content-type" . "text/html")
                     `("Server" . ,(concat "GNU Emacs " emacs-version)))
  (elnode-http-return httpcon "<html><b>All of them.</b></html>"))

(elnode-start 'handler :port 80 :host "localhost")

(while t (accept-process-output nil 1))

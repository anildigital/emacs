;; This defines the password variables below
(when (file-exists-p "~/.private.el")
  (load-file "~/.private.el"))

(setq circe-network-defaults nil)

(setq circe-network-options
      `(
        ("Freenode (Elitebnc)"
         :host "alpha.elitebnc.org"
         :tls t
         :port 1338
         :nick "adgtl"
         :channels (:after-auth "#fauna" "#webrtc")
         :nickserv-password, freenode-password
         :pass, server-password
         :nickserv-ghost-command "PRIVMSG NickServ :GHOST {nick} {password}"
         :nickserv-ghost-confirmation "has been ghosted\\.$\\|is not online\\.$"
         )

        ))

(setq circe-use-cycle-completion t)

(setq circe-reduce-lurker-spam t)

(enable-circe-color-nicks)

(require 'lui-autopaste)
(add-hook 'circe-channel-mode-hook 'enable-lui-autopaste)

(add-hook 'circe-chat-mode-hook 'my-circe-prompt)
(defun my-circe-prompt ()
  (lui-set-prompt
   (concat (propertize (concat (buffer-name) ">")
                       'face 'circe-prompt-face)
           " ")))

(setq circe-format-say "{nick:-16s} {body}")

(load "lui-logging" nil t)
(enable-lui-logging-globally)


(setq lui-track-bar-behavior 'before-switch-to-buffer)
(enable-lui-track-bar)

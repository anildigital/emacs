;;; scpaste.el --- Paste to the web via scp.

;; Copyright (C) 2008 Phil Hagelberg

;; Author: Phil Hagelberg
;; URL: http://www.emacswiki.org/cgi-bin/wiki/SCPaste
;; Version: 0.4
;; Created: 2008-04-02
;; Keywords: convenience hypermedia
;; EmacsWiki: SCPaste
;; Package-Requires: ((htmlfontify "0.21"))

;; This file is NOT part of GNU Emacs.

;;; Pasted Files

;; * <http://p.hagelb.org/130.html>
;; * <http://p.hagelb.org/134.yml.html>
;; * <http://p.hagelb.org/1.3-hopes-and-dreams.html>
;; * <http://p.hagelb.org/anagrams.html>
;; * <http://p.hagelb.org/ant-diagnostics.html>
;; * <http://p.hagelb.org/applet.clj.html>
;; * <http://p.hagelb.org/ar_postgres.html>
;; * <http://p.hagelb.org/*Article*.html>
;; * <http://p.hagelb.org/ary.duby.html>
;; * <http://p.hagelb.org/backup.clj.html>
;; * <http://p.hagelb.org/base.clj.html>
;; * <http://p.hagelb.org/bingo.clj.html>
;; * <http://p.hagelb.org/bizarre-bindings.html>
;; * <http://p.hagelb.org/bludgeon.rb.html>
;; * <http://p.hagelb.org/bludgeon-rspec.html>
;; * <http://p.hagelb.org/bork.clj.html>
;; * <http://p.hagelb.org/break.clj.html>
;; * <http://p.hagelb.org/bughunt.clj.html>
;; * <http://p.hagelb.org/bus_johnson.html>
;; * <http://p.hagelb.org/check.clj.html>
;; * <http://p.hagelb.org/ci-role.rb.html>
;; * <http://p.hagelb.org/classpath.html>
;; * <http://p.hagelb.org/cleanup.html>
;; * <http://p.hagelb.org/clj-monkey.html>
;; * <http://p.hagelb.org/clj-pretty-fn.html>
;; * <http://p.hagelb.org/clj-stacktrace-monkeypatch.html>
;; * <http://p.hagelb.org/clojars-success.html>
;; * <http://p.hagelb.org/clojure-gem-error.html>
;; * <http://p.hagelb.org/clojure-test-run-test.html>
;; * <http://p.hagelb.org/collect-not-found.html>
;; * <http://p.hagelb.org/comment_cgi.html>
;; * <http://p.hagelb.org/comment.cgi.html>
;; * <http://p.hagelb.org/comments.html>
;; * <http://p.hagelb.org/conj-2010-slides.html>
;; * <http://p.hagelb.org/conj-2010-slides.org.html>
;; * <http://p.hagelb.org/conj-outline.html>
;; * <http://p.hagelb.org/conj-slides.org.html>
;; * <http://p.hagelb.org/conkeror-snippets.html>
;; * <http://p.hagelb.org/contrib-test.html>
;; * <http://p.hagelb.org/contrib-usage.html>
;; * <http://p.hagelb.org/contributing.yml.html>
;; * <http://p.hagelb.org/couch.clj.html>
;; * <http://p.hagelb.org/coverage.clj.html>
;; * <http://p.hagelb.org/crashy.rb.html>
;; * <http://p.hagelb.org/crazy-sql.html>
;; * <http://p.hagelb.org/delete-file-recursively.html>
;; * <http://p.hagelb.org/dex-trouble.html>
;; * <http://p.hagelb.org/distcp-fresh.log.html>
;; * <http://p.hagelb.org/dnssd-fai.html>
;; * <http://p.hagelb.org/dnssd-fail.html>
;; * <http://p.hagelb.org/draft.html>
;; * <http://p.hagelb.org/duby-inference.html>
;; * <http://p.hagelb.org/durendal.el.html>
;; * <http://p.hagelb.org/each.duby.html>
;; * <http://p.hagelb.org/editors.textile.html>
;; * <http://p.hagelb.org/elasticsearch.in.sh.html>
;; * <http://p.hagelb.org/elpa-conversation.html>
;; * <http://p.hagelb.org/elpa-please.html>
;; * <http://p.hagelb.org/emacs-23-news.html>
;; * <http://p.hagelb.org/emacs-chatter.html>
;; * <http://p.hagelb.org/emacs-encodings.html>
;; * <http://p.hagelb.org/emacs-is.html>
;; * <http://p.hagelb.org/emerginglangs.org.html>
;; * <http://p.hagelb.org/emms-for-dummies.html>
;; * <http://p.hagelb.org/endpoint-log.html>
;; * <http://p.hagelb.org/eoau.html>
;; * <http://p.hagelb.org/erc-notify.html>
;; * <http://p.hagelb.org/eshell-sudo-disable.html>
;; * <http://p.hagelb.org/eshell-vc.el.html>
;; * <http://p.hagelb.org/esk-recentf-ido-find-file.html>
;; * <http://p.hagelb.org/es-log.el.html>
;; * <http://p.hagelb.org/es-slf4j-error.html>
;; * <http://p.hagelb.org/eval-in-project-customizations.html>
;; * <http://p.hagelb.org/example.rb.html>
;; * <http://p.hagelb.org/extract-jar.html>
;; * <http://p.hagelb.org/fib.clj.html>
;; * <http://p.hagelb.org/find-file-in-project.el.html>
;; * <http://p.hagelb.org/find-native.clj.html>
;; * <http://p.hagelb.org/flickr-downloader.clj.html>
;; * <http://p.hagelb.org/function%20prettiness%20for%20JS.html>
;; * <http://p.hagelb.org/Garrett.duby.html>
;; * <http://p.hagelb.org/GarrettView.duby.html>
;; * <http://p.hagelb.org/Garrett-with-initialize.duby.html>
;; * <http://p.hagelb.org/gem-versions.html>
;; * <http://p.hagelb.org/github-langs.clj.html>
;; * <http://p.hagelb.org/gnus.el.html>
;; * <http://p.hagelb.org/griva.org.html>
;; * <http://p.hagelb.org/hadoop-phil-datanode-enigma.log.html>
;; * <http://p.hagelb.org/hmac-nil.html>
;; * <http://p.hagelb.org/hooke.clj.html>
;; * <http://p.hagelb.org/hooke-readme.html>
;; * <http://p.hagelb.org/hook-prepend.html>
;; * <http://p.hagelb.org/http-client-send-body.html>
;; * <http://p.hagelb.org/http-fail.html>
;; * <http://p.hagelb.org/idle-highlight.el.html>
;; * <http://p.hagelb.org/implementing-filters.txt.html>
;; * <http://p.hagelb.org/import-indent.html>
;; * <http://p.hagelb.org/import-riak-trace.html>
;; * <http://p.hagelb.org/index.el.html>
;; * <http://p.hagelb.org/index.html>
;; * <http://p.hagelb.org/indexing.rb.html>
;; * <http://p.hagelb.org/index.rhtml.html>
;; * <http://p.hagelb.org/init.el.html>
;; * <http://p.hagelb.org/init-packages.html>
;; * <http://p.hagelb.org/inner-class.html>
;; * <http://p.hagelb.org/interview.html>
;; * <http://p.hagelb.org/io.clj.html>
;; * <http://p.hagelb.org/jabber-agent.el.html>
;; * <http://p.hagelb.org/jack-error.html>
;; * <http://p.hagelb.org/jclouds-ex.html>
;; * <http://p.hagelb.org/johnson-diff.html>
;; * <http://p.hagelb.org/johnson-gc.html>
;; * <http://p.hagelb.org/jruby_postgres.rb.html>
;; * <http://p.hagelb.org/json-diff.html>
;; * <http://p.hagelb.org/junit-out.html>
;; * <http://p.hagelb.org/juxt.html>
;; * <http://p.hagelb.org/katta-mail.html>
;; * <http://p.hagelb.org/katta-realtime.html>
;; * <http://p.hagelb.org/knife-aliases.html>
;; * <http://p.hagelb.org/lambda.sh.html>
;; * <http://p.hagelb.org/lance-cake.html>
;; * <http://p.hagelb.org/lancet.clj.html>
;; * <http://p.hagelb.org/leiningen%2fsearch.clj.html>
;; * <http://p.hagelb.org/leiningen.clj.html>
;; * <http://p.hagelb.org/leiningen.html>
;; * <http://p.hagelb.org/lein-mock.html>
;; * <http://p.hagelb.org/lein-new.html>
;; * <http://p.hagelb.org/lein-push.html>
;; * <http://p.hagelb.org/lein-readme.html>
;; * <http://p.hagelb.org/lein-search.html>
;; * <http://p.hagelb.org/lein-swank.html>
;; * <http://p.hagelb.org/lobbyists.html>
;; * <http://p.hagelb.org/locals.clj.html>
;; * <http://p.hagelb.org/locate-dominating-file.html>
;; * <http://p.hagelb.org/log4j-change.txt.html>
;; * <http://p.hagelb.org/log4j.properties.html>
;; * <http://p.hagelb.org/mac-ray.html>
;; * <http://p.hagelb.org/*magit%3a%20rdoc*.html>
;; * <http://p.hagelb.org/*magit-log*.html>
;; * <http://p.hagelb.org/magit-marmalade.html>
;; * <http://p.hagelb.org/manifest.diff.html>
;; * <http://p.hagelb.org/mars_status.html>
;; * <http://p.hagelb.org/maven.clj.html>
;; * <http://p.hagelb.org/MavenEmbedderTest.java.html>
;; * <http://p.hagelb.org/maven-fail.html>
;; * <http://p.hagelb.org/max.ds.html>
;; * <http://p.hagelb.org/merb_test_helper.rb.html>
;; * <http://p.hagelb.org/metadata-on-aliases.html>
;; * <http://p.hagelb.org/meta-exception.html>
;; * <http://p.hagelb.org/metal.html>
;; * <http://p.hagelb.org/min-init.el.html>
;; * <http://p.hagelb.org/mirah-committers.html>
;; * <http://p.hagelb.org/mirah-todo.org.html>
;; * <http://p.hagelb.org/mire-1-year.html>
;; * <http://p.hagelb.org/mire-project.clj.html>
;; * <http://p.hagelb.org/mock.clj.html>
;; * <http://p.hagelb.org/mock-hook.html>
;; * <http://p.hagelb.org/mpd-ido.el.html>
;; * <http://p.hagelb.org/mvn-swank.el.html>
;; * <http://p.hagelb.org/mvn-swank.html>
;; * <http://p.hagelb.org/my-eshell.el.html>
;; * <http://p.hagelb.org/my-irc.el.html>
;; * <http://p.hagelb.org/my-ruby.el.html>
;; * <http://p.hagelb.org/namespaces.clj.html>
;; * <http://p.hagelb.org/nerd-puns.html>
;; * <http://p.hagelb.org/NEWS.html>
;; * <http://p.hagelb.org/notify.rb.html>
;; * <http://p.hagelb.org/nxhtml-dark.html>
;; * <http://p.hagelb.org/odd-failure.html>
;; * <http://p.hagelb.org/Ohai.duby.html>
;; * <http://p.hagelb.org/opscode-user.html>
;; * <http://p.hagelb.org/oscon-2011.org.html>
;; * <http://p.hagelb.org/oscon-clojure.org.html>
;; * <http://p.hagelb.org/overlay-page-break.html>
;; * <http://p.hagelb.org/package.el.html>
;; * <http://p.hagelb.org/package-init.html>
;; * <http://p.hagelb.org/package-maint.el.html>
;; * <http://p.hagelb.org/package-steps.html>
;; * <http://p.hagelb.org/package-test.el.html>
;; * <http://p.hagelb.org/packer-error.html>
;; * <http://p.hagelb.org/pack_file.clj.html>
;; * <http://p.hagelb.org/pairing-bot.html>
;; * <http://p.hagelb.org/paredit-outline.html>
;; * <http://p.hagelb.org/paredit-screencast.html>
;; * <http://p.hagelb.org/paredit-script.html>
;; * <http://p.hagelb.org/parkplace-models.rb.html>
;; * <http://p.hagelb.org/pcmpl-ssh-config.patch.html>
;; * <http://p.hagelb.org/peepcode.txt.html>
;; * <http://p.hagelb.org/phil.el.html>
;; * <http://p.hagelb.org/pindah-todo.html>
;; * <http://p.hagelb.org/pkg-el.html>
;; * <http://p.hagelb.org/planet-caboose-logs.html>
;; * <http://p.hagelb.org/possibly-not-dans-error.html>
;; * <http://p.hagelb.org/postgresql.conf.html>
;; * <http://p.hagelb.org/project.clj.html>
;; * <http://p.hagelb.org/project-local-variables.el.html>
;; * <http://p.hagelb.org/proposal-clojure-io.html>
;; * <http://p.hagelb.org/proposal.html>
;; * <http://p.hagelb.org/proposal.txt.html>
;; * <http://p.hagelb.org/purge-log.html>
;; * <http://p.hagelb.org/queue-backup.html>
;; * <http://p.hagelb.org/queues.html>
;; * <http://p.hagelb.org/rack-errors.html>
;; * <http://p.hagelb.org/rackspace-search0.html>
;; * <http://p.hagelb.org/Rakefile.html>
;; * <http://p.hagelb.org/range-pred.html>
;; * <http://p.hagelb.org/rcirc-config.el.html>
;; * <http://p.hagelb.org/rdoc-diff.html>
;; * <http://p.hagelb.org/rdoc-gem-error.html>
;; * <http://p.hagelb.org/rdoc-template.html>
;; * <http://p.hagelb.org/rdoc_texinfo.rb.html>
;; * <http://p.hagelb.org/README.katta.html>
;; * <http://p.hagelb.org/README.md.html>
;; * <http://p.hagelb.org/recentf-ido.html>
;; * <http://p.hagelb.org/recursive-tramp.html>
;; * <http://p.hagelb.org/remote-slime.html>
;; * <http://p.hagelb.org/repeats.html>
;; * <http://p.hagelb.org/riak-docs.html>
;; * <http://p.hagelb.org/ri_repl.html>
;; * <http://p.hagelb.org/rms-delay.html>
;; * <http://p.hagelb.org/rockhands.html>
;; * <http://p.hagelb.org/rs-queues.clj.html>
;; * <http://p.hagelb.org/rubyconf-09.html>
;; * <http://p.hagelb.org/rudel-install.html>
;; * <http://p.hagelb.org/rudel-launch.html>
;; * <http://p.hagelb.org/sample-run.html>
;; * <http://p.hagelb.org/scpaste.el.html>
;; * <http://p.hagelb.org/scpaste-region.html>
;; * <http://p.hagelb.org/scp-no-colon-alias.html>
;; * <http://p.hagelb.org/*scratch*.html>
;; * <http://p.hagelb.org/screw%2fmaven.clj.html>
;; * <http://p.hagelb.org/settings.xml.html>
;; * <http://p.hagelb.org/skip-tests-hook.html>
;; * <http://p.hagelb.org/slam%2fhound.clj.html>
;; * <http://p.hagelb.org/slamhound.clj.html>
;; * <http://p.hagelb.org/slamhound.el.html>
;; * <http://p.hagelb.org/slamhound.html>
;; * <http://p.hagelb.org/slime-fuzzy.el.html>
;; * <http://p.hagelb.org/slime-project.html>
;; * <http://p.hagelb.org/slingshot-dispatch.clj.html>
;; * <http://p.hagelb.org/smtpmail.html>
;; * <http://p.hagelb.org/StatusCodes.java.html>
;; * <http://p.hagelb.org/steersman.el.html>
;; * <http://p.hagelb.org/steersman-stack.html>
;; * <http://p.hagelb.org/stefan-package-.html>
;; * <http://p.hagelb.org/stop-words.html>
;; * <http://p.hagelb.org/strangeloop.org.html>
;; * <http://p.hagelb.org/streamer.rb.html>
;; * <http://p.hagelb.org/stubbs.clj.html>
;; * <http://p.hagelb.org/subclassloader-test-http.html>
;; * <http://p.hagelb.org/swank-clojure-pom.html>
;; * <http://p.hagelb.org/swank-clojure-project.html>
;; * <http://p.hagelb.org/swank-launchers.html>
;; * <http://p.hagelb.org/swank-readme.html>
;; * <http://p.hagelb.org/system-specific-config.html>
;; * <http://p.hagelb.org/tab-alt.patch.html>
;; * <http://p.hagelb.org/tablet.html>
;; * <http://p.hagelb.org/test_at_exit.rb.html>
;; * <http://p.hagelb.org/test-brokenness.html>
;; * <http://p.hagelb.org/test!.clj.html>
;; * <http://p.hagelb.org/test_helper.rb.html>
;; * <http://p.hagelb.org/test-notify-hook.html>
;; * <http://p.hagelb.org/test-unit.el.html>
;; * <http://p.hagelb.org/thomas.clj.html>
;; * <http://p.hagelb.org/thomas.html>
;; * <http://p.hagelb.org/thursday.html>
;; * <http://p.hagelb.org/tlh-resume.txt.html>
;; * <http://p.hagelb.org/tmpCollector.html>
;; * <http://p.hagelb.org/toggle-stylesheets.html>
;; * <http://p.hagelb.org/to_texinfo.rb.html>
;; * <http://p.hagelb.org/truncated.html>
;; * <http://p.hagelb.org/try-defn.clj.html>
;; * <http://p.hagelb.org/use-import-indent.html>
;; * <http://p.hagelb.org/vc-buttons.el.html>
;; * <http://p.hagelb.org/vc-diff.html>
;; * <http://p.hagelb.org/watcher.html>
;; * <http://p.hagelb.org/watcher_in_the_water.rb.html>
;; * <http://p.hagelb.org/watcher.rb.html>
;; * <http://p.hagelb.org/whitespace.html>
;; * <http://p.hagelb.org/whitespace-mode-activate.html>
;; * <http://p.hagelb.org/whitespace-mode-enable.html>
;; * <http://p.hagelb.org/wide_finder.clj.html>
;; * <http://p.hagelb.org/wrong-passwords.html>
;; * <http://p.hagelb.org/wrong-passwords-part2.html>
;; * <http://p.hagelb.org/yay_clip.html>

;;; Commentary:

;; This will place an HTML copy of a buffer on the web on a server
;; that the user has shell access on.

;; It's similar in purpose to services such as http://paste.lisp.org
;; or http://rafb.net, but it's much simpler since it assumes the user
;; has an account on a publicly-accessible HTTP server. It uses `scp'
;; as its transport and uses Emacs' font-lock as its syntax
;; highlighter instead of relying on a third-party syntax highlighter
;; for which individual language support must be added one-by-one.

;;; Install

;; To install, copy this file into your Emacs source directory, set
;; `scpaste-http-destination' and `scpaste-scp-destination' to
;; appropriate values, and add this to your .emacs file:

;; (autoload 'scpaste "scpaste" "Paste the current buffer." t nil)
;; (setq scpaste-http-destination "http://p.hagelb.org"
;;       scpaste-scp-destination "p.hagelb.org:p.hagelb.org")

;;; Usage

;; M-x scpaste, enter a name, and press return. The name will be
;; incorporated into the URL by escaping it and adding it to the end
;; of `scpaste-http-destination'. The URL for the pasted file will be
;; pushed onto the kill ring.

;; You can autogenerate a splash page that gets uploaded as index.html
;; in `scpaste-http-destination' by invoking M-x scpaste-index. This
;; will upload an explanation as well as a listing of existing
;; pastes. If a paste's filename includes "private" it will be skipped.

;; You probably want to set up SSH keys for your destination to avoid
;; having to enter your password once for each paste. Also be sure the
;; key of the host referenced in `scpaste-scp-destination' is in your
;; known hosts file--scpaste will not prompt you to add it but will
;; simply hang.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'url)
(require 'htmlfontify)

(defvar scpaste-http-destination
  "http://p.hagelb.org"
  "Publicly-accessible (via HTTP) location for pasted files.")

(defvar scpaste-scp-destination
  "p.hagelb.org:p.hagelb.org"
  "SSH-accessible directory corresponding to `scpaste-http-destination'.
You must have write-access to this directory via `scp'.")

(defvar scpaste-footer
  (concat "<p style='font-size: 8pt; font-family: monospace;'>Generated by "
          user-full-name
          " using <a href='http://p.hagelb.org'>scpaste</a> at %s. "
          (cadr (current-time-zone)) ". (<a href='%s'>original</a>)</p>")
  "HTML message to place at the bottom of each file.")

;; To set defvar while developing: (load-file (buffer-file-name))
(defvar scpaste-el-location load-file-name)

;;;###autoload
(defun scpaste (original-name)
  "Paste the current buffer via `scp' to `scpaste-http-destination'."
  (interactive "MName (defaults to buffer name): ")
  (let* ((b (save-excursion
              (htmlfontify-buffer)
              (current-buffer)))
         (name (url-hexify-string (if (equal "" original-name)
                                      (buffer-name)
                                    original-name)))
         (full-url (concat scpaste-http-destination "/" name ".html"))
         (scp-destination (concat scpaste-scp-destination "/" name ".html"))
         (scp-original-destination (concat scpaste-scp-destination "/" name))
         (tmp-file (concat temporary-file-directory "/" name)))

    ;; Save the file (while adding footer)
    (save-excursion
      (switch-to-buffer b)
      (goto-char (point-min))
      (search-forward "</body>\n</html>")
      (insert (format scpaste-footer
                      (current-time-string)
                      (substring full-url 0 -5)))
      (write-file tmp-file)
      (kill-buffer b))

    (shell-command (concat "scp " tmp-file " " scp-destination))
    (shell-command (concat "scp " (buffer-file-name (current-buffer))
                           " " scp-original-destination))

    ;; Notify user and put the URL on the kill ring
    (let ((x-select-enable-primary t))
      (kill-new full-url))
    (message "Pasted to %s (on kill ring)" full-url)))

;;;###autoload
(defun scpaste-region (name)
  "Paste the current region via `scpaste'."
  (interactive "MName: ")
  (let ((region-contents (buffer-substring (mark) (point))))
    (with-temp-buffer
      (insert region-contents)
      (scpaste name))))

;;;###autoload
(defun scpaste-index ()
  "Generate an index of all existing pastes on server on the splash page."
  (interactive)
  (let* ((dest-parts (split-string scpaste-scp-destination ":"))
         (files (shell-command-to-string (concat "ssh " (car dest-parts)
                                                 " ls " (cadr dest-parts))))
         (file-list (split-string files "\n")))
    (save-excursion
      (with-temp-buffer
        (insert-file-contents scpaste-el-location)
        (goto-char (point-min))
        (search-forward ";;; Commentary")
        (forward-line -1)
        (insert "\n;;; Pasted Files\n\n")
        (dolist (file file-list)
          (when (and (string-match "\\.html$" file)
                     (not (string-match "private" file)))
            (insert (concat ";; * <" scpaste-http-destination "/" file ">\n"))))
        (emacs-lisp-mode) (font-lock-fontify-buffer) (rename-buffer "SCPaste")
        (write-file "/tmp/scpaste-index")
        (scpaste "index")))))

(provide 'scpaste)
;;; scpaste.el ends here

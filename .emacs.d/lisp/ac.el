(provide 'ac)

;; @TODO: first yum(apt-get|brew) install clang*

;; setup auto complete dic
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/elpa/auto-complete-20150225.715/dict") ;; @TODO: set correct the ac dict path
(ac-config-default)
(global-auto-complete-mode t)  

;; use pos tip
(setq ac-quick-help-prefer-pos-tip t)   ;default is t

;; use quick help
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)

;; tab mode
(setq ac-dwim t)

;; use fuzz
(setq ac-fuzzy-enable t)

;; use yasnip
;; (require 'yasnippet)  
;; (yas/global-mode 1) 

;; use clang
(require 'auto-complete-clang)  
(setq ac-clang-auto-save t)  
(setq ac-auto-start t)  
(setq ac-quick-help-delay 0.5)  
;; (ac-set-trigger-key "TAB")  
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)  
(define-key ac-mode-map  [(control tab)] 'auto-complete)  
(defun my-ac-config ()  
  (setq ac-clang-flags  
        (mapcar(lambda (item)(concat "-I" item))  
               (split-string  ;; @TODO: use '$ echo "" | g++ -v -x c++ -E -' to get include path as below and replace them.
                "  
/usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7
 /usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7/x86_64-redhat-linux
 /usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7/backward
 /usr/local/include
 /usr/lib/gcc/x86_64-redhat-linux/4.4.7/include
 /usr/include
")))  
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))  
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)  
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)  
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)  
  (add-hook 'css-mode-hook 'ac-css-mode-setup)  
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)  
  (global-auto-complete-mode t))  
(defun my-ac-cc-mode-setup ()  
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))  
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)  
;; ac-source-gtags  
(my-ac-config)  
(setq ac-clang-auto-save t)

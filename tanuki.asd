;;;; -*- mode: Lisp -*-
;;;; 
;;;; TODO: bugs in
;;;;   html
;;;;   decide
;;;;

(defpackage :tanuki-asd
  (:use :cl :asdf))
(in-package :tanuki-asd)

;; Tanuki
(defsystem tanuki
  :name "tanuki"
  :version "0.5"
  :author "Seth Carbon <sjcarbon@berkeleybop.org>"
  :maintainer "Seth Carbon <sjcarbon@berkeleybop.org>"
  :licence "Modified BSD"
  :description "Tanuki"
  :long-description "A \"smart\" checker/crawler for web apps."
  :components ((:static-file "tanuki.asd")
               (:module :src
                        :serial t
                        :components (;(:file "forms")
				     ;(:file "file")
				     ;(:file "html")
                                     ;(:file "web")
				     (:file "schema")
				     (:file "db")
				     (:file "db-op")
				     (:file "orm")
				     (:file "decide")
                                     (:file "agent")
                                     (:file "tanuki"))))
  :depends-on (:day-to-day
	       :kappa
	       :cl-ppcre
	       :postmodern
	       ;:s-sysdeps
	       ;:s-http-client
	       :bordeaux-threads
	       :closure-html
	       :trivial-timeout
	       ;:s-xml
	       ;:fiveam
	       :drakma
	       :puri)

  ;;; Replace Albert, maybe with clod.
  ;; ;; And some stuff for Albert...
  ;; :properties ((#:author-email . "sjcarbon@berkeleybop.org")
  ;; 	       (#:date . "Spring 2008")
  ;; 	       ((#:albert #:output-dir) . "docs")
  ;; 	       ((#:albert #:formats) . ("docbook"))
  ;; 	       ((#:albert #:docbook #:template) . "book")
  ;; 	       ((#:albert #:docbook #:bgcolor) . "white")
  ;; 	       ((#:albert #:docbook #:textcolor) . "black"))
)

;; ;; Add tanuki to our features.
;; (defmethod asdf:perform
;;     :after ((op asdf:load-op)
;; 	    (system (eql (asdf:find-system :tanuki))))
;;   (pushnew :tanuki cl:*features*))

;; (defmethod asdf:perform ((o test-op) (c (eql (find-system :tanuki))))
;;   (asdf:operate 'asdf:test-op :tanuki-test))

;; Describe the testing system.
(defsystem :tanuki-test
  :components ((:module :t
                        :serial t
                        :components ((:file "tanuki-test"))))
  :depends-on (:tanuki :fiveam))

;; ;; TODO: Not sure exactly what this magical incanation does, no doubt
;; ;; running tests on load of tanuki.
;; (defmethod asdf:perform ((o test-op) (c (eql (find-system :tanuki-test))))
;;   (asdf:operate 'asdf:load-op :tanuki-test)
;;   (funcall (intern (symbol-name :run-tests)
;;                    (find-package :tanuki-test))))

#!/usr/bin/env bb
;; copy relative symbolic link
;; command name?
;; * cprl
;; * substanciate
;; * mkss -- make substanciate symbolic links
;; * how about sl? too short.
;; * ssl -- switch symbolic links. No good.
;;
;; synopsis: make substanciate symbolic links.
;; require: gcp
;; date: 2021-05-20
;;
;; note: /bin/cp strongly discourages to use -R because it does not
;; correctly copy symbolic links or others. So, gcp.
;;
;; FIXME: error handling

(require '[clojure.string :as str]
         '[clojure.java.shell :as shell])

(defn exec [& cmds]
  (let [ret (apply shell/sh cmds)]
    ;; (prn "cmds: " cmds)
    ;; (prn "red: " ret)
    (zero? (:exit ret))))

(defn cprl [symlink]
  (let [tmp (str (str/replace symlink #"/$" "") ".tmp")]
    ;; (println "tmp: " tmp)
    (and
      (exec "gcp" "-Lr" symlink tmp)
      (exec "rm" symlink)
      (exec "mv" tmp symlink))))

(if (nil? *command-line-args*)
  (println "usage: cprl symlink symlink ...")
  (dorun
   (map cprl *command-line-args*)))

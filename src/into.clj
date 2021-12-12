#!/usr/bin/env bb
;;; synopsis: move files, directories other than me-dir, into me-dir.
;;; usage: into <me-dir>
;;; example:
;;;

(require '[clojure.string :as str]
         '[clojure.java.io :as io]
         '[clojure.java.shell :as shell])

(def entries
  (remove (fn [e] (str/starts-with? e "."))
          (seq (.list (io/file ".")))))

(if-let [me (first *command-line-args*)]
  (let [except-me (remove #(= % me) entries)]
    (dorun (map #(shell/sh "mv" % me) except-me)))
  "move all files/dirs except <dir> into <dir>.
usage: into <dir>")

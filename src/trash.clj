#!/usr/bin/env bb
;;; ## update -2021-09-12
;;; use comment, run! (2021-09-12, hkimura)
;;;
;;; ## 2021-05-14
;;; move files into _trash_ folder.

(ns bb.trash
  (:require [clojure.java.io :as io]
            [clojure.java.shell :as shell]))

;; .trash?
(def ^:dynamic *trash* "_trash_")

(defn- dir-exists?
  [dir]
  (let [d (io/file dir)]
    (and (.exists d) (.isDirectory d))))

(comment
 (dir-exists? "abc")
 (dir-exists? "_trash_"))

(defn- uniq
  "if `dir/name` is not found, return it.
   else check `dir/name-0`, `dir/name-1`, ... and
   returns the first non-existent `dir/name-n`."
  [dir name]
  (let [dest (str dir "/" name)]
    (if-not (.exists (io/file dest))
      dest
      (->> (map #(str dir "/" name "-" %) (range))
           (drop-while #(.exists (io/file %)))
           first))))
(comment
 (uniq "_trash_" "abc")
 (uniq "_trash_" "a"))

(defn trash
  ([name] (trash name *trash*))
  ([name dir]
   (when-not (dir-exists? dir)
    (.mkdir (io/file dir)))
   (shell/sh "mv" name (uniq dir name))))

(comment
 (trash "a")
 (map trash ["b" "c" "c"]))

(run! trash *command-line-args*)


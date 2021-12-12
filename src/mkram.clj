#!/usr/bin/env bb
;; https://www.tais-inc.com/tech/2018/11/11/mac-os-ramdisk.html
;;
;; size = 2048*MB
;;
;; no use since babashka preloaded them.
;; (require '[clojure.java.shell :as shell]
;;          '[clojure.string :as str])

(defn help []
  (println "mkram [size]
  make /Volume/RAM_DISK with size MB.
  if omitted size, 256 is used.

% mkram umount
  umount ramdisk if mounted.

% mkram help
  show this help."))

(defn mb->blocks
  [n]
  (* n 2048 ))

(defn mount
  "make n MB RAM_DISK and mount it on /Volumes/RAM_DISK"
  [n]
  (let [ret (shell/sh "hdid" "-nomount" (str "ram://" (mb->blocks n)))]
    (if (zero? (:exit ret))
       ;; GPT is required.
      (shell/sh
       "diskutil" "eraseDisk" "APFS" "RAM_DISK" "GPT"
       (first (str/split (:out ret) #"\s")))
      (:err ret))))

(defn umount []
  (shell/sh "diskutil" "umount" "/Volumes/RAM_DISK"))

(let [[arg _] *command-line-args*]
  (cond
    (nil? arg) (mount 256)
    (re-matches #"\d+" arg) (mount (Integer/parseInt arg))
    (= arg "help") (help)
    (= arg "umount") (umount)
    (= arg "unmount") (umount)
    :else (help)))

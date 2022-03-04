#!/usr/bin/env bb
;;;
;;; origin: ${dotfiles}/utils/wol.clj
;;;
;;; usage: wol [on|off|status] host1 host2 ...
;;;        wol list
;;;        wol help
;;;
;;; See README.md and CHANGELOG.md

(require '[clojure.java.shell :as shell]
         '[clojure.edn :as edn])

(defn- usage []
  (println "usage: wol [on|off|status] host1 host2 ...")
  (println "       wol list")
  (println "       wol [help|version]"))

(def ^:private version "0.2.0")

(def ^:private configs
  (edn/read-string (slurp (str (System/getenv "HOME") "/clojure/wol.edn"))))

(defn- ping?
  "ping to `host` `count` times, wait `timeout` seconds."
  ([host] (ping? host 1))
  ([host count] (ping? host count 1))
  ([host count timeout]
   (= 0 (:exit (shell/sh "ping" host
                         "-c" (str count)
                         "-t" (str timeout))))))

(defn- wakeup?
  "print '.' until `host` wakes up."
  [host]
  (loop [st false]
    (if-not st
      (do
        (print ".")
        (flush)
        (recur (ping? host)))
      (println host "wakes up."))))

(defn- verb [& args] (keyword (first args)))

(defmulti wol verb)

(defmethod wol :on [_ {:keys [name mac]}]
  (if (ping? name)
    "already on"
    (and
     (shell/sh "wakeonlan" mac)
     (wakeup? name))))

(defmethod wol :off [_ {:keys [name off]}]
  (if (ping? name)
    (shell/sh "ssh" name off)
    "sleeping"))

(defmethod wol :status [_ {:keys [name]}]
  (ping? name))

(defmethod wol :default [_ _] (usage))

(let [[verb & hosts] *command-line-args*]
  (case verb
    "help" (usage)
    "list" (keys configs)
    "version" version
    (pmap #(wol verb (configs %)) hosts)))

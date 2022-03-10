#!/usr/bin/env bb
;;;
;;; origin: ${dotfiles}/utils/wol.clj
;;;
;;; usage: wol [on|up|off|down|status] host1 host2 ...
;;;        wol list
;;;        wol help
;;;        wol version
;;; See README.md and CHANGELOG.md

(require '[clojure.java.shell :as shell]
         '[clojure.edn :as edn])

(defn- usage []
  (println "usage: wol [on|off|status] host1 host2 ...")
  (println "       wol [list|help|version]"))

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
  "print '.' until `(ping? host)` returns true."
  [host]
  (loop [st false]
    (if-not st
      (do
        (print ".")
        (flush)
        (recur (ping? host)))
      (println host "wakes up."))))

(defn- up [name mac]
  (if (ping? name)
    "already on"
    (and
     (shell/sh "wakeonlan" mac)
     (wakeup? name))))

(defn- down [name off]
  (if (ping? name)
    (shell/sh "ssh" name off)
    "sleeping"))

(defn- verb [& args] (keyword (first args)))

(defmulti wol verb)

(defmethod wol :on [_ {:keys [name mac]}]
  (up name mac))

(defmethod wol :up [_ {:keys [name mac]}]
  (up name mac))

(defmethod wol :off [_ {:keys [name off]}]
  (down name off))

(defmethod wol :down [_ {:keys [name off]}]
  (down name off))

(defmethod wol :status [_ {:keys [name]}]
  (ping? name))

(defmethod wol :default [_ _] (usage))

(let [[verb & hosts] *command-line-args*]
  (case verb
    "help" (usage)
    "list" (keys configs)
    "version" version
    (pmap #(wol verb (configs %)) hosts)))

#!/usr/bin/env bb
;;; create html from c source.
;;; `c2html.clj hello.c` will produce `hello.html`
;;;
;;; require: babashka, asciidoctor

(defn basename [file]
  (first (str/split file #"\.")))

(defn c2adoc [file]
  (let [out (str (basename file) ".adoc")]
    (with-open [w (io/writer out)]
      (.write w (str "= " file "\n"))
      (.write w ":source-highlighter: highlightjs\n\n")
      (.write w "[source, c]\n")
      (.write w "----\n")
      (.write w (slurp file))
      (.write w "----\n"))
    out))

(defn -main []
  (doseq [arg *command-line-args*]
    (->> arg
         c2adoc
         (shell/sh "asciidoctor")))

  ;; cleanup temporally files
  (doseq [arg *command-line-args*]
    (shell/sh "rm" (str (basename arg) ".adoc"))))

(-main)


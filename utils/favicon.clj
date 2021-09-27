#!/usr/bin/env bb

(defn favicon
  "make three ico files, 16x16, 32x32, 48x48 resolution,
  from the file provided as the first argument,
  then compile them into `favicon.ico`."
  [png]
  ;; FIXME: dirty. need improve.
  (shell/sh "convert" png "-resize" "16x" "16x.ico")
  (shell/sh "convert" png "-resize" "32x" "32x.ico")
  (shell/sh "convert" png "-resize" "48x" "48x.ico")

  (shell/sh "convert" "16x.ico" "32x.ico" "48x.ico" "favicon.ico")

  (shell/sh "rm" "16x.ico" "32x.ico" "48x.ico"))

(if-let [png (first *command-line-args*)]
  (favicon png)
  "usage: favicon <file.png>")


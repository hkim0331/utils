#!/usr/bin/env bb
(import '[java.util Base64])

(defn ->base64 [s]
  (->> s
       .getBytes
       (.encodeToString (Base64/getEncoder))))

(defn base64-> [s]
  (->> s
       (.decode (Base64/getDecoder))
       ;; no (map char)
       String.))

(def usage "usage:
  base64 [-e] <string_to_encode>
  base64 -d <sring_to_decode>")

(let [[f & [s]] *command-line-args*]
  (condp = f
    "-h" (println usage)
    "-d" (base64-> s)
    "-e" (->base64 s)
    (->base64 f)))

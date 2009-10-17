#lang scheme

(require "gain-analysis.scm")
(require scheme/foreign)

(init-gain-analysis 44100)

(with-input-from-file "test.raw"
  (lambda ()
    (let loop ()
      (let ((bytes (read-bytes 2)))
      (when (not (eof-object? bytes))
            (let ((sample (exact->inexact (integer-bytes->integer bytes #t))))
              (analyze-samples (list->cvector (list sample) _float-t)
                               (list->cvector (list sample) _float-t) 1 2)
              (loop)))))))
                   
(get-title-gain)

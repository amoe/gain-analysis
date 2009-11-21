#lang scheme

(require "gain-analysis.scm")

(define (initialize sample-frequency)
  (let ((ret (init-gain-analysis sample-frequency)))
    (when (not (= ret *init-gain-analysis-ok*))
      (raise "failed to initialize gain analysis"))))
  

; accepts 0-2 arguments which are vectors containing samples for a channel
; We calculate and provide the proper length and number of channels to the FFI
; procedure, and convert the samples to cvectors.  The values also need to be
; floats, not ints!  Howto do this conv?   Divide by the max?
(define (analyze (left #f) (right #f))
  (printf "given: left = ~s, right = ~s\n" left right))

; For resetsamplefrequency, the code for initialize can be duplicated.


#lang scheme

; The title of this lib should be sound/gain-analysis.scm.
; (require sound/gain-analysis/raw) - this
; (require sound/gain-analysis) - a nice wrapper using exceptions, vectors, etc

(require scheme/foreign)

(provide init-gain-analysis
         analyze-samples
         reset-sample-frequency
         get-title-gain
         get-album-gain
         *init-gain-analysis-error*
         *init-gain-analysis-ok*
         *gain-not-enough-samples*
         *gain-analysis-error*
         *gain-analysis-ok*
         _float-t)

(unsafe!)

(define *init-gain-analysis-error* 0)
(define *init-gain-analysis-ok*    1)

(define *gain-not-enough-samples* -24601.0)
(define *gain-analysis-error* 0)
(define *gain-analysis-ok* 1)

(define _float-t _double)

(define lib (ffi-lib "gain_analysis"))

(define init-gain-analysis
  (get-ffi-obj "InitGainAnalysis" lib
               (_fun _long -> _int)))

(define analyze-samples
  (get-ffi-obj "AnalyzeSamples" lib
               (_fun (_cvector i)
                     (_cvector i)
                     _uint
                     _int
                     -> _int)))

(define reset-sample-frequency
  (get-ffi-obj "ResetSampleFrequency" lib
               (_fun _long -> _int)))

(define get-title-gain
  (get-ffi-obj "GetTitleGain" lib
               (_fun -> _float-t)))

(define get-album-gain
  (get-ffi-obj "GetAlbumGain" lib
               (_fun -> _float-t)))

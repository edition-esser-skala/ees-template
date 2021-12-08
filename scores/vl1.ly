\version "2.22.0"

\include "../definitions.ly"
#(define option-instrument-name "vl 1")
\include "score_settings/one-staff.ly"

\book {
  \bookpart {
    \section "1" "First"
    \addTocEntry
    \paper { indent = 2\cm }
    \score {
      <<
        \new Staff {
          \set Staff.instrumentName = "Violino I"
          \xxxViolinoI
        }
      >>
    }
  }
  \bookpart {
    \section "2" "Second"
    \addTocEntry
    \score {
      <<
        \new Staff { \yyyViolinoI }
      >>
    }
  }
}

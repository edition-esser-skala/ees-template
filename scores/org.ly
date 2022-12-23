\version "2.24.0"

\include "../definitions.ly"
#(define option-instrument-name "org")
\include "score_settings/one-staff.ly"

\book {
  \bookpart {
    \section "1" "First"
    \addTocEntry
    \paper { indent = 2\cm }
    \score {
      <<
        \new Staff {
          \set Staff.instrumentName = "Organo"
          \xxxOrgano
        }
        \new FiguredBass { \xxxBassFigures }
      >>
    }
  }
  \bookpart {
    \section "2" "Second"
    \addTocEntry
    \score {
      <<
        \new Staff { \yyyOrgano }
        \new FiguredBass { \yyyBassFigures }
      >>
    }
  }
}

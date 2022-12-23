\version "2.24.0"

\include "../definitions.ly"
#(define option-instrument-name "cor")
\include "score_settings/two-staves.ly"

\book {
  \bookpart {
    \section "1" "First"
    \addTocEntry
    \paper { indent = 2\cm }
    \score {
      <<
        \new StaffGroup <<
          \new GrandStaff <<
            \set GrandStaff.instrumentName = \transposedName "Corno" "C" ""
            \new Staff {
              \set Staff.instrumentName = "I"
              \xxxCornoI
            }
            \new Staff {
              \set Staff.instrumentName = "II"
              \xxxCornoII
            }
          >>
        >>
      >>
    }
  }
}

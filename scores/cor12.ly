\version "2.22.0"

\include "../definitions.ly"
#(define option-instrument-name "cor")
\include "score_settings/two-staves.ly"

\book {
  \bookpart {
    \section "1" "First"
    \paper { indent = 2\cm }
    \score {
      <<
        \new StaffGroup <<
          \new GrandStaff <<
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

\version "2.24.0"

\include "../definitions.ly"
\include "score_settings/coro.ly"

\book {
  \bookpart {
    \section "1" "First"
    \addTocEntry
    \paper { indent = 2\cm }
    \score {
      <<
        \new ChoirStaff <<
          \new Staff {
            \set Staff.instrumentName = "Soprano"
            \new Voice = "Soprano" { \dynamicUp \xxxSoprano }
          }
          \new Lyrics \lyricsto Soprano \xxxSopranoLyrics

          \new Staff {
            \set Staff.instrumentName = "Alto"
            \new Voice = "Alto" { \dynamicUp \xxxAlto }
          }
          \new Lyrics \lyricsto Alto \xxxAltoLyrics

          \new Staff {
            \set Staff.instrumentName = "Tenore"
            \new Voice = "Tenore" { \dynamicUp \xxxTenore }
          }
          \new Lyrics \lyricsto Tenore \xxxTenoreLyrics

          \new Staff {
            \set Staff.instrumentName = "Basso"
            \new Voice = "Basso" { \dynamicUp \xxxBasso }
          }
          \new Lyrics \lyricsto Basso \xxxBassoLyrics
        >>
        \new Staff {
          \set Staff.instrumentName = "Organo"
          \xxxOrgano
        }
        \new FiguredBass { \xxxBassFigures }
      >>
    }
  }
}

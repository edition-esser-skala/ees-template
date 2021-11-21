\version "2.22.0"

\include "../definitions.ly"
\include "score_settings/full-score.ly"

\book {
  \bookpart {
    \section "1" "First"
    \addTocEntry
    \paper { indent = 3\cm }
    \score {
      <<
        \new StaffGroup <<
          \new GrandStaff <<
            \set GrandStaff.instrumentName = "Oboe"
            \new Staff {
              \set Staff.instrumentName = "I"
              \xxxOboeI
            }
            \new Staff {
              \set Staff.instrumentName = "II"
              \xxxOboeII
            }
          >>
        >>
        \new StaffGroup <<
          \new Staff <<
            \set Staff.instrumentName = \transposedName "Clarino I, II" "C" ""
            % \transpose c c
            \partCombine \xxxClarinoI \xxxClarinoII
          >>
        >>
        \new Staff {
          \set Staff.instrumentName = \transposedTimp "C" "" "G" ""
          % \transpose c c
          \xxxTimpani
        }
        \new StaffGroup <<
          \new GrandStaff \with { \smallGroupDistance } <<
            \set GrandStaff.instrumentName = "Violino"
            \new Staff {
              \set Staff.instrumentName = "I"
              \xxxViolinoI
            }
            \new Staff {
              \set Staff.instrumentName = "II"
              \xxxViolinoII
            }
          >>
          \new Staff {
            \set Staff.instrumentName = "Viola"
            \xxxViola
          }
        >>
        \new ChoirStaff <<
          \new Staff {
            \incipitSoprano
            \new Voice = "Soprano" { \dynamicUp \xxxSoprano }
          }
          \new Lyrics \lyricsto Soprano \xxxSopranoLyrics

          \new Staff {
            \incipitAlto
            \new Voice = "Alto" { \dynamicUp \xxxAlto }
          }
          \new Lyrics \lyricsto Alto \xxxAltoLyrics

          \new Staff {
            \incipitTenore
            \new Voice = "Tenore" { \dynamicUp \xxxTenore }
          }
          \new Lyrics \lyricsto Tenore \xxxTenoreLyrics

          \new Staff {
            \set Staff.instrumentName = "Basso"
            \new Voice = "Basso" { \dynamicUp \xxxBasso }
          }
          \new Lyrics \lyricsto Basso \xxxBassoLyrics
        >>
        \new StaffGroup <<
          \new Staff {
            \set Staff.instrumentName = \markup \center-column { "Organo" "e Bassi" }
            % \transpose c c,
            \xxxOrgano
          }
        >>
        \new FiguredBass { \xxxBassFigures }
      >>
      \layout { }
      \midi { \tempo 4 = 90 }
    }
  }
}

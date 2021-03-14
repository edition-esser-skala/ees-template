\version "2.22.0"

\include "../definitions.ly"

\paper {
	#(set-paper-size "a4" 'landscape)
	indent = 1\cm
  #(define (page-post-process layout pages) (ly:create-ref-file layout pages))
	#(define (page-post-process layout pages) (ly:create-toc-file layout pages))
}

#(set-global-staff-size 15.87)

\book {
	\bookpart {
		\paper { evenHeaderMarkup = {} oddHeaderMarkup = {} }
		\partTitle "1" "F I R S T   P A R T"
		\tocPart "1" "First Part"
		\partMark
		\pageBreak
		\markup \null
	}
	\bookpart {
		\header {
      genre = "C H O R A L"
			number = "1.1"
			title = "F I R S T"
		}
		\paper { indent = 3\cm }
		\tocSection "1.1" "First"
		\tocLabelLong "label" "1.1" "Choral" "First"
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
						\set Staff.instrumentName = \markup \center-column { "Clarino I, II" "in C" }
						% \transpose c c
						\partCombine \xxxClarinoI \xxxClarinoII
					>>
				>>
				\new Staff {
					\set Staff.instrumentName = \markup \center-column { "Timpani" "in C–G" }
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
						\set Staff.instrumentName = \SopranoIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Soprano" { \dynamicUp \xxxSopranoNotes }
					}
					\new Lyrics \lyricsto Soprano \xxxSopranoLyrics

					\new Staff {
						\set Staff.instrumentName = \AltoIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Alto" { \dynamicUp \xxxAltoNotes }
					}
					\new Lyrics \lyricsto Alto \xxxAltoLyrics

					\new Staff {
						\set Staff.instrumentName = \TenoreIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Tenore" { \dynamicUp \xxxTenoreNotes }
					}
					\new Lyrics \lyricsto Tenore \xxxTenoreLyrics

					\new Staff {
						\set Staff.instrumentName = "Basso"
						\new Voice = "Basso" { \dynamicUp \xxxBassoNotes }
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

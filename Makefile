# change the following variables according to the current project
project = project_name
notes = ob1 ob2 clno1 clno2 timp vl1 vl2 vla S A T B org
scores = full_score ob1 ob2 ottoni vl1 vl2 vla coro b org

# general definitions
zipname = $(project:%=%_engraving_files)
.DEFAULT_GOAL := info
LILY_CMD = lilypond -ddelete-intermediate-files -dno-point-and-click

# dependencies of scores:
# (a) individual scores (e.g., `make full_score')
$(scores): %: tmp/%.pdf
$(scores:%=tmp/%.pdf): tmp/%.pdf: scores/%.ly \
                                  $(notes:%=notes/%.ly) \
                                  definitions.ly
	mkdir -p tmp
	$(LILY_CMD) -o tmp $<

# (b) all scores (`make scores')
.PHONY: scores
scores: $(scores)


# dependencies of final scores (i.e., front matter + notes):
# (a) individual final scores (e.g., `make final/full_score'):
$(scores:%=final/%): %: %.pdf
$(scores:%=final/%.pdf): final/%.pdf: front_matter/critical_report.tex tmp/%.pdf
	latexmk -cd \
	        -lualatex \
	        -lualatex="lualatex %O %S $*" \
	        -outdir=../final \
	        -jobname=$* \
	        front_matter/critical_report.tex
	latexmk -c \
	        -outdir=final \
	        -jobname=$* \
	        front_matter/critical_report.tex

# (b) all final scores (`make final/scores'):
.PHONY: final/scores
final/scores: $(scores:%=final/%)

archive:
	zip $(zipname).zip LICENSE.txt README.md Makefile *.ly \
	notes/*.ly scores/*.ly \
	front_matter/byncsaeu.pdf front_matter/ees_logo.pdf front_matter/*.tex

space := $(subst ,, )
sep := ", "
info:
	@color=`tput setaf 6; tput bold`; \
	reset=`tput sgr0`; \
	echo "Specify one of the following $${color}targets$${reset} to create:\n" \
	"* $${color}$(subst $(space),$(sep),$(scores))$${reset}: individual scores (LilyPond output only)\n" \
	"* $${color}$(subst $(space),$(sep),$(scores:%=final/%))$${reset}: individual final scores (LilyPond output + front matter)\n" \
	"* $${color}scores$${reset}: all scores\n" \
	"* $${color}final/scores$${reset}: all final scores\n" \
	"* $${color}archive$${reset}: ZIP file with all sources\n" \
	"* $${color}info$${reset}: prints this message"

# Composer: Work

Engraving files for LilyPond 2.18.0


## Requirements

* LilyPond >= 2.18.0
* LuaLaTeX >= 1.10.0
* GNU Make >= 4.1
* The Source Sans and Fredericka the Great fonts from Google Fonts


## Build instructions

Use `make` for building scores:
* `make final/scores` generates all publication-ready scores in folder `final/`.
* `make info` lists other available build targets.

Alternatively, the file *master.ly* allows you to work with a text editor (e.g., Atom):
Change the included scores file in this script to generate files *master.pdf* and *master.midi*.


## Files

* *definitions.ly* – contains general definitions
* *Makefile* – configuration file for `make`
* *master.ly* – allows building scores without using `make`
* *README.md* – this file
* *front_matter/* – LuaLaTeX files and images for typesetting front matter
* *notes/* – LY files containing individual voices
* *scores/* – LY files containing score definitions

# Composer: Work

## Requirements

For consistent results, use the [EES Engraver](https://github.com/edition-esser-skala/ees-engraver) Docker image. Alternatively, install the dependencies listed in the readme of EES Engraver.


## Build instructions

### … using Docker

From the root directory of the repository, run

```bash
sudo docker run --rm -it -v $PWD:/ees ees-engraver
```

to generate all publication-ready scores in folder *final*.

To list all available build targets, run

```bash
sudo docker run --rm -it -v $PWD:/ees ees-engraver make info
```

### … using manually installed dependencies

Invoke `make` to engrave scores:
- `make final/scores` generates all publication-ready scores in folder *final*.
- `make info` lists all available build targets.

Alternatively, uncomment the score to be engraved in [main.ly](main.ly) and run

```bash
lilypond --include=$EES_TOOLS_PATH main.ly
```


## Files

- [notes](notes/)/*.ly – LilyPond files containing individual voices
- [scores](scores/)/*.ly – LilyPond files containing score definitions
- [CHANGELOG.md](CHANGELOG.md) – changelog
- [definitions.ly](definitions.ly) – general definitions
- [LICENSE.txt](LICENSE.txt) – license
- [main.ly](main.ly) – allows to engrave scores without using `make`
- [Makefile](Makefile) – configuration file for `make`
- [metadata.yaml](metadata.yaml) – machine-readable metadata
- [.github/workflows/engrave-and-release.yaml](.github/workflows/engrave-and-release.yaml) – GitHub Actions workflow
- [front_matter/critical_report.tex](front_matter/critical_report.tex) – prefatory material

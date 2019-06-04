---
title: 'trap-cap - Captures insect counts on sticky traps by image analysis'
tags:
  - bioinformatics
  - computational biology
  - Python
  - image analysis
authors:
 - name: Rutger Aldo Vos
   orcid: 0000-0001-9254-7318
   affiliation: "1, 2"
 - name: Charlotte Kaffa
   affiliation: 3
 - name: Ricardo Michels
   affiliation: 2
affiliations:
 - name: Research Group 'Understanding Evolution', Naturalis Biodiversity Center, Leiden, The Netherlands
   index: 1
 - name: Institute of Biology Leiden, Leiden University, Leiden, The Netherlands
   index: 2
 - name: Center for Molecular and Biomolecular Informatics, Radboud UMC, Nijmege, The Netherlands
   index: 3
date: 4 June 2019
bibliography: paper.bib
---

# Summary

Sticky traps are sheets of plastic or paper that attract and trap insects. Such traps are
mostly used to assess the presence and numbers of insects, rather than as a control 
measure. A very common application is, for example, the detection of pest insects in 
greenhouses. A specific use case that has come up recently in a collaboration between the
Louis Bolk Instituut and Naturalis Biodiversity Center (both in the Netherlands) is to use 
these traps to detect and count insects, and their size classes, in meadows. This in order 
to measure food availability for the chicks of meadow birds.

Previously, this detection and counting was done by hand, by volunteers. However, this is
labour intensive and therefore not very scalable. To remedy this, we have developed an
image analysis application, which we here provide as a command line tool, so that dozens 
or hundreds of images of sticky traps can be analyzed in one go. It is made available as a 
Docker container, which means it can be run on a variety of operating systems.

The tool is used, for example, as follows:

```{bash}
docker run \
	-v /path/to/infile.yml:/sticky-traps.yml \
	-v /path/to/images:/images \
		naturalis/trap-cap > results.tsv
```

The command consists of the following parts:

- **docker run** - this is the standard part for any application that is distributed using
  the Docker system.
- **-v /path/to/infile.yml:/sticky-traps.yml** - specifies the location of the configuration
  file ([example](https://raw.githubusercontent.com/naturalis/trap-cap/master/example/infile.yml)). 
  On your system, the part `/path/to/infile.yml` needs to be replaced with the absolute path 
  to where you have your configuration file. On Windows, this might be something like 
  `C:\trap-cap\infile.yml`.
- **-v /path/to/images:/images** - specifies the location of the images. This should be a 
  folder with `*.JPG` files ([example](example/images)). On your system, the part
  `/path/to/images` should be replaced with the absolute path. For example to
  `C:\trap-cap\images` on Windows.
- **trap-cap > results.tsv** - specifies the name of the application to run (i.e. 
  `trap-cap`) and where to write the output. Normally, the output is written to the 
  console window, but by specifying `> results.tsv` it is written to a file instead
  ([example](https://raw.githubusercontent.com/naturalis/trap-cap/master/example/results.tsv)).

# References

# trap-cap - Captures insect counts on sticky traps by image analysis

Sticky traps are sheets of plastic or paper that attract and trap insects. Such traps are
mostly used to assess the presence and numbers of insects, rather than as a control 
measure. Example applications include the detection of pest insects in greenhouses. A
specific use case that has come up recently in a collaboration between the
[Louis Bolk Instituut](http://www.louisbolk.org/) and 
[Naturalis Biodiversity Center](http://www.naturalis.nl) is to use these traps to detect 
and count insects, and their size classes, in meadows. This in order to measure food 
availability for the chicks of meadow birds.

Previously, this detection and counting was done by hand, by volunteers. However, this is
labour intensive and therefore not very scalable. To remedy this, we have developed an
image analysis application. The application can be run on the 
[web](http://sticky-traps.naturalis.nl), but this requires manual uploads of images. 
Better still would be to be able to do this in batches, so that dozens or hundreds of 
images can be analyzed in one go. Here we provide this command line tool. It is made 
available as a [Docker](https://www.docker.com/) container, which means it can be run on 
a variety of operating systems.

The tool is used, for example, as follows:

```{bash}
docker run \
	-v /path/to/infile.yml:/sticky-traps.yml \
	-v /path/to/images:/images \
		trap-cap > results.tsv
```

The command consists of the following parts:

- `docker run` - this is the standard part for any application that is distributed using
  the Docker system.
- `-v /path/to/infile.yml:/sticky-traps.yml` - specifies the location of the configuration
  file ([example](example/infile.yml)). On your system, the part `/path/to/infile.yml`
  needs to be replaced with the absolute path to where you have your configuration file.
  On Windows, this might be something like `C:\trap-cap\infile.yml`.
- `-v /path/to/images:/images` - specifies the location of the images. This should be a 
  folder with `*.JPG` files ([example](example/images)). On your system, the part
  `/path/to/images` should be replaced with the absolute path. For example to
  `C:\trap-cap\images` on Windows.
- `trap-cap > results.tsv` - specifies the name of the application to run (i.e. 
  `trap-cap`) and where to write the output. Normally, the output is written to the 
  console window, but by specifying `> results.tsv` it is written to a file instead
  ([example](example/results.tsv)).

### To build the image from the provided Dockerfile:

```{bash}
docker build -t trap-cap .
```
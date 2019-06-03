# trap-cap

Captures insect counts on sticky traps by image analysis. 

```{bash}
docker run \
	-v `pwd`/example/infile.yml:/sticky-traps.yml \
	-v `pwd`/example/images:/images \
		trap-cap
```

### To build the image from the provided Dockerfile:

```{bash}
docker build -t trap-cap .
```
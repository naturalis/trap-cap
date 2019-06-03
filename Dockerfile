FROM python:2.7
ADD ./imgpheno /imgpheno
RUN pip install opencv-python numpy PyYAML fann2
CMD [ "python", "/imgpheno/examples/sticky-traps.py" ]

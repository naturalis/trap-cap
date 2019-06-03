FROM python:2.7
ADD ./imgpheno /imgpheno
RUN pip install opencv-python numpy PyYAML
ENV PYTHONPATH "${PYTHONPATH}:/imgpheno"
CMD [ "python", "/imgpheno/examples/sticky-traps.py" ]

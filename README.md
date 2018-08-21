# Machine Learning stack for Docker

Kickstart your Machine Learning experiments with Python 3.6, Jupyter Notebook, Docker and multiple libraries & tools.

**Libraries included:**
  * [Jupyter](http://jupyter.org/)
  * [Keras](https://keras.io/)
  * [MRJob](https://pythonhosted.org/mrjob/)
  * [Matplotlib](https://matplotlib.org/)
  * [NLTK](https://www.nltk.org/)
  * [Numpy](http://www.numpy.org/)
  * [OpenCV](https://opencv.org/)
  * [Pandas](https://pandas.pydata.org/)
  * [Requests](http://docs.python-requests.org/en/master/)
  * [Scikit-learn](http://scikit-learn.org/stable/)
  * [Scipy](https://www.scipy.org/)
  * [Seaborn](https://seaborn.pydata.org/)
  * [Spark](https://spark.apache.org/)
  * [Tensorflow](https://www.tensorflow.org/)

### Getting started
Make sure you have [Docker](https://www.docker.com/) installed. 
1. Clone this repo & run `docker build . -t mldocker`
2. Run `docker run -it -p 8888:8888 -v $(pwd)/notebooks:/jupyter mldocker`
3. Open [http://localhost:8888](http://localhost:8888)
4. Create something awesome!

With [docker-compose](https://docs.docker.com/compose/):
1. Clone the repo
2. Run `docker-compose up`
3. Open [http://localhost:8888](http://localhost:8888)
4. Create something awesome!


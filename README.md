# Machine Learning stack for Docker

Kickstart your Machine Learning experiments with Python 3.6 & this toolkit.

**Libraries included:**
  * [jupyter](http://jupyter.org/)
  * [keras](https://keras.io/)
  * [MRJob](https://pythonhosted.org/mrjob/)
  * [matplotlib](https://matplotlib.org/)
  * [numpy](http://www.numpy.org/)
  * [opencv-python](https://opencv.org/)
  * [pandas](https://pandas.pydata.org/)
  * [requests](http://docs.python-requests.org/en/master/)
  * [scikit-learn](http://scikit-learn.org/stable/)
  * [scipy](https://www.scipy.org/)
  * [seaborn](https://seaborn.pydata.org/)
  * [tensorflow](https://www.tensorflow.org/)

### Getting started
Make sure you have [Docker](https://www.docker.com/) installed. 
1. Clone this repo & run `docker build . -t mldocker`
2. Run `docker run -it -p 8888:8888 -v notebooks:/app mldocker`
3. Open [http://localhost:8888](http://localhost:8888)
4. Create something awesome!

With [docker-compose](https://docs.docker.com/compose/):
1. Clone the repo
2. Run `docker-compose up`
3. Open [http://localhost:8888](http://localhost:8888)
4. Create something awesome!


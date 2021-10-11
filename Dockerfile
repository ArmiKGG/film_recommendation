# set base image (host OS)
FROM python:3.8.8

# set the working directory in the container
WORKDIR /app

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt
RUN python3 -m nltk.downloader stopwords
RUN python3 -m nltk.downloader punkt
# copy the content of the local src directory to the working directory
COPY . .

EXPOSE 80

# command to run on container start
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "80"]
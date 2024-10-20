# Use the official Python 3.8.10 image as a base image
FROM python:3.8.10

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt requirements.txt

# Install the dependencies
RUN pip install Flask==3.0.0
RUN pip install keras==2.8.0
RUN pip install nltk==3.8.1
RUN pip install numpy==1.22.2
RUN pip install spacy==3.7.2
RUN pip install spacy-langdetect==0.1.2
RUN pip install spacy-legacy==3.0.12
RUN pip install spacy-loggers==1.0.5
RUN pip install transformers==4.35.2
RUN pip install torch==2.4.1
RUN pip install torch-vision==0.1.6.dev0
RUN pip install tensorflow==2.8.0
RUN pip install sentencepiece==0.2.0
RUN pip install protobuf==3.20.*
RUN python -m spacy download en_core_web_sm
# Copy the entire Flask application into the container
COPY . .

# Expose the port that the app runs on
EXPOSE 5000

# Command to run the application
CMD ["flask", "--app", "app", "--debug", "run", "--host=0.0.0.0", "--port=5000"]
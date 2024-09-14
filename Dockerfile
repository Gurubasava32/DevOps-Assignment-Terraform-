FROM python:3.9-slim

WORKDIR /app

# Copy the requirements.txt file to the container
COPY app/requirements.txt requirements.txt

# Install the required Python packages
RUN pip install -r requirements.txt

# Copy the application code into the container
COPY app/ .

# Command to run the app
CMD ["python", "app.py"]

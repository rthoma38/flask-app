# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the necessary files to the container
COPY app.py /app/
COPY requirements.txt /app/
COPY instance/database.db /app/instance/database.db
COPY templates/ /app/templates
COPY static/ /app/static/


# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that the app will run on
EXPOSE 5000

# Set environment variable for the Flask app
ENV FLASK_APP=app.py

# Command to run the application
CMD ["flask", "run", "--host=0.0.0.0"]

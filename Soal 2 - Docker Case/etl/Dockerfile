# Gunakan `python:3.11.4` sebagai base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the ETL script into the container
COPY etl.py .

# Install any necessary dependencies for the script
RUN pip install httpx

# Command to run the ETL script within the container
CMD ["python", "etl.py"]

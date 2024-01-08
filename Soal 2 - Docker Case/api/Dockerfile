# Gunakan `python:3.11.4` sebagai base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the FastAPI application code into the container
COPY api.py .

# Expose the port the FastAPI app runs on
EXPOSE 6000

# Command to run the FastAPI application within the container
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "6000"]

# Use the official Python image as base
FROM python:3.11

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install poetry
RUN pip install poetry

# Set working directory in the container
WORKDIR /app

# Copy the entire project into the container
COPY . /app

# Install project dependencies
RUN poetry config virtualenvs.create false \
    && poetry install 

# Command to run the application with Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

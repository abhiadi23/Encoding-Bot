FROM python:3.11-slim-bullseye

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Asia/Kolkata"

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    ffmpeg \
    mediainfo \
    build-essential \
    mkvtoolnix \
    fontconfig && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Run the bot
CMD ["python3", "-m", "VideoEncoder"]

FROM python:3.9.2-slim-buster

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Asia/Kolkata"

# Update package lists and install dependencies
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    git \
    ffmpeg \
    mediainfo \
    build-essential \
    mkvtoolnix \
    fontconfig && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install Python dependencies
RUN python3 -m pip install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Run the bot
CMD ["python3", "-m", "VideoEncoder"]

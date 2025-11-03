FROM alpine:latest

# Install bash
RUN apk add --no-cache bash

# Set working directory inside the container
WORKDIR /app

# Copy your script into the working directory
COPY fibonacci-series.sh .

# Make the script executable
RUN chmod +x fibonacci-series.sh

# Set default entrypoint
ENTRYPOINT ["./fibonacci-series.sh"]

# Optional: default argument (10 terms)
CMD ["10"]


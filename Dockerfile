FROM mcr.microsoft.com/playwright:v1.52.0-jammy

# Prevent automatic browser downloads during npm install
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

# Enable verbose logs to observe Kaniko snapshot behavior
ENV DEBUG=pw:api

# Create a directory under /home
RUN mkdir -p /home/tempdir
RUN chmod 777 /home/tempdir

# This chown on the large /ms-playwright folder will trigger a full filesystem snapshot
RUN chown -R root:root /ms-playwright

# Dummy command to keep the container alive
CMD ["echo", "Reproduction complete"]

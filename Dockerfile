FROM mcr.microsoft.com/playwright:v1.52.0-jammy

# Prevent automatic browser downloads during npm install
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

# Enable verbose Playwright logs (optional)
ENV DEBUG=pw:api

# Create group and user
RUN groupadd -r appgroup && useradd -m -g appgroup appuser

# Create app directory and assign ownership
RUN mkdir -p /home/appuser/app \
    && chown -R appuser:appgroup /home/appuser/app \
    && chmod 755 /home/appuser/app

# Optional: Switch to appuser
USER appuser

# Dummy command
CMD ["echo", "App setup complete"]

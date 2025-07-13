FROM mcr.microsoft.com/playwright:v1.52.0-jammy



# Prevent automatic browser downloads during npm install
ENV NPM_CONFIG_LOGLEVEL=verbose
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

# Enable verbose Playwright logs (optional)
#ENV DEBUG=pw:api

# Create group and user
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

# Create app directory and assign ownership
RUN mkdir -p /home/appuser/playwright2
RUN mkdir -p /home/appuser/playwright
RUN  chmod -R 777 /home/appuser

RUN chown  appuser:appgroup /ms-playwright
#/home/appuser

# Optional: Switch to appuser
#USER appuser


# Dummy command
CMD ["echo", "App setup complete"]

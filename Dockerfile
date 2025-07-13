FROM mcr.microsoft.com/playwright:v1.52.0-jammy

# ✅ Prevent automatic browser downloads during npm install
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

# ✅ Enable verbose logging to observe behavior
ENV DEBUG=pw:api

# ✅ Create a system group and user
RUN groupadd -r appgroup && useradd -m -g appgroup appuser

# ✅ Create the application directory
RUN mkdir -p /home/appuser/app && chmod 755 /home/appuser/app

# ❌ This is the dangerous step — triggers Kaniko full snapshot
#    (Use this if you want to simulate the issue)
RUN chown -R appuser:appgroup

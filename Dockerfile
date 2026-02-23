FROM python:3.13-slim

LABEL maintainer="Paul P. Budveit"
LABEL description="QuickBooks Online CLI tool"

WORKDIR /app

# Copy project files
COPY pyproject.toml README.md LICENSE ./
COPY src/ src/

# Install the package
RUN pip install --no-cache-dir .

# Config directory (mounted as volume for token persistence)
RUN mkdir -p /config
ENV QB_CONFIG_DIR=/config

ENTRYPOINT ["qb"]
CMD ["--help"]

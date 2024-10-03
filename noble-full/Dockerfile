FROM  ghcr.io/jvrck/noble-full-base:latest

WORKDIR /app

# Copy the setup script and run it
COPY setup.sh /app
RUN chmod +x /app/setup.sh
RUN /app/setup.sh
RUN rm -rf /app/setup.sh

CMD ["/bin/bash"]
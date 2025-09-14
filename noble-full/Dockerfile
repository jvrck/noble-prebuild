FROM  ghcr.io/jvrck/noble-full-base:latest

WORKDIR /app

# Copy the setup script and update-ai-tools script
COPY setup.sh update-ai-tools /app/
RUN chmod +x /app/setup.sh
RUN /app/setup.sh
RUN rm -rf /app/setup.sh /app/update-ai-tools

CMD ["/bin/bash"]
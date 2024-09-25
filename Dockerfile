# Use Consul official image
FROM consul:1.14.2

# Set Consul data directory
ENV CONSUL_DATA_DIR /consul/data

# Create data directory
RUN mkdir -p ${CONSUL_DATA_DIR}

# Expose default Consul ports
EXPOSE 8500 8600 8300 8301 8302 8400

# Copy your configuration files (if any)
COPY ./consul-config /consul/config

# Start Consul agent in development mode for basic testing (not for production)
ENTRYPOINT ["consul", "agent", "-dev", "-client=0.0.0.0", "-data-dir", "/consul/data"]
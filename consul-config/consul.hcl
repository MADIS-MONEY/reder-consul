# Enable the Consul agent to run in server mode
server = true

# Data center name
datacenter = "dc1"

# Node name, typically the Render node name
node_name = "srv-crq543ij1k6c738be7tg-hibernate-7594f5b969-ddxm8"

# Bind address - typically localhost for Render environments
bind_addr = "127.0.0.1"

# The IP address or hostname on which Consul will advertise services
advertise_addr = "127.0.0.1"

# Enable performance optimization for production
performance {
  raft_multiplier = 1
}

# Enable HTTPS communication for the Consul API in production
ports {
  http = 8500  # HTTP port for Consul
  https = 8501 # HTTPS port for Consul
}

# Enable auto-encryption for secure communication
#verify_incoming = true
#verify_outgoing = true
#ca_file = "/path/to/ca.pem"
#cert_file = "/path/to/consul-cert.pem"
#key_file = "/path/to/consul-key.pem"

# Enable ACLs for security in production
#acl {
#  enabled = true
#  default_policy = "deny"
#  enable_token_persistence = true
#  tokens {
#    agent = "your-agent-token"
#  }
#}

# Enable telemetry for monitoring
telemetry {
  prometheus_retention_time = "24h"
  disable_hostname = true
  prometheus_metrics = true
}

# Enable service health checks
service {
  name = "consul"
  port = 8500
  check {
    id = "http"
    name = "HTTP Health Check"
    http = "http://127.0.0.1:8500/v1/health/service/consul"
    interval = "10s"
    timeout = "2s"
  }
}

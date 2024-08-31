#!/bin/bash

start_service() {
  /usr/bin/docker compose -f docker-compose.yaml config > stack.yaml
  /usr/bin/sed 's/cpus: \([0-9]\+\)/cpus: "\1"/g' stack.yaml > stack.yaml
  /usr/bin/docker stack deploy --compose-file stack.yaml  zabbix 
}


status_stack() {
  /usr/bin/docker compose -f docker-compose.yaml config > stack.yaml
  /usr/bin/sed 's/cpus: \([0-9]\+\)/cpus: "\1"/g' stack.yaml > stack.yaml
  /usr/bin/docker stack services --compose-file stack.yaml  zabbix 
}

case "$1" in
  start)
    start_service
    ;;
  status)
  status_stack
    ;;
  *)
    echo "Uso: $0 {start|status}"
    exit 1
    ;;
esac

exit 0
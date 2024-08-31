#!/bin/bash

start_service() {
  /usr/bin/docker compose -f docker-compose.yaml config > stack.yaml
  /usr/bin/docker stack deploy --compose-file stack.yaml  zabbix 
}


status_stack() {
  /usr/bin/docker compose -f docker-compose.yaml config > stack.yaml
  /usr/bin/docker stack services --compose-file stack.yaml  zabbix 
}

# Verificar qual ação executar
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
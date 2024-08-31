#!/bin/bash

start_service() {
   export $(cat .env) > /dev/null 2>&1; /usr/bin/docker stack deploy --compose-file stack.yaml  zabbix
}


status_stack() {
  /usr/bin/docker stack services  zabbix 
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
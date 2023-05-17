#!/bin/bash

if docker compose version > /dev/null 2>&1; then
  DOCKER_COMPOSE="docker compose"
else
  DOCKER_COMPOSE="docker-compose"
fi

compose_files=($(find . -regex './docker-compose.*'))

for file in "${compose_files[@]}"; do
  DOCKER_COMPOSE+=" -f $file"
done

# Check the command passed as the first argument
case "$1" in
  up)
    ${DOCKER_COMPOSE} up "${@:2}"
    ;;
  down)
    ${DOCKER_COMPOSE} down "${@:2}"
    ;;
  ps)
    ${DOCKER_COMPOSE} ps "${@:2}"
    ;;
  logs)
    ${DOCKER_COMPOSE} logs "${@:2}"
    ;;
  build)
    ${DOCKER_COMPOSE} build "${@:2}"
    ;;
  start)
    ${DOCKER_COMPOSE} start "${@:2}"
    ;;
  stop)
    ${DOCKER_COMPOSE} stop "${@:2}"
    ;;
  restart)
    ${DOCKER_COMPOSE} restart "${@:2}"
    ;;
  exec)
    ${DOCKER_COMPOSE} exec "${@:2}"
    ;;
  run)
    ${DOCKER_COMPOSE} run "${@:2}"
    ;;
  scale)
    ${DOCKER_COMPOSE} scale "${@:2}"
    ;;
  pause)
    ${DOCKER_COMPOSE} pause "${@:2}"
    ;;
  unpause)
    ${DOCKER_COMPOSE} unpause "${@:2}"
    ;;
  rm)
    ${DOCKER_COMPOSE} rm "${@:2}"
    ;;
  *)
    # Display help message
    echo "Docker Compose shortcuts:"
    echo "dc up       - docker compose up"
    echo "dc down     - docker compose down"
    echo "dc ps       - docker compose ps"
    echo "dc logs     - docker compose logs"
    echo "dc build    - docker compose build"
    echo "dc start    - docker compose start"
    echo "dc stop     - docker compose stop"
    echo "dc restart  - docker compose restart"
    echo "dc exec     - docker compose exec"
    echo "dc run      - docker compose run"
    echo "dc scale    - docker compose scale"
    echo "dc pause    - docker compose pause"
    echo "dc unpause  - docker compose unpause"
    echo "dc rm       - docker compose rm"
    ;;
esac

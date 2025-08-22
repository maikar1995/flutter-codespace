#!/usr/bin/env bash
set -e
export PATH="/usr/local/flutter/bin:$PATH"


# Entrar al proyecto (creado por post_create.sh)
cd app


# Dependencias
flutter pub get


# Ejecutar en servidor web en el puerto 8080 (Codespaces lo expone automáticamente)
flutter run -d web-server --web-port 8080
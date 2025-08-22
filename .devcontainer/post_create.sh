#!/usr/bin/env bash
set -e


export PATH="/usr/local/flutter/bin:$PATH"


# Activar y precachear web
flutter config --enable-web
flutter precache --web


# Crear proyecto de ejemplo si no existe
if [ ! -d "app" ]; then
flutter create app
fi


# Mostrar estado
flutter doctor -v || true
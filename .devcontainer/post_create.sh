#!/usr/bin/env bash
set -euo pipefail

# Asegura que el SDK está en PATH (instalado en HOME)
export PATH="$HOME/.flutter/bin:$PATH"

# Seguridad para git (si la capa de build lo requiere)
git config --global --add safe.directory "$HOME/.flutter" || true

# Doctor + habilitar web + precache (idempotente)
flutter doctor -v || true
flutter config --enable-web
flutter precache --web

# Crear el proyecto si no existe
if [ ! -d "app" ]; then
  flutter create app
fi

echo "post_create listo"
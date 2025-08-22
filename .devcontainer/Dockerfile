# Imagen base recomendada para Codespaces/Dev Containers
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

ENV DEBIAN_FRONTEND=noninteractive

# Dependencias del sistema necesarias para Flutter (web + toolchain)
RUN apt-get update && apt-get install -y \
    curl git unzip xz-utils zip \
    libglu1-mesa \
    clang cmake ninja-build pkg-config libgtk-3-dev \
  && rm -rf /var/lib/apt/lists/*

# ---- Instalar Flutter como el usuario vscode (evita problemas de permisos) ----
ARG USERNAME=vscode
USER ${USERNAME}

# Instala el SDK en el HOME del usuario
ENV FLUTTER_HOME=/home/${USERNAME}/.flutter
RUN git clone https://github.com/flutter/flutter.git -b stable ${FLUTTER_HOME}
ENV PATH="${FLUTTER_HOME}/bin:${PATH}"

# Precachea y habilita web durante el build para que Dart/engine estén listos
RUN git config --global --add safe.directory ${FLUTTER_HOME} \
 && flutter config --enable-web \
 && flutter precache --web \
 && flutter --version

# (Opcional) Puedes quedarte en USER vscode (recomendado para Codespaces)
# USER root   # <-- no es necesario; si lo dejas, añade luego "remoteUser": "vscode" en devcontainer.json

# Imagen base recomendada para Codespaces/Dev Containers
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04


# Dependencias del sistema necesarias para Flutter (web + toolchain)
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
curl git unzip xz-utils zip \
libglu1-mesa \
clang cmake ninja-build pkg-config libgtk-3-dev \
&& rm -rf /var/lib/apt/lists/*


# Instalar Flutter desde el canal estable
ENV FLUTTER_HOME=/usr/local/flutter
RUN git clone https://github.com/flutter/flutter.git -b stable ${FLUTTER_HOME}
ENV PATH="${FLUTTER_HOME}/bin:${PATH}"


# Comprobación inicial
RUN flutter --version && flutter doctor -v || true
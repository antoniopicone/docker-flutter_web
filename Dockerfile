FROM antoniopicone/ubuntu_develop

WORKDIR /tmp

# Setting up development user
ARG USERNAME=devuser

RUN wget -O /tmp/flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.7.8+hotfix.4-stable.tar.xz

RUN tar xf /tmp/flutter.tar.xz && \
    rm -rf /tmp/flutter.tar.xz && \
    mv /tmp/flutter /home/$USERNAME/flutter

ENV FLUTTER_PATH="/home/$USERNAME/flutter/bin"
ENV PUB_CACHE_BIN="/home/$USERNAME/flutter/.pub-cache/bin"
ENV DART_PATH="/home/$USERNAME/flutter/bin/cache/dart-sdk/bin"

ENV PATH="$PATH:${FLUTTER_PATH}:${PUB_CACHE_BIN}:${DART_PATH}"

# Added alias 'livecode' to execute web dev server
RUN echo 'alias livecode="flutter packages pub global run webdev serve --hostname 0.0.0.0 --auto restart"' >> ~/.bashrc

# Execute minimum actions for flutter development
RUN flutter precache && flutter config --no-analytics && flutter upgrade
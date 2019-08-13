# Flutter Remote Development Docker Image

This is a base Ubuntu 18.04 image already configured to execute flutter & dart commands.

You could run this image locally with:

`docker run -it --name flutter-web antoniopicone/flutter-web /bin/bash`

To avoid running in root mode, there is a sudo user `devuser` and flutter SDK is now in its home directory.
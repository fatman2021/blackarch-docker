blackarch-docker
================

v0.1
Note: DO NOT BUILD MANUALLY YET, it currently munches up HDD space every
re-build, it should be ok when I get a working version.

1. Pull repo

2. Put ssh keys in ssh (If needed)

3. Put gpg keys in ssh (If needed)

4. Edit pacman.conf server

5. ```docker build -t blackarch/docker .```

6. ```docker run -i -t blackarch/docker /bin/bash```

View [here](https://index.docker.io/u/blackarch/docker/) for build info.

If you need to access the blackarch docker index account for any reason, email me for the details. Make sure it's signed so I know you're from the ba dev team.

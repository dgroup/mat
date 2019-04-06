**Description** 

[![License: MIT](https://img.shields.io/github/license/mashape/apistatus.svg)](./license.txt)
[![Commit activity](https://img.shields.io/github/commit-activity/y/dgroup/mat.svg?style=flat-square)](https://github.com/dgroup/mbox4j/graphs/commit-activity)
[![0pdd](http://www.0pdd.com/svg?name=dgroup/mat)](http://www.0pdd.com/p?name=dgroup/mat)

Base docker image with OpenJDK 8 and MAT: `dgroup/openjdk8-mat`
By default the MAT `v1.8.1.20180910` is used.

**Run the MAT in order to parse the heap dump**
```bash
docker run -it --rm -v "$PWD":/dumps -w /dumps \
  dgroup/mat /mat/ParseHeapDump.sh \
  java_pid8.hprof \
  org.eclipse.mat.api:suspects \
  org.eclipse.mat.api:overview \
  org.eclipse.mat.api:top_components
```

**Run the MAT and override the default `MemoryAnalyzer.ini` settings"**
1. Define your own `MemoryAnalyzer.ini`
2. Pass custom settings to the docker container
    ```bash
    docker run -it --rm -v "$PWD":/dumps \
      -v "$PWD/MemoryAnalyzer.ini":/mat/MemoryAnalyzer.ini \
      -w /dumps -m 5g \
      dgroup/mat /mat/ParseHeapDump.sh \
      java_pid8.hprof \
      org.eclipse.mat.api:suspects \
      org.eclipse.mat.api:overview \
      org.eclipse.mat.api:top_components
    ```

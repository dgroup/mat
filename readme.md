**Description** 

[![](https://images.microbadger.com/badges/image/dgroup/mat.svg)](https://microbadger.com/images/dgroup/mat "Image layers")
[![](https://img.shields.io/docker/pulls/dgroup/mat.svg)](https://hub.docker.com/r/dgroup/mat "Image pulls")
[![](https://images.microbadger.com/badges/version/dgroup/mat.svg)](https://microbadger.com/images/dgroup/mat "Image version")
[![Commit activity](https://img.shields.io/github/commit-activity/y/dgroup/mat.svg?style=flat-square)](https://github.com/dgroup/mat/graphs/commit-activity)
[![License: MIT](https://img.shields.io/github/license/mashape/apistatus.svg)](./license.txt)
[![0pdd](http://www.0pdd.com/svg?name=dgroup/mat)](http://www.0pdd.com/p?name=dgroup/mat)

Base docker image with OpenJDK 8 and MAT: `dgroup/mat`
By default the MAT `v1.8.1.20180910` is used.

**Run the MAT in order to parse the heap dump**
```bash
docker run -it --rm -v "$PWD":/dumps -w /dumps \
  dgroup/mat /mat/ParseHeapDump.sh \
  <heap-dump>.hprof \
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
      <heap-dump>.hprof \
      org.eclipse.mat.api:suspects \
      org.eclipse.mat.api:overview \
      org.eclipse.mat.api:top_components
    ```

# gitlab-ci-android-ndk
[![/gitlab-ci-android-ndk](http://dockeri.co/image/minhkhanh/gitlab-ci-android-ndk)](https://hub.docker.com/r/minhkhanh/gitlab-ci-android-ndk/)

| Pulls | Stars | Size |
| ----- | ----- | ---- |
| [![](https://img.shields.io/docker/pulls/minhkhanh/gitlab-ci-android-ndk.svg)](https://hub.docker.com/r/minhkhanh/gitlab-ci-android-ndk/) | [![](https://img.shields.io/docker/stars/minhkhanh/gitlab-ci-android-ndk.svg)](https://hub.docker.com/r/minhkhanh/gitlab-ci-android-ndk/) | [![](https://images.microbadger.com/badges/image/minhkhanh/gitlab-ci-android-ndk.svg)](https://microbadger.com/images/minhkhanh/gitlab-ci-android-ndk) |


## Included
* OpenJDK 8
* Git
* Android NDK r15c

## Build image

```bash
docker build -t minhkhanh/gitlab-ci-android-ndk .
```

## Push build version to repository

```bash
docker push minhkhanh/gitlab-ci-android-ndk
```

## Usage

### GitLab CI

This is what my .gitlab-ci.yml looks like:

```yaml
image: minhkhanh/gitlab-ci-android-ndk
stages:
  - build

build:
  stage: build
  script:
    - gradle build
  only:
    - master

```

### Without GitLab

```bash
docker pull minhkhanh/gitlab-ci-android-ndk
```

Change directory to your project directory, then run:

```bash
docker run --tty --interactive --volume=$(pwd):/opt/workspace --user `id -u` --workdir=/opt/workspace --rm minhkhanh/gitlab-ci-android-ndk /bin/sh -c "gradle build"
```
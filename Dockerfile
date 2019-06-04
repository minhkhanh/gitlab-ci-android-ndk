FROM openjdk:8-jdk
LABEL Khanh Tran <khanhtm@vng.com.vn>

ENV SDK_HOME /opt

WORKDIR $SDK_HOME

# Install required dependencies
RUN dpkg --add-architecture i386
RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget tar unzip git file libc6:i386 libstdc++6:i386 libgcc1:i386 libncurses5:i386 libz1:i386 zip python3 p7zip-full cmake build-essential

# Android NDK
ENV ANDROID_NDK_VERSION r15c
ENV ANDROID_NDK_URL http://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip
RUN curl -L "${ANDROID_NDK_URL}" -o android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip  \
  && unzip android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip -d ${SDK_HOME}  \
  && rm -rf android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip
ENV ANDROID_NDK_HOME ${SDK_HOME}/android-ndk-${ANDROID_NDK_VERSION}
ENV PATH ${ANDROID_NDK_HOME}:$PATH
RUN chmod +x ${ANDROID_NDK_HOME}/ndk-build

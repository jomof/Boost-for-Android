echo ${JAVA_HOME}
export JAVA_HOME=/Users/runner/hostedtoolcache/Java_Adopt_jdk/8.0.292-10/x64/Contents/Home
export ANDROID_SDK_ROOT=${ANDROID_SDK_ROOT:-/Users/jomof/Library/Android/sdk}
export NDK_ROOT=${ANDROID_SDK_ROOT}/ndk/20.1.5948944
yes | ${ANDROID_SDK_ROOT}/sdkmanager --install "ndk;20.1.5948944" > nul
export BOOST_VERSION=1.73.0
mkdir -p bins
mkdir -p logs

for abi in armeabi-v7a # arm64-v8a x86 x86_64
do
  CXXFLAGS="-std=c++14" ./build-android.sh --boost=${BOOST_VERSION} --arch=$abi --with-libraries=atomic,random,date_time,filesystem,system,thread,chrono "${NDK_ROOT}"
  mkdir -p bins/prefab/modules/boost
  mv build/out/$abi/lib bins/prefab/modules/boost/$abi || true
done

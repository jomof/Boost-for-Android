export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
yes | sdkmanager --install "ndk;20.1.5948944" > nul
export NDK_ROOT=${ANDROID_SDK_ROOT}/ndk/20.1.5948944
export BOOST_VERSION=1.73.0
for abi in armeabi-v7a # arm64-v8a x86 x86_64
do
CXXFLAGS="-std=c++14" ./build-android.sh --boost=${BOOST_VERSION} --arch=$abi --with-libraries=atomic,random,date_time,filesystem,system,thread,chrono "${NDK_ROOT}"
done
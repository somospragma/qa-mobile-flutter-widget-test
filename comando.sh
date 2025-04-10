pushd android
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget="./integration_test/e2e_unauth_test.dart"
popd
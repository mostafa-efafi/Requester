#For each integrated test, the following command must be executed once in the path of the "android" direcory and the output "debug.apk" file must be uploaded to Firebase test lab.

flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=integration_test/get_request_test.dart
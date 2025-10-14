SHELL := /bin/bash
del-dot:
	find . -type f -name '._*' -delete

#HELPER
get:
	 flutter pub get
full:
	 flutter clean &&  flutter pub get --no-example && cd ios/ && rm -rf Pods && rm -rf Podfile.lock && pod install

#GEN
lang:
	 flutter gen-l10n --output-dir=langs/arb
gen:
	 flutter pub run build_runner build --delete-conflicting-outputs

##IPA
ipa-dev:
	 flutter build ios --release -t lib/main_dev.dart
ipa:
	 flutter build ios --release -t lib/main_prod.dart

#AAB
aab-dev:
	 flutter build appbundle -t lib/main_dev.dart

aab-prod:
	 flutter build appbundle -t lib/main_prod.dart

# aab:
# 	 flutter clean && flutter pub get && cd ios && pod install && cd .. && flutter gen-l10n --output-dir=lib/langs/arb && flutter build appbundle -t lib/main_prod.dart

#APK
apk-dev:
	 flutter build apk -t lib/main_dev.dart
apk-prod:
	 flutter build apk -t lib/main_prod.dart
# apk:
# 	 flutter clean && flutter pub get && cd ios && pod install && cd .. && flutter gen-l10n --output-dir=lib/langs/arb && flutter build apk -t lib/main_prod.dart

#GIT
pull:
	git fetch && git pull origin develop

#CMD RUN
rundev:
	 flutter run --release --target lib/main_dev.dart

#OPEN XCODE
openios:
	open ios/Runner.xcworkspace

#ENV
env:
	flutter run --dart-define-from-file=.env

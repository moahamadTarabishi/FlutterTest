.PHONY: gen watch run run-release build-apk build-ios test analyze clean

gen:
	dart run build_runner build --delete-conflicting-outputs

watch:
	dart run build_runner watch --delete-conflicting-outputs

run: gen
	flutter run

run-release: gen
	flutter run --release

build-apk: gen
	flutter build apk --release

build-ios: gen
	flutter build ios --release

test: gen
	flutter test

analyze: gen
	flutter analyze

clean:
	flutter clean
	dart run build_runner clean

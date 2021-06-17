# flight_project

This is a simple framework to demonstrate a problem that I am having with accessing assets from other packages.

The project uses the 'melos' package (which can be installed from pub.dev using `dart pub global activate melos`) to manage a monorepo which contains
- 2 apps
- 1 library/package that is common to the 2 apps.

With this structure, the apps are able access the classes that are defined/exported by the shared library/package.

Unfortunately, there is an issue with the shared **assets**, specifically the JSON files that contain the language translations.
When either of the apps are launched, they cause an exception in `flutter/services/asset_bundle.dart`

`E/flutter (25659): [ERROR:flutter/lib/ui/ui_dart_state.cc(177)] Unhandled Exception: Unable to load asset: lang/en.json`

It appears that the assets are not being built into the rootBundle (if you set a breakpoint on line #24 in app_localizations.dart, rootBundle shows as empty).


## Note regarding package variations
The current/latest version of `flight_translations_library/pubspec.yaml` does not explicitly specify the assets that are included in the package.
According to the documentation, since the assets are within the `/lib` directory, they should _automatically_ be included in the package.

However, I have also tried explicitly identifying the assets with
```yaml
flutter:
  assets:
    - lang/en.json
    - lang/es.json
    - lang/fr.json
```
This yielded the same error.

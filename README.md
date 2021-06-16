# flight_project

This is a simple framework to demonstrate a problem that I am having with accessing assets from other packages.

The project uses the 'melos' package (which can be installed from pub.dev using `dart pub global activate melos`) to manage a monorepo which contains
- 2 apps
- 3 libraries/packages that are common to the 2 apps.

With this structure, the apps are able access the libraries/packages that are shared by them, and the libraries/packages can access each other.

Unfortunately, there is an issue with the shared assets, specifically the JSON files that contain the language translations.
When either of the apps are launched, they cause an exception in flutter services/asset_bundle.dart

`E/flutter (25659): [ERROR:flutter/lib/ui/ui_dart_state.cc(177)] Unhandled Exception: Unable to load asset: lang/en.json`

It appears that the assets are not being built into the rootBundle (it's empty).

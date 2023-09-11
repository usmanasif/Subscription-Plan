# Subscription-Plan

Subscription Plan mocks the Adobe XD Subscription Plan Screen Designed With Pixel Perfect Designing.

## Screenshot
<p align="center">
    <img src="https://user-images.githubusercontent.com/473630/266867936-53f189de-51b0-4490-a335-31238b04c696.png" width="200" height="400" />
</p>

## Usage

1. Clone the repository locally or use the template for your own projects:

2. Install dependencies using the following command:

```bash
flutter pub get
```

3. Generate files with `build_runner`:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app on your emulator of choice (simulator in case of iOS):

```
flutter run
```

## Folder Structure

```
lib/
|- api/
|- app/
|- constants/
|- enums/
|- exceptions/
|- models/
|- services
|- ui
  |- [screen_name]/
  |- shared/
|- utils
|- main.dart
```


## Custom Features
Custom dialogs added to make user experience seemless.
Error handling to handle exceptions in case of API failure.
db.json file contains the JSON Data that is being fetched from mocki.io server.
Refresh handlers to call the API.
FontAwesome and Ionicons added to the subscriptions.
Built in navigation service. No custom handlers required.




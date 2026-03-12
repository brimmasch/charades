# Charades

A mobile charades game built with Flutter for Android and web.

## What it does

Players take turns holding the phone to their forehead. The phone detects when it's in position using the accelerometer and automatically starts a countdown. Words are shown one at a time — tilt forward to score a point (GOT IT), tilt backward to skip (PASS). The screen locks to landscape during gameplay to prevent accidental rotation.

### Features

- Multiple word categories including Animals, Movies, Sports, and Just For Kids
- Custom categories — create, edit, and export your own word lists
- Adjustable game duration (15 seconds to 3 minutes), remembered between sessions
- Accelerometer-based tilt detection — no buttons needed during play
- Works on Android and in the browser (web version uses on-screen buttons)
- Results screen showing every word and whether it was guessed or passed
- Game history — past games are listed below the categories, showing date, category, and score; tap any entry to see the full word-by-word breakdown

## Running the app

**Web:**
```
cd charades
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0
```

**Android debug APK:**
```
cd charades
flutter build apk --debug
```
The APK will be at `build/app/outputs/apk/debug/charades-debug.apk`.

**Android release APK:**
```
cd charades
flutter build apk --release
```
The APK will be at `build/app/outputs/apk/release/charades.apk`.

---

*Made for Elsie and Hazel with love.*

# PollOcean

An iOS fishing game about ocean pollution. Players fish in an animated sea, sort marine life from the plastic and glass they pull out of the water, and learn about both in an in-game journal.

## Gameplay

1. **Spot a shadow** in the water and tap it to cast.
2. **Reel it in** by tracing a randomly chosen path with your finger: a line, a square, an arc, an S-curve or a zigzag.
3. **Sort the catch**: swipe up if it is a sea creature, down if it is trash.

Each correct swipe scores a point and each mistake costs one of three lives.

The **Journal** describes the sea animals and the types of marine waste that appear in the game.

## Technical highlights

- Written in **Swift** and **SwiftUI**.
- **Gesture-driven mechanics**: drag gestures constrained to a generated path, and swipe direction checks for sorting.
- **Procedural paths** built with SwiftUI `Path`.
- **Looping video background** with AVKit and a custom font (Kodchasan).

## Requirements

- Xcode 16 or later
- iOS 18

## Getting started

Clone the repository, open `PollOcean.xcodeproj` in Xcode and run the **PollOcean** scheme on an iPhone simulator or device.

## Project structure

```
Fishing/    app entry point, fishing mini-games and path generator, assets
View/       main menu and game screen
Journal/    journal of sea animals and marine waste
Font/       Kodchasan font files
```

## Credits

The Kodchasan font is licensed under the SIL Open Font License (see `Font/OFL.txt`).

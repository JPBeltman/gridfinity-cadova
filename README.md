# Gridfinity-Cadova

A Swift library for generating [Gridfinity](https://www.youtube.com/watch?v=ra_9zU-mnl8) storage system components using [Cadova](https://github.com/tomasf/Cadova). Gridfinity is a modular storage system designed by Zack Freedman that uses a standardized 42mm × 42mm grid.

This project can be used in two ways:

### Generate standard Gridfinity parts
Run the included generator to create bins, baseplates, and baseplate sets with configurable dimensions, ready for 3D printing.

### Build custom Gridfinity-compatible designs
Import the library into your own Cadova projects and use the provided components as building blocks to create specialized storage solutions that integrate with the Gridfinity ecosystem.

## Features

### Bins

`Bin` creates hollow storage containers with configurable dimensions:

```swift
Bin(
    size: Units3D(x: 2, y: 2, z: 3),
    wallThickness: 1.0,
    bottomThickness: 0.6,
    innerBottomCornerRadius: 1.0,
    withStackingLip: true
)
```

- Size specified in grid units (42mm × 42mm × 7mm)
- Configurable wall and bottom thickness
- Optional stacking lip for nesting bins without a baseplate

### Baseplates

`Baseplate` creates the base platform that bins snap into:

```swift
Baseplate(size: Units2D(x: 4, y: 4), options: [.tabs, .screws])
```

Options:
- `.foundation` – Adds a 7mm foundation layer
- `.tabs` – Interlocking tabs for connecting adjacent baseplates
- `.screws` – M3 screw holes and nut traps for secure fastening
- `.magnets` – 6.5mm magnet slots in each grid cell

### Baseplate Sets

`BaseplateSet` automatically partitions a large area into printable baseplate pieces:

```swift
BaseplateSet(
    footprint: Vector2D(713, 495),  // Target area (e.g., drawer interior)
    printbedSize: Vector2D(340, 320),  // Your printer's bed size
    frontPadding: 10,  // Optional non-grid space at front
    options: [.tabs, .screws]
)
```

Generates:
- Main baseplate pieces that tile the grid-aligned area
- Narrow/shallow pieces for partial grid coverage
- Corner pieces where needed
- Side spacers to fill non-grid gaps on left/right edges
- Front/back spacers for non-grid depth, automatically split to fit the print bed

### Blocks

`Block` creates solid Gridfinity base units (used internally by `Bin`):

```swift
Block(size: Units2D(x: 3, y: 2), height: 42)
```

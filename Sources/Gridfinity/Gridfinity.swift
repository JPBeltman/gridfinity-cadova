import Foundation
import Cadova

/// A 2D grid unit count for the Gridfinity modular storage system.
///
/// Gridfinity uses a standardized 42mm × 42mm grid. This type represents
/// a count of grid units in the X and Y dimensions.
public struct Units2D: Hashable, Sendable {
    /// The number of grid units in the X dimension.
    public let x: Int
    /// The number of grid units in the Y dimension.
    public let y: Int

    /// The physical size of one Gridfinity grid unit (42mm × 42mm).
    public static let size = Vector2D(42, 42)

    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

/// A 3D grid unit count for the Gridfinity modular storage system.
///
/// Extends the 2D grid with a Z dimension using a 7mm vertical unit height.
public struct Units3D: Hashable, Sendable {
    /// The number of grid units in the X dimension.
    public let x: Int
    /// The number of grid units in the Y dimension.
    public let y: Int
    /// The number of grid units in the Z dimension.
    public let z: Int

    public init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }

    public init(base: Units2D, z: Int) {
        self.x = base.x
        self.y = base.y
        self.z = z
    }

    public var base: Units2D {
        Units2D(x: x, y: y)
    }

    /// The physical size of one Gridfinity 3D grid unit (42mm × 42mm × 7mm).
    public static let size = Vector3D(Units2D.size, z: 7)
}

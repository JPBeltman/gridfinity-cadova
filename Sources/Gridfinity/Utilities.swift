import Cadova

extension BezierPath2D {
    static func roundedRectangle(size: Vector2D, cornerRadius: Double) -> Self {
        let rectangleSize = size - 2 * cornerRadius
        return BezierPath2D(from: [-rectangleSize.x / 2, -size.y / 2], mode: .relative) {
            line(x: rectangleSize.x)
            counterclockwiseArc(centerY: cornerRadius, angle: 90°)
            line(y: rectangleSize.y)
            counterclockwiseArc(centerX: -cornerRadius, angle: 90°)
            line(x: -rectangleSize.x)
            counterclockwiseArc(centerY: -cornerRadius, angle: 90°)
            line(y: -rectangleSize.y)
            counterclockwiseArc(centerX: cornerRadius, angle: 90°)
        }
    }
}

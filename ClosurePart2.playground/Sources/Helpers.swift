import Foundation

public class SimpleRounding: NSDecimalNumberBehaviors {
    public init(){}
    
    @objc public func scale() -> Int16 {
        return 3
    }
    
    @objc public func roundingMode() -> NSRoundingMode {
        return .RoundDown
    }
    
    @objc public func exceptionDuringOperation(operation: Selector, error: NSCalculationError, leftOperand: NSDecimalNumber, rightOperand: NSDecimalNumber?) -> NSDecimalNumber? {
        return leftOperand
    }
}

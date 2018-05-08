import Foundation


public extension Unicode.Scalar {
    /// Match the unicode scalar within the alphabet range
    ///
    /// - Parameters:
    ///   - alphabets: A collection of Alphabet
    ///   - isSpecialChar: If the scalar is a special char
    /// - Returns: An Alphabet if exists
    public func match(in alphabets: [Alphabet], isSpecialChar: Bool) -> Alphabet? {
        guard !alphabets.isEmpty, let firstRange = alphabets.first else {
            return nil
        }
        if isSpecialChar || firstRange.range ~= value { return firstRange }
        return match(in: Array(alphabets.dropFirst()), isSpecialChar: isSpecialChar)
    }
}

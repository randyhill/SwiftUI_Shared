//
//  String+Ike.swift
//  Ike
//
//  Created by Randy Hill on 11/26/20.
//

//import UIKit

extension String {
	var fileExtension: String? {
		let components: [String] = self.components(separatedBy: ".")
		let fileExtension: String? = components.last
		if let fileExtension = fileExtension, !fileExtension.isEmpty, fileExtension != self {
			return fileExtension
		}
		return nil
	}
    
    var double: Double? {
        if self.count == 0 {
            return 0.0
        }
        guard let newDouble = Double(self) else {
            Log.error("Could not convert: \(self) to double")
            return nil
        }
        return newDouble
    }
    
    static func toString(_ value: Double?, noValueString: String = "N/A") -> String {
        guard let value = value else { return noValueString}
        return value.formatToDecimalPlaces()
    }
    
    static func toPercent(_ value: Double?, noValueString: String = "N/A") -> String {
        guard let value = value else { return noValueString}
        let percent = value * 100
        return "\(percent.formatToDecimalPlaces(min: 0, max: 1))%"
    }

	func prepend(string: String, onlyIfMissing: Bool) -> String {
		 let hasPrefix: Bool = self.hasPrefix(string)
		 if hasPrefix {
			 if onlyIfMissing {
				 return self
			 }
		 }
		 return [string, self].joined()
	}
	
	func truncateTo(_ length: Int, addEllipsis: Bool = false) -> String {
		if self.count <= length {
			return self
		}
		let truncated = String(self.prefix(length))
		if addEllipsis {
			return truncated + " ..."
		}
		return truncated
	}
	
	// Condense multiple character white space to single character and trim all whitespace from ends.
	func condenseWhitespace(trim: Bool = true) -> String {
		let condensed = self.replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
		if trim {
			return condensed.trimmingCharacters(in: .whitespacesAndNewlines)
		}
		return condensed
	}
}

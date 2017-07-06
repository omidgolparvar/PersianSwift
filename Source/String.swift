//
//  String.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/6/17.
//
//

import Foundation

public extension String {
	
	var isPersianPhoneNumber: Bool {
		let input = self.withEnglishDigits
		do {
			let regex = try NSRegularExpression(pattern: "(0|\\+98)?([ ]|-|[()]){0,2}9([ ]|-|[()]){0,2}(?:[0-9]([ ]|-|[()]){0,2}){9}", options: .caseInsensitive)
			return regex.firstMatch(in: input, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, input.characters.count)) != nil
		} catch {
			return false
		}
	}
	
	var withPersianDigits: String {
		var returnString: String = self
		returnString = returnString.replacingOccurrences(of: "0", with: "۰")
		returnString = returnString.replacingOccurrences(of: "1", with: "۱")
		returnString = returnString.replacingOccurrences(of: "2", with: "۲")
		returnString = returnString.replacingOccurrences(of: "3", with: "۳")
		returnString = returnString.replacingOccurrences(of: "4", with: "۴")
		returnString = returnString.replacingOccurrences(of: "5", with: "۵")
		returnString = returnString.replacingOccurrences(of: "6", with: "۶")
		returnString = returnString.replacingOccurrences(of: "7", with: "۷")
		returnString = returnString.replacingOccurrences(of: "8", with: "۸")
		returnString = returnString.replacingOccurrences(of: "9", with: "۹")
		
		returnString = returnString.replacingOccurrences(of: ",", with: "،")
		
		return returnString
	}
	
	var withEnglishDigits: String {
		var returnString: String = self
		returnString = returnString.replacingOccurrences(of: "۰", with: "0")
		returnString = returnString.replacingOccurrences(of: "۱", with: "1")
		returnString = returnString.replacingOccurrences(of: "۲", with: "2")
		returnString = returnString.replacingOccurrences(of: "۳", with: "3")
		returnString = returnString.replacingOccurrences(of: "۴", with: "4")
		returnString = returnString.replacingOccurrences(of: "۵", with: "5")
		returnString = returnString.replacingOccurrences(of: "۶", with: "6")
		returnString = returnString.replacingOccurrences(of: "۷", with: "7")
		returnString = returnString.replacingOccurrences(of: "۸", with: "8")
		returnString = returnString.replacingOccurrences(of: "۹", with: "9")
		
		returnString = returnString.replacingOccurrences(of: "،", with: ",")
		
		return returnString
	}
	
	var withFixedPersianCharacters: String {
		var returnString: String = self
		returnString = returnString.replacingOccurrences(of: "ي", with: "ی")
		returnString = returnString.replacingOccurrences(of: "ك", with: "ک")
		
		return returnString
	}
	
	var withIranRialStyle: String? {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		
		guard
			let double = Double(self),
			let string = formatter.string(from: NSNumber(value: double))
			else { return nil }
		
		return string.withPersianDigits + " ریال"
	}
	
	var withIranTomanStyle: String? {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		
		guard
			let double = Double(self),
			let string = formatter.string(from: NSNumber(value: double))
			else { return nil }
		
		return string.withPersianDigits + " تومان"
	}
	
	var withCurrencyStyle: String? {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		
		guard
			let double = Double(self),
			let string = formatter.string(from: NSNumber(value: double))
			else { return nil }
		
		return string.withPersianDigits
	}
	
	
	
	mutating func toEnglishDigits() {
		self = self.withEnglishDigits
	}
	
	mutating func toPersianDigits() {
		self = self.withPersianDigits
	}
	
	mutating func fixPersianCharacters() {
		self = self.withFixedPersianCharacters
	}
	
	func asPersianDate(fromGregorianFormat iF: String) -> String? {
		return PersianSwift.PersianDate(input: self, inputFormat: iF)?.output
	}
	
	
	
	
}







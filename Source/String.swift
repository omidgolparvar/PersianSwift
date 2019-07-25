//
//  String.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/6/17.
//
//

import Foundation

extension String {
	
	internal func stringByReplacingFirstOccurrenceOfString(target: String, withString replaceString: String) -> String {
		if let range = self.range(of: target) {
			return self.replacingCharacters(in: range, with: replaceString)
		}
		return self
	}
	
}

extension String: PersianSwiftCompatible {}


public extension PersianSwiftHelper where Base == String {
	
	var isPersianPhoneNumber: Bool {
		return PersianSwift.PersianString.IsPersianPhoneNumber(input: self.base)
	}
	
	var withPersianDigits: String {
		return PersianSwift.PersianString.StringWithPersianDigits(from: self.base)
	}
	
	var withEasternDigits: String {
		return PersianSwift.PersianString.StringWithEasternDigits(from: self.base)
	}
	
	var withFixedPersianCharacters: String {
		return PersianSwift.PersianString.StringWithFixedPersianCharacters(from: self.base)
	}
	
	var withIranRialStyle: String? {
		return PersianSwift.PersianString.StringWithIranRialStyle(from: self.base)
	}
	
	var withIranTomanStyle: String? {
		return PersianSwift.PersianString.StringWithIranTomanStyle(from: self.base)
	}
	
	var withCurrencyStyle: String? {
		return PersianSwift.PersianString.StringWithCurrencyStyle(from: self.base)
	}
	
	
	mutating func toEnglishDigits() {
		self.base = self.base.ps.withEasternDigits
	}
	
	mutating func toPersianDigits() {
		self.base = self.base.ps.withPersianDigits
	}
	
	mutating func fixPersianCharacters() {
		self.base = self.base.ps.withFixedPersianCharacters
	}
	
	func asPersianDate(fromGregorianFormat inputFormat: String = PersianSwift.PersianDate.DefaultInputFormat) -> String? {
		return PersianSwift.PersianDate(from: self.base, inputFormat: inputFormat)?.getDateString()
	}
	
	mutating func removeIranCountryCode() {
		if self.base.hasPrefix("+989") {
			self.base = self.base.stringByReplacingFirstOccurrenceOfString(target: "+989", withString: "09")
		} else if self.base.hasPrefix("00989") {
			self.base = self.base.stringByReplacingFirstOccurrenceOfString(target: "00989", withString: "09")
		} else if self.base.hasPrefix("989") {
			self.base = self.base.stringByReplacingFirstOccurrenceOfString(target: "989", withString: "09")
		}
	}
	
	func removedIranCountryCode() -> String {
		if self.base.hasPrefix("+989") {
			return self.base.stringByReplacingFirstOccurrenceOfString(target: "+989", withString: "09")
		} else if self.base.hasPrefix("00989") {
			return self.base.stringByReplacingFirstOccurrenceOfString(target: "00989", withString: "09")
		} else if self.base.hasPrefix("989") {
			return self.base.stringByReplacingFirstOccurrenceOfString(target: "989", withString: "09")
		}
		return self.base
	}
}






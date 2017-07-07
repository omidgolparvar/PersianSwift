//
//  String.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/6/17.
//
//

import Foundation

public extension String {
	
	var PS_isPersianPhoneNumber: Bool {
		return PersianSwift.PersianString.IsPersianPhoneNumber(input: self)
	}
	
	var PS_withPersianDigits: String {
		return PersianSwift.PersianString.StringWithPersianDigits(from: self)
	}
	
	var PS_withEasternDigits: String {
		return PersianSwift.PersianString.StringWithEasternDigits(from: self)
	}
	
	var PS_withFixedPersianCharacters: String {
		return PersianSwift.PersianString.StringWithFixedPersianCharacters(from: self)
	}
	
	var PS_withIranRialStyle: String? {
		return PersianSwift.PersianString.StringWithIranRialStyle(from: self)
	}
	
	var PS_withIranTomanStyle: String? {
		return PersianSwift.PersianString.StringWithIranTomanStyle(from: self)
	}
	
	var PS_withCurrencyStyle: String? {
		return PersianSwift.PersianString.StringWithCurrencyStyle(from: self)
	}
	
	
	mutating func PS_toEnglishDigits() {
		self = self.PS_withEasternDigits
	}
	
	mutating func PS_toPersianDigits() {
		self = self.PS_withPersianDigits
	}
	
	mutating func PS_fixPersianCharacters() {
		self = self.PS_withFixedPersianCharacters
	}
	
	func PS_asPersianDate(fromGregorianFormat iF: String = PersianSwift.PersianDate.DefaultInputFormat) -> String? {
		return PersianSwift.PersianDate(from: self, inputFormat: iF)?.output
	}
	
	
	
	
	
	
}







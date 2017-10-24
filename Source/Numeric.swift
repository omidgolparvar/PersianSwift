//
//  Numeric.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/6/17.
//
//

import Foundation

extension Int		: PersianSwiftCompatible {}
extension Double	: PersianSwiftCompatible {}
extension Float		: PersianSwiftCompatible {}

public extension PersianSwiftHelper where Base == Int {
	
	var string: String {
		return String(describing: self.base)
	}
	
	var stringWithPersianDigits: String {
		return String(describing: self.base).ps.withPersianDigits
	}
	
	var stringWithCurrencyStyle: String {
		return String(describing: self.base).ps.withCurrencyStyle!
	}
	
}

public extension PersianSwiftHelper where Base == Double {
	
	var string: String {
		return String(describing: self.base)
	}
	
	var stringWithPersianDigits: String {
		return String(describing: self.base).ps.withPersianDigits
	}
	
	var stringWithCurrencyStyle: String {
		return String(describing: self.base).ps.withCurrencyStyle!
	}
	
}

public extension PersianSwiftHelper where Base == Float {
	
	var string: String {
		return String(describing: self.base)
	}
	
	var stringWithPersianDigits: String {
		return String(describing: self.base).ps.withPersianDigits
	}
	
	var stringWithCurrencyStyle: String {
		return String(describing: self.base).ps.withCurrencyStyle!
	}
	
}



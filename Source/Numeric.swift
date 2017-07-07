//
//  Numeric.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/6/17.
//
//

import Foundation

public protocol Numeric {}

extension Int		: Numeric {}
extension Double	: Numeric {}
extension Float		: Numeric {}

public extension Numeric {
	
	var PS_string: String {
		return String(describing: self)
	}
	
	var PS_stringWithPersianDigits: String {
		return String(describing: self).PS_withPersianDigits
	}
	
	var PS_stringWithCurrencyStyle: String {
		return String(describing: self).PS_withCurrencyStyle!
	}
	
}

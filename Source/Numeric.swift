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
	
	var string: String {
		return String(describing: self)
	}
	
	var stringWithPersianDigits: String {
		return String(describing: self).withPersianDigits
	}
	
}

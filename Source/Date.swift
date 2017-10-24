//
//  Date.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/6/17.
//
//

import Foundation

extension Date : PersianSwiftCompatible {}

public extension PersianSwiftHelper where Base == Date {
	
	var asPersianDate: String {
		return PersianSwift.PersianDate(from: self.base).output
	}
	
	var asFullPersianDateTime: String {
		return PersianSwift.PersianDate(from: self.base, outputFormat: .ultraLongDateAndTime).output
	}
	
}

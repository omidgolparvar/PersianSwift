//
//  Date.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/6/17.
//
//

import Foundation

public extension Date {
	
	var PS_asPersianDate: String {
		return PersianSwift.PersianDate(from: self).output
	}
	
	var PS_asFullPersianDateTime: String {
		return PersianSwift.PersianDate(from: self, outputFormat: .ultraLongDateAndTime).output
	}
	
}

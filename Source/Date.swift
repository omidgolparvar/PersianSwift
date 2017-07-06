//
//  Date.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/6/17.
//
//

import Foundation

public extension Date {
	
	var asPersianDate: String {
		return PersianSwift.PersianDate(from: self).output
	}
	
	var asFullPersianDateTime: String {
		return PersianSwift.PersianDate(from: self, outputFormat: .yyyy_mm_dd_hh_mm_ss).output
	}
	
}

//
//  Array.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/7/17.
//
//

import Foundation

public extension Array where Element == String {
	
	var sortedPersianStrings: [String] {
		return PersianSwift.PersianString.SortedPersianStringArray(from: self as [String])
	}
	
	mutating func sortPersianStrings(desc: Bool) {
		self = PersianSwift.PersianString.SortedPersianStringArray(from: self as [String], desc: desc)
	}
	
}

//
//  ps.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/6/17.
//
//

import Foundation

public protocol PersianSwiftCompatible {
	associatedtype someType
	var ps: someType { get }
}

public extension PersianSwiftCompatible {
	public var ps: PersianSwiftHelper<Self> {
		get { return PersianSwiftHelper(self) }
	}
}

public struct PersianSwiftHelper<Base> {
	var base: Base
	init(_ base: Base) {
		self.base = base
	}
}

public class PersianSwift {
	
	public class PersianString {
		
		static func IsPersianPhoneNumber(input string: String) -> Bool {
			let input = PersianString.StringWithEasternDigits(from: string)
			do {
				let regex = try NSRegularExpression(pattern: "(0|\\+98)?([ ]|-|[()]){0,2}9([ ]|-|[()]){0,2}(?:[0-9]([ ]|-|[()]){0,2}){9}", options: .caseInsensitive)
				return regex.firstMatch(in: input, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, input.count)) != nil
			} catch {
				return false
			}
		}
		
		static func StringWithPersianDigits(from string: String) -> String {
			let returnString = string
				//Replace English Numbers
				.replacingOccurrences(of: "0", with: "۰")
				.replacingOccurrences(of: "1", with: "۱")
				.replacingOccurrences(of: "2", with: "۲")
				.replacingOccurrences(of: "3", with: "۳")
				.replacingOccurrences(of: "4", with: "۴")
				.replacingOccurrences(of: "5", with: "۵")
				.replacingOccurrences(of: "6", with: "۶")
				.replacingOccurrences(of: "7", with: "۷")
				.replacingOccurrences(of: "8", with: "۸")
				.replacingOccurrences(of: "9", with: "۹")
				//Replace Comma
				.replacingOccurrences(of: ",", with: "،")
				//Replace Arabic Numbers
				.replacingOccurrences(of: "٠", with: "۰")
				.replacingOccurrences(of: "١", with: "۱")
				.replacingOccurrences(of: "٢", with: "۲")
				.replacingOccurrences(of: "٣", with: "۳")
				.replacingOccurrences(of: "٤", with: "۴")
				.replacingOccurrences(of: "٥", with: "۵")
				.replacingOccurrences(of: "٦", with: "۶")
				.replacingOccurrences(of: "٧", with: "۷")
				.replacingOccurrences(of: "٨", with: "۸")
				.replacingOccurrences(of: "٩", with: "۹")
			
			return returnString
		}
		
		static func StringWithEasternDigits(from string: String) -> String {
			let returnString = string
				//Replace Persian Digits
				.replacingOccurrences(of: "۰", with: "0")
				.replacingOccurrences(of: "۱", with: "1")
				.replacingOccurrences(of: "۲", with: "2")
				.replacingOccurrences(of: "۳", with: "3")
				.replacingOccurrences(of: "۴", with: "4")
				.replacingOccurrences(of: "۵", with: "5")
				.replacingOccurrences(of: "۶", with: "6")
				.replacingOccurrences(of: "۷", with: "7")
				.replacingOccurrences(of: "۸", with: "8")
				.replacingOccurrences(of: "۹", with: "9")
				//Replace Persian Comma
				.replacingOccurrences(of: "،", with: ",")
				.replacingOccurrences(of: "٫", with: ".")
				.replacingOccurrences(of: ",", with: "")
				//Replace Arabic Digits
				.replacingOccurrences(of: "٠", with: "0")
				.replacingOccurrences(of: "١", with: "1")
				.replacingOccurrences(of: "٢", with: "2")
				.replacingOccurrences(of: "٣", with: "3")
				.replacingOccurrences(of: "٤", with: "4")
				.replacingOccurrences(of: "٥", with: "5")
				.replacingOccurrences(of: "٦", with: "6")
				.replacingOccurrences(of: "٧", with: "7")
				.replacingOccurrences(of: "٨", with: "8")
				.replacingOccurrences(of: "٩", with: "9")
			
			return returnString
		}
		
		static func StringWithFixedPersianCharacters(from string: String) -> String {
			let returnString = string
				.replacingOccurrences(of: "ي", with: "ی")
				.replacingOccurrences(of: "ك", with: "ک")
				.replacingOccurrences(of: "ى", with: "ی")
			return returnString
		}
		
		static func StringWithIranRialStyle(from string: String) -> String? {
			guard let str = string.ps.withCurrencyStyle else { return nil }
			return str + " ریال"
		}
		
		static func StringWithIranTomanStyle(from string: String) -> String? {
			guard let str = string.ps.withCurrencyStyle else { return nil }
			return str + " تومان"
		}
		
		static func StringWithCurrencyStyle(from string: String) -> String? {
			let formatter = NumberFormatter()
			formatter.numberStyle = .decimal
			formatter.locale = Locale(identifier: "fa_IR")
			
			guard
				let double = Double(string),
				let string = formatter.string(from: NSNumber(value: double))
				else { return nil }
			
			return string
		}
		
		static func SortedPersianStringArray(from array: [String], desc: Bool = false) -> [String] {
			let local = NSLocale(localeIdentifier: "fa")
			let sorted = array.sorted {
				var str1 = $0 as NSString
				var str2 = $1 as NSString
				if desc {
					(str1,str2) = (str2,str1)
				}
				return str1.compare(str2 as String, options: .caseInsensitive, range: NSMakeRange(0, str1.length), locale: local) == .orderedAscending
			}
			return sorted
		}
		
		static func LoadString(named name: String, from file: String = "Strings", params: [String]? = nil) throws -> String {
			
			guard let path = Bundle.main.path(forResource: file, ofType: "plist")
				else { throw Errors.propertyListFileNotFound(file) }
			
			guard let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject]
				else { throw Errors.propertyListIsNotDictionary(file) }
			
			guard var string = dict[name] as? String
				else { throw Errors.stringNotFound(file, name) }
			
			if let parameters = params?.enumerated() {
				parameters.forEach { (index, parameter) in
					let key = "%" + String(index + 1) + "%"
					string = string.replacingOccurrences(of: key, with: parameter)
				}
			}
			
			return string
		}
		
		public enum Errors: Error, CustomStringConvertible {
			case propertyListFileNotFound(String)
			case propertyListIsNotDictionary(String)
			case stringNotFound(String, String)
			
			public var description: String {
				switch self {
				case .propertyListFileNotFound(let fileName):
					return "Error - File Named <\(fileName)> Not Found."
				case .propertyListIsNotDictionary(let fileName):
					return "Error - PropertyList File Named <\(fileName)> Is Not Dictionary."
				case .stringNotFound(let fileName, let stringName):
					return "Error - String Named <\(stringName)> Not Found In PropertyList File Named <\(fileName)>"
				}
			}
		}
		
	}
	
	public class PersianDate {
		
		static let PersianHour		= "ساعت"
		static let PersianMonth		= "ماه"
		
		public static var DefaultInputFormat	: String		= "yyyy-MM-dd HH:mm:ss"
		public static var DefaultOutputFormat	: OutputFormat	= .longDate
		
		var inputString		: String			= ""
		var inputFormat		: String			= PersianDate.DefaultInputFormat
		
		var dateObject		: Date				= Date()
		var dateComponents	: DateComponents	= DateComponents()
		var dateFormatter	: DateFormatter		= DateFormatter()
		
		public init?(from string: String, inputFormat: String = PersianDate.DefaultInputFormat) {
			dateFormatter.calendar = Calendar(identifier: .persian)
			dateFormatter.locale = Locale(identifier: "fa_IR")
			
			self.inputString = string
			self.inputFormat = inputFormat
			
			guard let dateComponents = createDateComponents(from: string) else { return nil }
			self.dateComponents = dateComponents
		}
		
		public init(from date: Date) {
			dateFormatter.calendar = Calendar(identifier: .persian)
			dateFormatter.locale = Locale(identifier: "fa_IR")
			dateObject = date
			dateComponents = createDateComponents(from: date)
		}
		
		public func getDateString(with outputFormat: OutputFormat = PersianDate.DefaultOutputFormat) -> String {
			let dateFormat = outputFormat.format
				.replacingOccurrences(of: "*Saat*", with: PersianDate.PersianHour)
				.replacingOccurrences(of: "*Maah*", with: PersianDate.PersianMonth)
			dateFormatter.dateFormat = dateFormat
			return dateFormatter.string(from: dateObject).ps.withPersianDigits
		}
		
		private func createDateComponents(from inputString: String) -> DateComponents? {
			self.dateFormatter.dateFormat = inputFormat
			
			guard let date = dateFormatter.date(from: inputString) else { return nil }
			
			dateObject = date
			return createDateComponents(from: date)
		}
		
		private func createDateComponents(from date: Date) -> DateComponents {
			return Calendar(identifier: .persian).dateComponents([.year, .month, .day, .hour, .minute, .second, .weekday], from: date)
		}
		
		public enum OutputFormat {
			case ultraLongDateAndTime
			case longDateTime
			case longDate
			case mediumDate
			case shortDate
			case ultraShortDate
			
			case longTime
			case mediumTime
			case shortTime
			
			case custom(format: String)
			
			var format: String {
				switch self {
				case .ultraLongDateAndTime	: return "eeee d MMMM *Maah* yyyy *Saat* hh:mm:ss a"
				case .longDateTime			: return "eeee d MMMM yyyy *Saat* hh:mm:ss a"
				case .longDate				: return "eeee d MMMM yyyy"
				case .mediumDate				: return "d MMMM yyyy"
				case .shortDate				: return "yyyy/MM/d"
				case .ultraShortDate			: return "yy/MM/dd"
				case .longTime				: return "*Saat* hh:mm:ss a"
				case .mediumTime				: return "hh:mm:ss"
				case .shortTime				: return "hh:mm"
				case .custom(let format)	: return format
				}
				
			}
		}
		
		
	}
	
}

//
//  PS.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/6/17.
//
//

import Foundation

public class PersianSwift {
	
	public class PersianString {
		
		static func IsPersianPhoneNumber(input string: String) -> Bool {
			let input = PersianString.StringWithEasternDigits(from: string)
			do {
				let regex = try NSRegularExpression(pattern: "(0|\\+98)?([ ]|-|[()]){0,2}9([ ]|-|[()]){0,2}(?:[0-9]([ ]|-|[()]){0,2}){9}", options: .caseInsensitive)
				return regex.firstMatch(in: input, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, input.characters.count)) != nil
			} catch {
				return false
			}
		}
		
		static func StringWithPersianDigits(from string: String) -> String {
			var returnString: String = string
			returnString = returnString.replacingOccurrences(of: "0", with: "۰")
			returnString = returnString.replacingOccurrences(of: "1", with: "۱")
			returnString = returnString.replacingOccurrences(of: "2", with: "۲")
			returnString = returnString.replacingOccurrences(of: "3", with: "۳")
			returnString = returnString.replacingOccurrences(of: "4", with: "۴")
			returnString = returnString.replacingOccurrences(of: "5", with: "۵")
			returnString = returnString.replacingOccurrences(of: "6", with: "۶")
			returnString = returnString.replacingOccurrences(of: "7", with: "۷")
			returnString = returnString.replacingOccurrences(of: "8", with: "۸")
			returnString = returnString.replacingOccurrences(of: "9", with: "۹")
			
			returnString = returnString.replacingOccurrences(of: ",", with: "،")
			
			return returnString
		}
		
		static func StringWithEasternDigits(from string: String) -> String {
			var returnString: String = string
			returnString = returnString.replacingOccurrences(of: "۰", with: "0")
			returnString = returnString.replacingOccurrences(of: "۱", with: "1")
			returnString = returnString.replacingOccurrences(of: "۲", with: "2")
			returnString = returnString.replacingOccurrences(of: "۳", with: "3")
			returnString = returnString.replacingOccurrences(of: "۴", with: "4")
			returnString = returnString.replacingOccurrences(of: "۵", with: "5")
			returnString = returnString.replacingOccurrences(of: "۶", with: "6")
			returnString = returnString.replacingOccurrences(of: "۷", with: "7")
			returnString = returnString.replacingOccurrences(of: "۸", with: "8")
			returnString = returnString.replacingOccurrences(of: "۹", with: "9")
			
			returnString = returnString.replacingOccurrences(of: "،", with: ",")
			
			return returnString
		}
		
		static func StringWithFixedPersianCharacters(from string: String) -> String {
			var returnString: String = string
			returnString = returnString.replacingOccurrences(of: "ي", with: "ی")
			returnString = returnString.replacingOccurrences(of: "ك", with: "ک")
			return returnString
		}
		
		static func StringWithIranRialStyle(from string: String) -> String? {
			guard let str = string.PS_withCurrencyStyle else { return nil }
			return str + " ریال"
		}
		
		static func StringWithIranTomanStyle(from string: String) -> String? {
			guard let str = string.PS_withCurrencyStyle else { return nil }
			return str + " تومان"
		}
		
		static func StringWithCurrencyStyle(from string: String) -> String? {
			let formatter = NumberFormatter()
			formatter.numberStyle = .decimal
			
			guard
				let double = Double(string),
				let string = formatter.string(from: NSNumber(value: double))
				else { return nil }
			
			return string.PS_withPersianDigits
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
		static let AMSymbol			= "قبل از ظهر"
		static let PMSymbol			= "بعد از ظهر"
		static let WeekdaySymbols	= ["یکشنبه", "دوشنبه", "سه‌شنبه", "چهارشنبه", "پنج‌شنبه", "جمعه", "شنبه"]
		static let MonthSymbols		= ["فروردین","اردیبهشت","خرداد","تیر","مرداد","شهریور","مهر","آبان","آذر","دی","بهمن","اسفند"]
		
		static let DefaultInputFormat	= "yyyy-MM-dd HH:mm:ss"
		static let DefaultOutputFormat	= OutputFormat.longDate
		
		var input: String					= ""
		var inputFormat: String				= PersianDate.DefaultInputFormat
		var outputFormat: OutputFormat		= PersianDate.DefaultOutputFormat
		
		var dateObject: Date				= Date()
		var dateComponents: DateComponents	= DateComponents()
		
		public var year							: Int		{ return dateComponents.year! }
		public var year_yyyy_withPersianDigits	: String	{ return year.PS_stringWithPersianDigits }
		
		public var month						: Int		{ return dateComponents.month! }
		public var monthName					: String	{ return PersianDate.MonthSymbols[dateComponents.month!] }
		public var month_m_withPersianDigits	: String	{ return month.PS_stringWithPersianDigits }
		public var month_mm_withPersianDigits	: String	{ return month < 10 ? "۰\(month.PS_stringWithPersianDigits)" : month.PS_stringWithPersianDigits }
		
		public var day							: Int		{ return dateComponents.day! }
		public var day_d_withPersianDigits		: String	{ return day.PS_stringWithPersianDigits }
		public var day_dd_withPersianDigits		: String	{ return day < 10 ? "۰\(day.PS_stringWithPersianDigits)" : day.PS_stringWithPersianDigits }
		
		public var weekday						: Int		{ return dateComponents.weekday! }
		public var weekdayName					: String	{ return PersianDate.WeekdaySymbols[dateComponents.weekday! - 1] }
		
		public var hour							: Int		{ return dateComponents.hour! }
		public var hour_withPersianDigits		: String	{ return hour < 10 ? "۰\(hour.PS_stringWithPersianDigits)" : hour.PS_stringWithPersianDigits }
		
		public var minute						: Int		{ return dateComponents.minute! }
		public var minute_withPersianDigits		: String	{ return minute < 10 ? "۰\(minute.PS_stringWithPersianDigits)" : minute.PS_stringWithPersianDigits }
		
		public var second						: Int		{ return dateComponents.second! }
		public var second_withPersianDigits		: String	{ return second < 10 ? "۰\(second.PS_stringWithPersianDigits)" : second.PS_stringWithPersianDigits }
		
		public var output: String {
			let translatedFormat = outputFormat.rawValue
				.replacingOccurrences(of: "*Saat*", with: PersianDate.PersianHour)
				.replacingOccurrences(of: "*Maah*", with: PersianDate.PersianMonth)
			
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = translatedFormat
			dateFormatter.amSymbol = PersianDate.AMSymbol
			dateFormatter.pmSymbol = PersianDate.PMSymbol
			dateFormatter.weekdaySymbols = PersianDate.WeekdaySymbols
			dateFormatter.monthSymbols = PersianDate.MonthSymbols
			dateFormatter.calendar = Calendar(identifier: .persian)
			
			return dateFormatter.string(from: dateObject).PS_withPersianDigits
		}
		
		public init?(from string: String, inputFormat iF: String, outputFormat oF: OutputFormat) {
			input = string
			inputFormat = iF
			outputFormat = oF
			
			guard let c = createDateComponents() else { return nil }
			
			dateComponents = c
		}
		
		public convenience init?(from i: String) {
			self.init(from: i, inputFormat: PersianDate.DefaultInputFormat, outputFormat: PersianDate.DefaultOutputFormat)
		}
		
		public convenience init?(from i: String, inputFormat iF: String) {
			self.init(from: i, inputFormat: iF, outputFormat: PersianDate.DefaultOutputFormat)
		}
		
		
		
		public init(from date: Date, outputFormat oF: OutputFormat = PersianDate.DefaultOutputFormat) {
			dateObject = date
			outputFormat = oF
			dateComponents = createDateComponents(from: date)
		}
		
		
		private func createDateComponents() -> DateComponents? {
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = inputFormat
			
			guard let date = dateFormatter.date(from: input) else { return nil }
			
			dateObject = date
			return createDateComponents(from: date)
		}
		
		private func createDateComponents(from date: Date) -> DateComponents {
			return Calendar(identifier: Calendar.Identifier.persian)
				.dateComponents([.year, .month, .day, .hour, .minute, .second, .weekday], from: date)
		}
		
		
		public enum OutputFormat: String {
			case ultraLongDateAndTime	= "eeee d MMMM *Maah* yyyy *Saat* hh:mm:ss a"
			case longDateTime			= "eeee d MMMM yyyy *Saat* hh:mm:ss a"
			case longDate				= "eeee d MMMM yyyy"
			case mediumDate				= "d MMMM yyyy"
			case shortDate				= "yyyy/MM/d"
			case ultraShortDate			= "yy/MM/dd"
			
			case longTime				= "*Saat* hh:mm:ss a"
			case mediumTime				= "hh:mm:ss"
			case shortTime				= "hh:mm"
		}
		
		
	}
	
}

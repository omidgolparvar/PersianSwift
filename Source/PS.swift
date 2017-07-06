//
//  PS.swift
//  PersianSwift
//
//  Created by Omid Golparvar on 7/6/17.
//
//

import Foundation

public class PersianSwift {
	
	public class PersianDate {
		
		static let DefaultInputFormat	= "yyyy-MM-dd HH:mm:ss"
		static let DefaultSeperator		= Separator.slash
		static let DefaultOutputType	= OutputFormat.yyyy_mm_dd
		
		static let WeekdayNames			= ["شنبه","یکشنبه","دو‌شنبه","سه‌شنبه","چهارشنبه","پنج‌شنبه","جمعه"]
		static let MonthNames			= ["فروردین","اردیبهشت","خرداد","تیر","مرداد","شهریور","مهر","آبان","آذر","دی","بهمن","اسفند"]
		
		
		var input: String				= ""
		var separator: Separator		= PersianDate.DefaultSeperator
		var inputFormat: String			= PersianDate.DefaultInputFormat
		var outputFormat: OutputFormat	= PersianDate.DefaultOutputType
		
		var components: DateComponents = DateComponents()
		
		public var year							: Int		{ return components.year! }
		public var year_yyyy_withPersianDigits	: String	{ return year.stringWithPersianDigits }
		
		public var month						: Int		{ return components.month! }
		public var monthName					: String	{ return PersianDate.MonthNames[components.month!] }
		public var month_m_withPersianDigits	: String	{ return month.stringWithPersianDigits }
		public var month_mm_withPersianDigits	: String	{ return month < 10 ? "۰\(month.stringWithPersianDigits)" : month.stringWithPersianDigits }
		
		public var day							: Int		{ return components.day! }
		public var day_d_withPersianDigits		: String	{ return day.stringWithPersianDigits }
		public var day_dd_withPersianDigits		: String	{ return day < 10 ? "۰\(day.stringWithPersianDigits)" : day.stringWithPersianDigits }
		
		public var weekday						: Int		{ return components.weekday! }
		public var weekdayName					: String	{ return PersianDate.WeekdayNames[components.weekday!] }
		
		public var hour							: Int		{ return components.hour! }
		public var hour_withPersianDigits		: String	{ return hour < 10 ? "۰\(hour.stringWithPersianDigits)" : hour.stringWithPersianDigits }
		
		public var minute						: Int		{ return components.minute! }
		public var minute_withPersianDigits		: String	{ return minute < 10 ? "۰\(minute.stringWithPersianDigits)" : minute.stringWithPersianDigits }
		
		public var second						: Int		{ return components.second! }
		public var second_withPersianDigits		: String	{ return second < 10 ? "۰\(second.stringWithPersianDigits)" : second.stringWithPersianDigits }
		
		public var output: String {
			switch outputFormat {
			case .yyyy_mm_dd:
				return
					[year_yyyy_withPersianDigits, month_mm_withPersianDigits, day_dd_withPersianDigits].joined(separator: separator.rawValue)
				
			case .yyyy_mm_dd_day:
				return
					[year_yyyy_withPersianDigits, month_mm_withPersianDigits, day_dd_withPersianDigits].joined(separator: separator.rawValue)
					+ " "
					+ weekdayName
				
			case .yyyy_month_d:
				return
					[year_yyyy_withPersianDigits, monthName, day_d_withPersianDigits].joined(separator: " ")
				
			case .yyyy_month_dd:
				return
					[year_yyyy_withPersianDigits, monthName, day_dd_withPersianDigits].joined(separator: " ")
			case .yyyy_month_dd_day:
				return
					[year_yyyy_withPersianDigits, monthName, day_dd_withPersianDigits, weekdayName].joined(separator: " ")
			case .yyyy_mm_dd_hh_mm_ss:
				return
					[year_yyyy_withPersianDigits, month_mm_withPersianDigits, day_dd_withPersianDigits].joined(separator: separator.rawValue)
					+ " "
					+ [hour_withPersianDigits, minute_withPersianDigits, second_withPersianDigits].joined(separator: ":")
			}
		}
		
		public init?(input i: String, inputFormat iF: String, outputFormat oF: OutputFormat, separator s: Separator) {
			input = i
			inputFormat = iF
			outputFormat = oF
			separator = s
			
			guard let c = createDateComponents() else { return nil }
			
			components = c
		}
		
		public convenience init?(input i: String) {
			self.init(input: i, inputFormat: PersianDate.DefaultInputFormat, outputFormat: PersianDate.DefaultOutputType, separator: PersianDate.DefaultSeperator)
		}
		
		public convenience init?(input i: String, inputFormat iF: String) {
			self.init(input: i, inputFormat: iF, outputFormat: PersianDate.DefaultOutputType, separator: PersianDate.DefaultSeperator)
		}
		
		public convenience init?(input i: String, inputFormat iF: String, outputFormat oF: OutputFormat) {
			self.init(input: i, inputFormat: iF, outputFormat: oF, separator: PersianDate.DefaultSeperator)
		}
		
		
		public init(from date: Date, outputFormat oF: OutputFormat = PersianDate.DefaultOutputType) {
			outputFormat = oF
			components = createDateComponents(from: date)
		}
		
		
		private func createDateComponents() -> DateComponents? {
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = inputFormat
			
			if let dateObject = dateFormatter.date(from: input) {
				return createDateComponents(from: dateObject)
			}
			
			return nil
		}
		
		private func createDateComponents(from date: Date) -> DateComponents {
			return Calendar(identifier: Calendar.Identifier.persian)
				.dateComponents([.year, .month, .day, .hour, .minute, .second, .weekday], from: date)
		}
		
		
		public enum Separator: String {
			case slash	= "/"
			case dot	= "."
			case dash	= "-"
			case space	= " "
		}
		
		public enum OutputFormat {
			case yyyy_mm_dd
			case yyyy_month_dd
			case yyyy_month_d
			case yyyy_mm_dd_day
			case yyyy_month_dd_day
			case yyyy_mm_dd_hh_mm_ss
		}
		
		
	}
	
}

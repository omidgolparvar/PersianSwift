//: Playground - noun: a place where people can play

import UIKit
import PersianSwift


let s = "1989-12-09"

let dd = DateFormatter()
dd.dateFormat = "yyyy-MM-dd"
let dddd = dd.date(from: s)?.timeIntervalSince1970

let date = Date(timeIntervalSince1970: TimeInterval(exactly: 629152200)!)
_ = date.ps.asPersianDate // -> شنبه ۲۶ بهمن ۱۳۸۷
_ = date.ps.asFullPersianDateTime // -> شنبه ۲۶ بهمن ماه ۱۳۸۷ ساعت ۰۳:۰۱:۳۰ قبل از ظهر

let arabicNumber = "٠١٢٣٤٥٦٧٨٩"
_ = arabicNumber.ps.withPersianDigits







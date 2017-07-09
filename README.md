
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/PersianSwift.svg)](https://img.shields.io/cocoapods/v/PersianSwift.svg)
[![Platform](https://img.shields.io/cocoapods/p/PersianSwift.svg?style=flat)](http://cocoadocs.org/docsets/PersianSwift)


# PersianSwift

<div dir="rtl">
کتابخانه `PersianSwift` یک کتابخانه نوشته شده برای زبان برنامه‌نویسی `Swift` هستش که استفاده از این زبان برنامه‌نویسی رو برای زبان فارسی راحت‌تر و شیرین‌تر می‌کنه.
</div>

<div dir="rtl">
برای راحتی بیشتر موقع استفاده، بیشتر امکانات این کتابخونه از طریق `Extension`های تعریف شده برای انواع داده در `Swift` در دسترس هست.
</div>

<div dir="rtl">
مثلا با استفاده از ابزار زیر، مقدار عددی `12345` به مقدار متنی متناظر باهاش و همراه با اعداد فارسی در دسترس هست:
</div>

```swift
let int = 12345
let persianString = int.PS_stringWithPersianDigits // ۱۲۳۴۵
```

## نحوه نصب

با استفاده از [`CocoaPod`](http://cocoapods.org) خیلی راحت می‌تونین این کتابخونه رو به پروژه خودتون اضافه‌اش کنین.

```bash
pod 'PersianSwift'
```

بعد از نصب می‌تونین هرجایی که خواستین اون رو `import` کنین و از امکاناتش استفاده کنین.

```swift
import PersianSwift
```

در ادامه توضیحات مفصل قسمت‌های پیاده‌سازی شده رو نشون میدیم.

---

## استفاده از دستورات آماده شده


- [موارد مربوط به متن‌ها](#متون-یا-همون-String)
- [موارد مربوط به اعداد](#اعداد-مثل-Int-Double-Float)



### متون یا همون `String`

- چک کردن اینکه متن مورد نظر شماره تلفن موبایل باشه

```swift
String.PS_isPersianPhoneNumber -> Bool
```

- تبدیل شده متن موجود، بهمراه تبدیل اعداد از به فارسی و یا لاتین

```swift
String.PS_withPersianDigits -> String
String.PS_withEasternDigits -> String

String.PS_toPersianDigits() -> Void
String.PS_toEnglishDigits() -> Void
```

- تبدیل کاراکترهای خاص در متن فارسی (حروف ک عربی و ی عربی)

```swift
String.PS_withFixedPersianCharacters -> String
String.PS_fixPersianCharacters() -> Void
```

- تبدیل شده متن موجود، بهمراه ظاهر قیمت

اگه متن ما ساختار عددی مثل `"12345"` نداشته باشه، خروجی `nil` میشه.

```swift
String.PS_withIranRialStyle -> String?
String.PS_withIranTomanStyle -> String?
String.PS_withCurrencyStyle -> String?
```


- تبدیل متن با ساختار تاریخ، به تاریخ شمسی متناظر با اون

اگه متن ما ساختار تاریخ مثل `"2017-06-03 17:23:41"` رو نداشته باشه، خروجی `nil` میشه. البته فرمت ورودی رو میتونین موقع استفاده از این متد تنظیم کنین.

```swift
String.PS_asPersianDate(fromGregorianFormat: String) -> String?
```

---

### اعداد مثل `Int Double Float`

برای این نوع داده‌ها، اول یه `protocol` به اسم `Numeric` تعریف شده و بعد نوع‌های `Int, Double, Float` این پروتکل رو استفاده کردن.

```swift
public protocol Numeric {}

extension Int    : Numeric {}
extension Double : Numeric {}
extension Float  : Numeric {}
```

بعد به اون پروتکل تعریف شده، موارد زیر اضافه شدن.

- دریافت عدد بصورت متن

```swift
Numeric.PS_string -> String
```

- دریافت عدد بصورت متن بهمراه اعداد فارسی

```swift
Numeric.PS_stringWithPersianDigits -> String
```

- دریافت عدد بصورت متن و با ظاهر قیمت

```swift
Numeric.PS_stringWithCurrencyStyle -> String
```

---

### موارد مربوط به تاریخ یا همون `Date`

با استفاده از موارد آماده شده، میتونین خیلی راحت یه تاریخ رو به شمسی تبدیل کنین. به عنوان مثال با استفاده از `timeinterval` دریافتی از وب‌سرویس، یه تاریخ بسازین. و بعد خیلی راحت اون رو به تاریخ شمسی تبدیل کنین.

نام موارد آماده شده و نمونه خروجی‌شون توی مثال زیر آورده شده:

```swift
let date = Date(timeIntervalSince1970: TimeInterval(exactly: 629152200)!)
_ = date.PS_asPersianDate // شنبه ۱۸ آذر ۱۳۶۸
_ = date.PS_asFullPersianDateTime // شنبه ۱۸ آذر ماه ۱۳۶۸ ساعت ۱۲:۰۰:۰۰ قبل از ظهر
```

---

### <div dir="rtl">آرایه‌ها</div>

#### <div dir="rtl">آرایه‌های متنی یا همون `[String]`</div>

<div dir="rtl">
  <ul><li>به ترتیب کردن آرایه‌ای از String و دریافت خروجی</li></ul>
</div>

  <div dir="rtl">
  این دستور روی آرایه‌ای از `String` اعمال میشه و اون رو بطور صعودی به ترتیب میکنه و بعنوان خروجی برمیگردونه.
  </div>

  ```swift
  [String].PS_sortedPersianStrings
  ```
<div dir="rtl">
  <ul><li>به ترتیب کردن درجای آرایه‌ای از String</li></ul>
</div>

  <div dir="rtl">
  این دستور هم روی آرایه‌ای از `String` اعمال میشه و خود اون آرایه رو درجا به ترتیب میکنه. موقع استفاده از این دستور میتونین صعودی یا نزولی بودن ترتیب رو انتخاب کنین.
  </div>

  ```swift
  [String].PS_sortPersianStrings(desc: Bool)
  ```







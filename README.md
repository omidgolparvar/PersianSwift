
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

## <div dir="rtl">نحوه نصب</div>

<div dir="rtl">
با استفاده از [`CocoaPod`](http://cocoapods.org) خیلی راحت می‌تونین این کتابخونه رو به پروژه خودتون اضافه‌اش کنین.
</div>

```bash
pod 'PersianSwift'
```

<div dir="rtl">
بعد از نصب می‌تونین هرجایی که خواستین اون رو `import` کنین و از امکاناتش استفاده کنین.
</div>

```swift
import PersianSwift
```

<div dir="rtl">
در ادامه توضیحات مفصل قسمت‌های پیاده‌سازی شده رو نشون میدیم.
</div>

---

## <div dir="rtl">استفاده از دستورات آماده شده</div>


### <div dir="rtl">متون یا همون `String`</div>

<div dir="rtl">
  <ul><li>چک کردن اینکه متن مورد نظر شماره تلفن موبایل باشه</li></ul>
</div>

```swift
String.PS_isPersianPhoneNumber -> Bool
```

<div dir="rtl">
  <ul><li>تبدیل شده متن موجود، بهمراه تبدیل اعداد از به فارسی و یا لاتین</li></ul>
</div>

```swift
String.PS_withPersianDigits -> String
String.PS_withEasternDigits -> String

String.PS_toPersianDigits() -> Void
String.PS_toEnglishDigits() -> Void
```

<div dir="rtl">
  <ul><li>تبدیل کاراکترهای خاص در متن فارسی (حروف ک عربی و ی عربی)</li></ul>
</div>

```swift
String.PS_withFixedPersianCharacters -> String
String.PS_fixPersianCharacters() -> Void
```

<div dir="rtl">
  <ul><li>
    تبدیل شده متن موجود، بهمراه ظاهر قیمت
    <p>اگه متن ما ساختار عددی مثل `"12345"` نداشته باشه، خروجی `nil` میشه.</p>
  </li></ul>
</div>


```swift
String.PS_withIranRialStyle -> String?
String.PS_withIranTomanStyle -> String?
String.PS_withCurrencyStyle -> String?
```

<div dir="rtl">
  <ul><li>
    تبدیل متن با ساختار تاریخ، به تاریخ شمسی متناظر با اون
    <p>
    اگه متن ما ساختار تاریخ مثل `"2017-06-03 17:23:41"` رو نداشته باشه، خروجی `nil` میشه. البته فرمت ورودی رو میتونین موقع استفاده از این متد تنظیم کنین.
    </p>
  </li></ul>
</div>


```swift
String.PS_asPersianDate(fromGregorianFormat: String) -> String?
```

---

### اعداد مثل `Int Double Float`

<div dir="rtl">
برای این نوع داده‌ها، اول یه `protocol` به اسم `Numeric` تعریف شده و بعد نوع‌های `Int, Double, Float` این پروتکل رو استفاده کردن.
</div>

```swift
public protocol Numeric {}

extension Int    : Numeric {}
extension Double : Numeric {}
extension Float  : Numeric {}
```

<div dir="rtl">
بعد به اون پروتکل تعریف شده، موارد زیر اضافه شدن.
</div>

<div dir="rtl">
  <ul><li>دریافت عدد بصورت متن</li></ul>
</div>


```swift
Numeric.PS_string -> String
```


<div dir="rtl">
  <ul><li>دریافت عدد بصورت متن بهمراه اعداد فارسی</li></ul>
</div>

```swift
Numeric.PS_stringWithPersianDigits -> String
```

<div dir="rtl">
  <ul><li>دریافت عدد بصورت متن و با ظاهر قیمت</li></ul>
</div>

```swift
Numeric.PS_stringWithCurrencyStyle -> String
```

---

### <div dir="rtl">موارد مربوط به تاریخ یا همون `Date`</div>

<div dir="rtl">
با استفاده از موارد آماده شده، میتونین خیلی راحت یه تاریخ رو به شمسی تبدیل کنین. به عنوان مثال با استفاده از `timeinterval` دریافتی از وب‌سرویس، یه تاریخ بسازین. و بعد خیلی راحت اون رو به تاریخ شمسی تبدیل کنین.
</div>

<div dir="rtl">
نام موارد آماده شده و نمونه خروجی‌شون توی مثال زیر آورده شده:
</div>

```swift
let date = Date(timeIntervalSince1970: TimeInterval(exactly: 629152200)!)
_ = date.PS_asPersianDate // شنبه ۱۸ آذر ۱۳۶۸
_ = date.PS_asFullPersianDateTime // شنبه ۱۸ آذر ماه ۱۳۶۸ ساعت ۱۲:۰۰:۰۰ قبل از ظهر
```

---

### <div dir="rtl">آرایه‌ها</div>

#### <div dir="rtl">آرایه‌های متنی یا همون `[String]`</div>

<div dir="rtl">
  <ul>
    <li>
      به ترتیب کردن آرایه‌ای از String و دریافت خروجی
      <p>
      این دستور روی آرایه‌ای از `String` اعمال میشه و اون رو بطور صعودی به ترتیب میکنه و بعنوان خروجی برمیگردونه.
      </p>
    </li>
  </ul>
</div>


```swift
[String].PS_sortedPersianStrings
```
<div dir="rtl">
  <ul>
    <li>
      به ترتیب کردن درجای آرایه‌ای از String
      <p>
      این دستور هم روی آرایه‌ای از `String` اعمال میشه و خود اون آرایه رو درجا به ترتیب میکنه. موقع استفاده از این دستور میتونین صعودی یا نزولی بودن ترتیب رو انتخاب کنین.
      </p>
    </li>
  </ul>
</div>


```swift
[String].PS_sortPersianStrings(desc: Bool)
```







import Foundation

let itemPrices: [Decimal] = [ 10, 200.99, 35.5, 89.40, 90.99, 6.95, 88.15, 25.09 ]

let totalAmount = itemPrices.reduce(0) { $0 + $1 }

// Assignment 1:  Function
// discountedAmount is expected as 0.05 for 5% etc
func applyDiscount(totalAmount: Decimal, discountPercentage: Decimal) -> Decimal {
  let discountedAmount = totalAmount * discountPercentage
  return totalAmount - discountedAmount
}

// Assignment 2: Function
let defaultDiscountPercentage: Decimal = 0.05
func applyDiscount(totalAmount: Decimal, defaultDiscountPercentage: Decimal = defaultDiscountPercentage) -> Decimal {
  let discountedAmount = totalAmount * defaultDiscountPercentage
  return totalAmount - discountedAmount
}

// Assignment 3: typealias
print("Assignment 3 ----------------------------")
let discounts: [String: Decimal] = [
  "Default": 0.05,
  "Boxing Day": 0.1,
  "Cyber Monday": 0.2,
  "Black Friday": 0.25,
  "Shop Birthday": 0.3
]

typealias DiscountCalculator = (Decimal, String) -> Decimal

func printDiscount(totalAmount: Decimal, discountCalculator: DiscountCalculator) {
  for discountType in discounts.keys {
    print("\(discountType): \(discountCalculator(totalAmount, discountType))")
  }
}

printDiscount(totalAmount: totalAmount) { (totalAmount, discountType) in
  let discountPercentage = discounts[discountType] ?? defaultDiscountPercentage
  return applyDiscount(totalAmount: totalAmount, discountPercentage: discountPercentage)
}

// Assignment 4: Closure
print("\nAssignment 4 ----------------------------")
let calculateDiscount = { (totalAmount: Decimal, discountType: String) -> Decimal in
  let discountPercentage = discounts[discountType] ?? defaultDiscountPercentage
  let discountedAmount = totalAmount * discountPercentage
  return totalAmount - discountedAmount
}
print(calculateDiscount(totalAmount, "Shop Birthday"))

// Assignment 5: Map
print("\nAssignment 5 ----------------------------")
itemPrices.map { $0 + $0 * 0.5 }.enumerated().forEach { (index, item) in
  let formatter = NumberFormatter()
  formatter.numberStyle = .currency
  print("New price for item №\(index) is \(formatter.string(for: item) ?? "n/a")")
}

// Assignment 6: Sorted
print("\nAssignment 6 ----------------------------")
discounts.sorted() { $0.value > $1.value }.forEach() { print("\($0.key): \($0.value * 100)%") }

// Assignment 7: Enums and Switch Cases
print("\nAssignment 7 ----------------------------")
enum DiscountTypes {
  case defaultDiscount(Decimal)
  case boxingDay(Decimal)
  case cyberMonday(Decimal)
  case blackFriday(Decimal)
  case shopBirthday(Decimal)
}

let enumDiscounts: [DiscountTypes] = [.defaultDiscount(0.05), .boxingDay(0.1), .cyberMonday(0.2), .blackFriday(0.25), .shopBirthday(0.3)]
func printEnumDiscounts(_ discount: DiscountTypes) {
  switch discount {
  case .defaultDiscount(let value):
    print("Default discount \(value * 100)%")
  case .boxingDay(let value):
    print("Boxing day discount \(value * 100)%")
  case .cyberMonday(let value):
    print("Cyber monday discount \(value * 100)%")
  case .blackFriday(let value):
    print("Black friday discount \(value * 100)%")
  case .shopBirthday(let value):
    print("Shop birthday discount \(value * 100)%")
  }
}
enumDiscounts.forEach { printEnumDiscounts($0) }

// Assignment 8: Computed Property
print("\nAssignment 8 ----------------------------")
class Cart {
  var items: [Decimal]
  var currentDiscount: DiscountTypes

  init(prices: [Decimal], discount: DiscountTypes) {
    items = prices
    currentDiscount = discount
  }

  var currentDiscountedAmount: Decimal {
    get {
      let totalAmount = items.reduce(0) { $0 + $1 }
      var discount: Decimal = 0
      switch currentDiscount {
      case .defaultDiscount(let value):
        discount = value
      case .boxingDay(let value):
        discount = value
      case .cyberMonday(let value):
        discount = value
      case .blackFriday(let value):
        discount = value
      case .shopBirthday(let value):
        discount = value
      }

      return totalAmount - totalAmount * discount
    }
  }
}

let cart = Cart(prices: itemPrices, discount: .cyberMonday(0.2))
print(cart.currentDiscountedAmount)

// Assignment 9: Lazy Property
print("\nAssignment 9 ----------------------------")
struct Cart2 {
  lazy var maximumPossibleDiscount: Decimal = {
    return enumDiscounts.reduce(Decimal(0)) { maxDiscount, discount in
      var discountValue: Decimal = 0
      switch discount {
      case .defaultDiscount(let value):
        discountValue = value
      case .boxingDay(let value):
        discountValue = value
      case .cyberMonday(let value):
        discountValue = value
      case .blackFriday(let value):
        discountValue = value
      case .shopBirthday(let value):
        discountValue = value
      }
      return max(maxDiscount, discountValue)
    }
  }()
}

var cart2 = Cart2()
print("Maximum discount: \(cart2.maximumPossibleDiscount * 100)%")

// Assignment 10: Method
print("\nAssignment 10 ----------------------------")
extension Cart {
  func calculateTotalAmountAfterApplyingDiscount() -> Decimal {
    let totalAmount = items.reduce(0) { $0 + $1 }
    var discount: Decimal = 0
    switch currentDiscount {
    case .defaultDiscount(let value):
      discount = value
    case .boxingDay(let value):
      discount = value
    case .cyberMonday(let value):
      discount = value
    case .blackFriday(let value):
      discount = value
    case .shopBirthday(let value):
      discount = value
    }

    return totalAmount - totalAmount * discount
  }
}

var cart1 = Cart(prices: itemPrices, discount: .blackFriday(0.1))
print(cart1.calculateTotalAmountAfterApplyingDiscount())

// Assignment 11: Protocol
print("\nAssignment 11 ----------------------------")
protocol Discountable {
  var discountType: String { get set }
  var discountPercentage: Decimal { get set }
}

extension Discountable {
  func calculateDiscountedAmount(totalAmount: Decimal) -> Decimal {
    totalAmount * discountPercentage
  }
}

struct Cart3: Discountable {
  var totalAmount: Decimal
  var discountType: String
  var discountPercentage: Decimal

  var currentDiscountedAmount: Decimal {
    get {
      return totalAmount - calculateDiscountedAmount(totalAmount: totalAmount)
    }
  }
}

var cart3 = Cart3(totalAmount: 200.0, discountType: "Christmas sale", discountPercentage: 0.1)
print(cart3.currentDiscountedAmount)

// Assignment 12: Extension
print("\nAssignment 12 ----------------------------")
struct Cart4 {
  var totalDiscountedAmount: Decimal
}

extension Cart4 {
  func roundTotalDiscountedAmount() -> Decimal {
    var total = totalDiscountedAmount
    var result: Decimal = 0
    NSDecimalRound(&result, &total, 0, .bankers)
    return result
  }
}

var cart4 = Cart4(totalDiscountedAmount: 35.4)
print(cart4.roundTotalDiscountedAmount())

// Assignment 14.1: Progression of the usage of a closure
let calculateDiscount1 = { (totalAmount: Decimal, discountType: String) -> Decimal in
  let discountPercentage = discounts[discountType] ?? defaultDiscountPercentage
  let discountedAmount = totalAmount * discountPercentage
  return totalAmount - discountedAmount
}

typealias CalculateDiscount = (Decimal, String) -> Decimal
let calculateDiscount2: CalculateDiscount = { (totalAmount, discountType) in
  let discountPercentage = discounts[discountType] ?? defaultDiscountPercentage
  let discountedAmount = totalAmount * discountPercentage
  return totalAmount - discountedAmount
}

let calculateDiscount3: CalculateDiscount = { (totalAmount, discountType) in
  return totalAmount - totalAmount * (discounts[discountType] ?? defaultDiscountPercentage)
}

let calculateDiscount4: CalculateDiscount = { (totalAmount, discountType) in
  totalAmount - totalAmount * (discounts[discountType] ?? defaultDiscountPercentage)
}

let calculateDiscount5: CalculateDiscount = {
  $0 - $0 * (discounts[$1] ?? defaultDiscountPercentage)
}

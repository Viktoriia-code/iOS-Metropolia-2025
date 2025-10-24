import Foundation

// The Basics / Constants and Variables
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/
 
// var and let for mutable and immutable variables
var a1: String = "abc"
let a2: String = "def"
a1 = "Hello"
// a2 = "Goodbye"           // this is illegal

// inferred typing - if type of a variable can be inferred, type name is not mandatory
let a3 = 6.66
var a4 = "abc"

type(of: a3)
type(of: a4)

// an optional may hold either value of the indicated type, or nil. See The Basics / Optionals (https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Optionals)
var a5: String?

a1 = "Hello"
// a1 = nil                  // this is illegal
a5 = "world"

// a4 = a1 + " " + a5    // this is illegal

// Unwrapping conditionals, see
// The Basics / If Statements and Forced Unwrapping
// The Basics / Optional Binding (https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Optional-Binding)

a5 = nil
if a5 != nil {
    print(a5!)              // forced unwrapping, use only if a2 is 100% known to be non-nil
} else {
    print("Zap")
}
a5 = "Jill"
if a5 != nil {
    print(a5!)
} else {
    print("Zap")
}

// Optional binding
a5 = nil
if let avalue = a5 {
    print("\(avalue)")
    // more code
} else {
    print("whatever")
    // more code
}
a5 = "Jill"
if let avalue = a5 {
    print("\(avalue)")
    // more code
} else {
    print("whatever")
    // more code
}

// guard: if binding fails, else branch is executed (must return from function or exit)
a5 = "Jill"
guard let avalue = a5 else {
    // some code
    fatalError("Bad error.")
}
print("\(avalue)")

// nil coalescing operator, or default operator ??:
a5 = nil
let a6 = a1 + " " + (a5 ?? "nothingness")
a5 = "Jill"
let a7 = a1 + " " + (a5 ?? "nothingness")

// ... which is the same as
let a8 = a1 + " " + (a5 == nil ? "nothingness" : a5!)

// Optional chaining
var str1: String? = "huuhaa"
if let len = str1?.count { // access .count only if str1 is non-nil
    print(len)
} else {
    print("no len")
}
let str2 = str1?.uppercased() ?? "NOTHING" // ? - call uppercased() only if str non-nil, otherwise return nil; if nil returned then default operator ?? returns "NOTHING"
print(str2)

// Type conversions: The Basics / Numeric Type Conversion
let sum = 13
let count = 3
let ave = sum / count
type(of: ave)
// let ave1: Double = sum / count   // this is illegal
// let ave2 = Double(sum) / count   // this is illegal
let ave3 = Double(sum / count)      // legal, but does it make sense?
let ave4 = Double(sum) / Double(count)

let message = "My average is " + String(ave4)

// String interpolation
print("The average is \(ave4), great.")

// The Basics / Tuples

let item = ("Candy bar", 2.50, 4)
print("Total \(item.1 * Double(item.2)) for \(item.0)")
let (name, price, quantity) = item
print(name, quantity)

var mygrade = 1
var yourgrade = 5

(mygrade, yourgrade) = (yourgrade, mygrade)

print(mygrade, yourgrade)

// Collections: array, set, dictionary
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes

var array1 = ["John", "Jill", "Jack", "Robert"]
array1[2]
array1[2] = "Elias"
array1.remove(at: 3)
array1.append("Mary")

let array2 = array1 + array1
// array2[2] = "Susan"      // illegal, array2 is immutable
// array2.remove(at: 0)     // illegal, array2 is immutable
// array2.append("Mark")    // illegal, array2 is immutable



let set1: Set<String> = Set(array2)
let set2 = Set(["John", "Jack"])
set1.union(set2)
set1.intersection(set2)
set1.symmetricDifference(set2)

var reg = [String: Int]()
reg["Jack"] = 3
reg["John"] = 7
reg["Jill"] = 11
reg

reg["Jack"] = 7

set2.intersection(reg.keys)

reg.values
let valSet = Set<Int>(reg.values)
valSet.count
let valArray = Array<Int>(reg.values)
valArray.count

// Loops, see https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow
let n = 9

for i in 0...n {
    print("\(i), \(i*i)")
}

var r = 1
for i in 1...n {
    r *= i
}
print(r)

var q = 2
var t = 1
for _ in 1...n {
    t *= q
}
print(t)

r = 0
var i = 10
while(i > 0) {
    r += i
    i -= 1
}
print(r)


let myarray = [5,3,6,7,2,6,3]
for e in myarray {
    print(e, e*e)
}

for (i, e) in myarray.enumerated() {
    print(i, e)
}

let myset: Set = [5,3,6,7,2,6,3]
for e in myset {
    print(e, e*e)
}

let mydict = ["zero":0, "one":1, "two":2, "three":3, "four":4,
              "five":5, "six":6, "seven":7, "eight":8, "nine":9]

for (name,value) in mydict {
    print(value, name)
}
for name in mydict.keys {
    print(mydict[name] ?? "666", name)
}

let anotherdict = Dictionary(uniqueKeysWithValues: mydict.map({ ($0.1, $0.0) }))
anotherdict

// Switch - case
for c in "Average 45" {
    switch c {
    case "A":
        print("A")
    case "a"..."z":
        print("Lower-case letter")
    case "0"..."9":
        print("Number")
    default:
        print("Something else")
    }
}

// Functions, see https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions

// first and second are external names for parameters, avector and bvector internal
func innerProduct1(first avector: Array<Int>, second bvector: Array<Int>) -> Int? {
    if avector.count == bvector.count {
        var sum = 0
        for i in avector.indices {
            sum += avector[i] * bvector[i]
        }
        return sum
    } else {
        return nil
    }
}
innerProduct1(first: [1,2,3], second: [2,3,1]) // argument names needed in call

// _ as external name: no argument names needed, default value can be specified
// lowerlimit is both external and internal name
func filterVector(_ avector: Array<Int>, lowerlimit: Int = 0) -> Array<Int> {
    var result: [Int] = []
    for i in avector.indices {
        result.append(max(lowerlimit, avector[i]))
    }
    return result
}

filterVector([-3,5,1,-1], lowerlimit: 3)
filterVector([-3,5,1,-1])

// Recursion
func number2string(_ n: Int, digitNames: Dictionary<Int, String>) -> String {
    let digit = digitNames[n % 10] ?? "?"
    if n / 10 == 0 {
        return digit
    } else {
        return number2string(n / 10, digitNames: digitNames) + "-" + digit
    }
}
number2string(5239, digitNames: anotherdict)

// function parameter
func vectormap(_ avector: Array<Int>, f: (Int) -> Int) -> Array<Int> {
    var result: [Int] = []
    for i in avector.indices {
        result.append(f(avector[i]))
    }
    return result
}

func sq(_ x: Int) -> Int {
    return x*x
}

var vm = vectormap([0,1,2,3,4], f: sq)

// closure (or in this case just lambda) - unnamed function given as argument
vm = vectormap([0,1,2,3,4], f: { (e) in
    return e*e
})
vm

// implicit return
vm = vectormap([0,1,2,3,4], f: { (e) in e*e })
vm

// shorthand argument names
vm = vectormap([0,1,2,3,4], f: { $0 * $0 })
vm

// trailing closure
vm = vectormap([0,1,2,3,4]) { $0 * $0 }
vm

// closure: vectorpow argument ex is "closed over", or memorized in function vmap
func vectorpow(ex: Int) -> (Array<Int>) -> Array<Int> {
    func vmap(_ avector: Array<Int>) -> Array<Int> {
        var result: [Int] = []
        for i in avector.indices {
            result.append(Int(pow(Double(avector[i]), Double(ex))))
        }
        return result
    }
    return vmap
}

for i in 0...3 {
    let vsq = vectorpow(ex: i)
    let vm = vsq([0,1,2,3,4])       // vsq has the value of i memorized in ex
    print(vm)
}

// map, filter, reduce, etc available
print(["Jack", "Jill", "Julia"].map{ $0.count })
print(["Jack", "Jill", "Julia"].filter{ $0.count > 4 })
print(["Jack", "Jill", "Julia"].reduce("", { $1 + $0 }))

// Class, see https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures
// three (stored) properties, one of them a constant, one method

class Student1 {
    let name: String
    var major: String
    public private(set) var credits: Int = 0
    
    init(name: String, major: String = "ICT") {
        self.name = name
        self.major = major
    }
    
    func doCourse(credits: Int) {
        if (1...15).contains(credits) {
            self.credits += credits
        }
    }
}

// s1, s2 and s3 are references to instances
var s1 = Student1(name: "John")
var s2 = Student1(name: "Jill")
var s3 = Student1(name: "John")

// referential equality
s1 === s2
// now s2 and s3 refer to the same instance, no references to Student1(name: "Jack") any more
s3 = s2
s2 === s3
s2.doCourse(credits: 5)
s2.credits
s3.credits

s3.major = "IoT" // surely ok, s3 is a var, and major is a var
let s4 = Student1(name: "Jack")
s4.major = "IoT" // also ok as s4 is of reference type

// Swift struct is quite like class except all structs are value types:
// In assignment or function call the value is copied.

struct Student2 {
    let name: String
    var major: String
    var credits: Int = 0
    
    // 'mutating' - self is mutable inside this function
    mutating func doCourse(credits: Int) {
        if (1...15).contains(credits) {
            self.credits += credits
        }
    }
}

// structs have an automatic memberwise initializer
var t1 = Student2(name: "John", major: "IoT")
var t2 = Student2(name: "Jill", major: "Meng")
var t3 = Student2(name: "John", major: "ICT")

// referential equality does not make sense
// t1 === t2
// now s
t3 = t2
t3.doCourse(credits: 5)
t2.credits
t3.credits

t3.major = "IoT" // surely ok, t3 is a var, and major is a var
let t4 = Student2(name: "Jack", major: "SWeng")
// t4.major = "IoT" // not ok as t4 is of value type and a let

// lazy stored property - value is computed only when it is accessed first time

func createImageFrom(file: String) -> Array<UInt8> {
    print("in createImageFromFile()")
    // some heavy operation
    return Array<UInt8>()
}

struct Student3 {
    let name: String
    let imageFile: String
    var major: String
    lazy var image: Array<UInt8> = createImageFrom(file: imageFile)
    
    // ... methods etc
}

var t5 = Student3(name: "Jill", imageFile: "jill.png", major: "IoT")
print(t5)
t5.major = "Media"
print(t5)
let img = t5.image
print(t5)

// computed property

struct Student4 {
    var credits: Int
    var years: Int
    var creditsPerYear: Double {
        get {
            return Double(credits) / Double(years)
        }
    }
}

var t6 = Student4(credits: 135, years: 2)
print(t6)
print(t6.creditsPerYear)

// type properties (class / static properties)

struct Student5 {
    static let TARGET_CREDITS = 240
    var credits: Int
    var years: Int
    var percentComplete: Double {
        100 * Double(credits) / Double(Student5.TARGET_CREDITS)
    }
}

var t7 = Student5(credits: 0, years: 0)
var t8 = Student5(credits: 210, years: 3)
print(t7.percentComplete, t8.percentComplete)

struct Student6 {
    static let TARGET_CREDITS = 240
    static func defaultYears() -> Double {
        Double(TARGET_CREDITS) / 60.0
    }
    var credits: Int
    var years: Int
    var percentComplete: Double {
        100 * Double(credits) / Double(Student5.TARGET_CREDITS)
    }
}
print(Student6.defaultYears())

// subscripts

struct Student7 {
    nonisolated(unsafe) static var allStudents: [Student7] = []
    static subscript(i: Int) -> Student7 {
        return allStudents[i]
    }
    var name: String
    var credits: [Int] = []
    
    init(name: String) {
        self.name = name
        Student7.allStudents.append(self)
    }
    subscript(i: Int) -> Int? {
        if (0...credits.count-1).contains(i) {
            return credits[i]
        } else {
            return nil
        }
    }
}

var t10 = Student7(name: "Jack")
var t11 = Student7(name: "Jill")
var t12 = Student7(name: "Julia")

print(Student7.allStudents)
print(Student7[1])

t11.credits.append(15)
t11.credits.append(5)
t11.credits.append(10)
print(t11[1] ?? "dont know")

// inheritance (for classes only, not structs and enums)
// also: failable initializer

class Person {
    let name: String
    private(set) var age: Int = 0
    
    init?(name: String) { // init is failable
        if name.count < 2 { return nil }
        self.name = name
    }
    
    func getOlder() {
        age += 1
    }
}

class Student8: Person {
    let major: String
    private(set) var credits = 0
    
    init?(name: String, major: String) { // superclass init failable -> init is failable
        self.major = major
        super.init(name: name)
    }
    
    override func getOlder() {
        for _ in 1...2 { super.getOlder() }
    }
}

var t13 = Student8(name: "Julia", major: "ict")
t13?.getOlder()
print(t13?.name ?? "?", t13?.age ?? "?", t13?.major ?? "?", t13?.credits ?? "?")

var t14 = Student8(name: "Jack", major: "iot")
for _ in 1...20 { t14?.getOlder() }
if let t14 = t14 {
    print(t14.name, t14.age, t14.major, t14.credits)
}

class Person1 {
    let name: String
    private(set) var age = 0
    init(_ name: String) { self.name = name }
}

let bunch = [Person1("John"), Person1("Jill"), Person1("Jack")]

// does not work: must be able to compare Person1s for equality
// let another: Set<Person1> = bunch

// in addition to equality, hash value is needed. conform to Hashable protocol (~ interface)
// see Hash Values for Set Types in https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes#Hash-Values-for-Set-Types
class Person2: Hashable {
    static func == (lhs: Person2, rhs: Person2) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    let name: String
    private(set) var age = 0
    init(_ name: String) { self.name = name }
}

let bunch1: Set<Person2> = [Person2("John"), Person2("Julia"), Person2("John")]
print(bunch1)

// extension - add to class (or struct, enum) definition
// description ~ toString()

extension Person2: CustomStringConvertible {
    var description: String {
        return "\(self.name) (\(self.age))"
    }
}

// basic enum has only the listed values, no default mapping to Int
enum Pet {
    case Cat, Dog, Snake, Rabbit
}

var myPet = Pet.Cat
myPet = .Dog

// this enum can be iterated over
enum Grade1: CaseIterable {
    case Fail, Pass, Fair, Good, VeryGood, Excellent
}

for g1 in Grade1.allCases {
    print(g1)
}

// here an enum has two options, either number with associated value of type Int
// or word with String
enum Grade2 {
    case number(Int)
    case word(String)
}

var g21 = Grade2.number(4)
var g22 = Grade2.word("VeryGood")

switch g21 {
case let .number(gradeNumber):
    print(gradeNumber)
case let .word(gradeName):
    print(gradeName)
}

// here enum has raw value
enum Grade3: Int {
    case Fail = 0, Pass, Fair, Good, VeryGood, Excellent
}

var grades = [Grade3.Excellent, .Fair, .Pass, .VeryGood, .Pass]
let average = Double(grades.reduce(0, { acc, e in acc + e.rawValue })) / Double(grades.count)
print("Average of \(grades.map { $0.rawValue }) is \(average)")

print(Grade3(rawValue: 4) ?? "what")
print(Grade3(rawValue: 8) ?? "what")

// enum might conform to a protocol and have methods
enum Grade4:Int, CustomStringConvertible {
    var description: String { return String(self.rawValue) }
    
    case Fail = 0, Pass, Fair, Good, VeryGood, Excellent
    
    func isPassed() -> Bool {
        switch self {
        case .Fail: return false
        default: return true
        }
    }
    
    func improve() -> Grade4 {
        switch self {
        case .Excellent: return Grade4.Excellent
        default: return Grade4(rawValue: self.rawValue+1) ?? Grade4.Fail
        }
    }
}

var grades4 = [Grade4.Excellent, .Fail, .Pass]
print(grades4.map( { $0.isPassed() }))
print(grades4.map( { $0.improve().rawValue }))

class School: CustomStringConvertible {
    var description: String {
        return "Metropolia"
    }
    
    init() {
        print("Now creating school")
    }
}

class Student {
    let name: String
    private var grades: [Grade4] {
        willSet {
            print("willSet grades")
        }
        didSet {
            print("grades was changed from \(oldValue) to \(grades)")
        }
    }
    var average: Double {
        return grades.reduce(0.0, { acc, e in acc + Double(e.rawValue) }) / Double(grades.count)
    }
    var coursesPassed: Int {
        return grades.filter({$0 != .Fail}).count
    }
    var coursesTotal: Int {
        get {
            return grades.count
        }
        set {
            if newValue <= grades.count {
                grades = Array(grades[0..<newValue])
            }
        }
    }
    private(set) lazy var school = School()
    
    init(_ name:String) {
        self.name = name
        self.grades = []
    }
    
    func addGrade(g: Grade4) {
        grades.append(g)
    }
}

let s = Student("Paula")
s.addGrade(g: .Pass)
s.addGrade(g: .Good)
s.addGrade(g: .VeryGood)
s.addGrade(g: .Excellent)
print(s.average)
s.coursesTotal = 2
print(s.average)
print(s.school.description)


extension Student {
    var topGrade: Int? {
        return grades.map({$0.rawValue}).max()
    }
}

print(s.topGrade ?? "none")

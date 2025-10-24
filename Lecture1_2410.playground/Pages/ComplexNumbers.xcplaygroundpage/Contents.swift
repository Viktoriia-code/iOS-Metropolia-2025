// with class
class Complex: CustomStringConvertible {
    var real: Double
    var imaginary: Double
    
    init(real: Double, imaginary: Double) {
        self.real = real
        self.imaginary = imaginary
    }
    
    func add(_ number: Complex) {
        self.real += number.real
        self.imaginary += number.imaginary
    }
    
    func multiply(_ number: Complex) {
        let newReal = self.real * number.real - self.imaginary * number.imaginary
        let newImag = self.real * number.imaginary + self.imaginary * number.real
        self.real = newReal
        self.imaginary = newImag
    }
    
    var description: String {
        return "\(real) + \(imaginary)i"
    }
}

let a = Complex(real: 1, imaginary: 2)

print(a)
a.add(Complex(real: 3, imaginary: 4))
print(a)
a.multiply(Complex(real: 2, imaginary: 3))
print(a)

let b = a
b.add(Complex(real: 1, imaginary: 1))
print(a)
print(b)

// with struct
struct Complex1: CustomStringConvertible {
    var real: Double
    var imaginary: Double
    
    init(real: Double, imaginary: Double) {
        self.real = real
        self.imaginary = imaginary
    }
    
    mutating func add(_ number: Complex1) {
        self.real += number.real
        self.imaginary += number.imaginary
    }
    
    mutating func multiply(_ number: Complex1) {
        let newReal = self.real * number.real - self.imaginary * number.imaginary
        let newImag = self.real * number.imaginary + self.imaginary * number.real
        self.real = newReal
        self.imaginary = newImag
    }
    
    var description: String {
        return "\(real) + \(imaginary)i"
    }
}

var c = Complex1(real: 1, imaginary: 2)
print(c)
c.add(Complex1(real: 3, imaginary: 4))
print(c)
var d = c
d.add(Complex1(real: 1, imaginary: 1))
print(c)
print(d)

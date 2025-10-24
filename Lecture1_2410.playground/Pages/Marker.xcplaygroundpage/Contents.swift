class Marker: CustomStringConvertible {
    var color: String
    var ink: Int
    var isCapped: Bool
    
    init(colour: String) {
        self.color = colour
        self.ink = 10
        self.isCapped = true
    }
    
    var description: String {
        return "\(color) marker with \(ink) drops of ink"
    }
    
    func draw() {
        if !isCapped && ink > 0 {
            ink -= 1
            print("Drawing... \(ink) drops left")
        } else if isCapped {
            print("Cannot draw: marker is capped")
        } else {
            print("Cannot draw: out of ink")
        }
    }
    
    func capOn() {
        isCapped = true
    }
    
    func capOff() {
        isCapped = false
    }
}

let m1 = Marker(color: "")
print(m1 ?? "Huh")


import Foundation

struct Poems {
    static let poems = [
        "Nico ist ein dicker Wicht, drum widme ich ihm das Gedicht",
        "Marvin, der diesen Bot hier schrieb, den haben alle Leute lieb",
        "Malte, unser Superstar, den lieben wir, das ist doch klar",
        "Anna haben alle lieb, sie ist gewiss kein Autodieb",
        "Eva, unser neuer Agile Master entschärft jedes Scrumdisaster",
        "Seebach, äy, der Grumpy Guy, braucht mal ein paar Wochen frei",
        "Ben, dessen Haar ist stets gewellt, hat den Kasten längst schon kalt gestellt"
    ]
    static func random() -> String {
        return poems[Int(arc4random_uniform(UInt32(poems.count - 1)))]
    }
}


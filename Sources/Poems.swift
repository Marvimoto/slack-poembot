
import Foundation

struct Poems {
    static let poems = [
        "Nico ist ein dicker Wicht, drum widme ich ihm das Gedicht.",
        "Marvin, der diesen Bot hier schrieb, den haben alle Leute lieb.",
        "Malte, unser Superstar, den lieben wir, das ist doch klar.",
        "Anna haben alle lieb, sie ist gewiss kein Autodieb.",
        "Eva, unser neuer Agility Master entschärft jedes Scrumdisaster.",
        "Seebach, äy, der Grumpy Guy, braucht mal ein paar Wochen frei.",
        "Ben, dessen Haar ist stets gewellt, hat den Kasten längst schon kalt gestellt.",
        "Der Thomas oder TNT - Ein wahres Datenfeuerwerk, wie noch nie.",
        "Baumeister DevBobs Bot-geplagt ist der, den man bei Unwissen am liebsten fragt.",
        "Die Nancy, ach, so zart und fein, haut volle Kanne Agile rein.",
        "Wer reitet so spät durch Nacht und Wind? Es ist der Timo, das Vorzeigekind. Er hat die Xbox wohl im Arm. Er fasst sie sicher, er hält sie warm."
    ]
    static func random() -> String {
        var randomNumber : Int

            randomNumber = Int.random(min: 0, max: poems.count - 1)

        return poems[randomNumber]
    }
}


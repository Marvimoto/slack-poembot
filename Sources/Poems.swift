
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
        "public class lean_guy {\npublic static void main(String[] args) {\n\nlong ago_lived_there_a_guy;\nfloat ed_he_accross_the_sky;\nboolean called_him_all_his_friends;\ncouse_he_was_as_lean_as_hell;\n\nchar ming_eyes_he_had_as_matched,\nbut_the; String was_still_attached;\nfinal float he_did_today;\nlong before_he_flew_away;\n\n}\n}",
        ":root {\n  --sweet: #000000;\n} \n\n.rose {\n  color: red;\n}\n\n.violett {\n  color: blue;\n}\n\n.sugar {\n  color: var(--sweet);\n}\n\n#you {\n  color: var(--sweet);\n}"
    ]
    static func random() -> String {
        var randomNumber : Int

            randomNumber = Int.random(min: 0, max: poems.count - 1)

        return poems[randomNumber]
    }
}


import Foundation

struct AnswerOption: Identifiable, Hashable {
    let id = UUID()
    let text: String
}

struct Question: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let options: [AnswerOption]
    let correctIndex: Int
}

struct QuizData {
    static let questions: [Question] = [
        Question(
            text: "What is the capital of France?",
            options: [
                AnswerOption(text: "Berlin"),
                AnswerOption(text: "Madrid"),
                AnswerOption(text: "Paris"),
                AnswerOption(text: "Rome")
            ],
            correctIndex: 2
        ),
        Question(
            text: "Which planet is known as the Red Planet?",
            options: [
                AnswerOption(text: "Venus"),
                AnswerOption(text: "Mars"),
                AnswerOption(text: "Jupiter"),
                AnswerOption(text: "Saturn")
            ],
            correctIndex: 1
        ),
        Question(
            text: "Which language is used to develop iOS apps?",
            options: [
                AnswerOption(text: "Kotlin"),
                AnswerOption(text: "Swift"),
                AnswerOption(text: "Java"),
                AnswerOption(text: "C#")
            ],
            correctIndex: 1
        ),
        Question(
            text: "What is 9 × 9?",
            options: [
                AnswerOption(text: "72"),
                AnswerOption(text: "81"),
                AnswerOption(text: "99"),
                AnswerOption(text: "108")
            ],
            correctIndex: 1
        ),
        Question(
            text: "Which company created the iPhone?",
            options: [
                AnswerOption(text: "Google"),
                AnswerOption(text: "Apple"),
                AnswerOption(text: "Microsoft"),
                AnswerOption(text: "Samsung")
            ],
            correctIndex: 1
        ),
        Question(
            text: "Which ocean is the largest?",
            options: [
                AnswerOption(text: "Atlantic"),
                AnswerOption(text: "Indian"),
                AnswerOption(text: "Pacific"),
                AnswerOption(text: "Arctic")
            ],
            correctIndex: 2
        ),
        Question(
            text: "What does CPU stand for?",
            options: [
                AnswerOption(text: "Central Processing Unit"),
                AnswerOption(text: "Computer Personal Unit"),
                AnswerOption(text: "Central Power Unit"),
                AnswerOption(text: "Control Processing Utility")
            ],
            correctIndex: 0
        ),
        Question(
            text: "Which year did the first iPhone launch?",
            options: [
                AnswerOption(text: "2005"),
                AnswerOption(text: "2007"),
                AnswerOption(text: "2009"),
                AnswerOption(text: "2011")
            ],
            correctIndex: 1
        ),
        Question(
            text: "What is the chemical symbol for water?",
            options: [
                AnswerOption(text: "O2"),
                AnswerOption(text: "CO2"),
                AnswerOption(text: "H2O"),
                AnswerOption(text: "HO2")
            ],
            correctIndex: 2
        ),
        Question(
            text: "Which of these is a programming paradigm?",
            options: [
                AnswerOption(text: "Object-Oriented"),
                AnswerOption(text: "Organic-Oriented"),
                AnswerOption(text: "Operation-Oriented"),
                AnswerOption(text: "Office-Oriented")
            ],
            correctIndex: 0
        )
    ]
}

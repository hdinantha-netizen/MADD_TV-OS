import Foundation
import Combine

final class QuizViewModel: ObservableObject {
    @Published private(set) var questions: [Question]
    @Published private(set) var currentIndex: Int = 0
    @Published private(set) var selectedIndex: Int? = nil
    @Published private(set) var score: Int = 0
    @Published private(set) var isCompleted: Bool = false
    @Published private(set) var userAnswers: [Int?]

    var currentQuestion: Question {
        questions[currentIndex]
    }

    var totalQuestions: Int {
        questions.count
    }

    init(questions: [Question] = QuizData.questions) {
        self.questions = questions
        self.userAnswers = Array(repeating: nil, count: questions.count)
    }

    func selectAnswer(at index: Int) {
        selectedIndex = index
    }

    func submitCurrentAnswer() {
        guard !isCompleted else { return }
        guard let selectedIndex else { return }

        userAnswers[currentIndex] = selectedIndex

        if selectedIndex == currentQuestion.correctIndex {
            score += 1
        }
    }

    func goToNextQuestion() {
        guard !isCompleted else { return }

        if currentIndex < questions.count - 1 {
            currentIndex += 1
            selectedIndex = userAnswers[currentIndex]
        } else {
            isCompleted = true
        }
    }

    func resetQuiz() {
        currentIndex = 0
        selectedIndex = nil
        score = 0
        isCompleted = false
        userAnswers = Array(repeating: nil, count: questions.count)
    }
}

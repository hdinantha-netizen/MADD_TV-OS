import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedRetry: Bool

    @State private var animatedScore: Int = 0

    private var scoreFraction: Double {
        guard viewModel.totalQuestions > 0 else { return 0 }
        return Double(viewModel.score) / Double(viewModel.totalQuestions)
    }

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.05, green: 0.06, blue: 0.15), Color.purple.opacity(0.85), Color.cyan.opacity(0.9)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 48) {
                    VStack(spacing: 16) {
                        Text("Quiz Complete")
                            .font(.system(size: 56, weight: .bold, design: .rounded))
                            .foregroundColor(.white)

                        Text("Here is how you did")
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.8))
                    }

                    HStack(spacing: 40) {
                        ZStack {
                            Circle()
                                .strokeBorder(Color.white.opacity(0.2), lineWidth: 18)

                            Circle()
                                .trim(from: 0, to: scoreFraction)
                                .stroke(AngularGradient(gradient: Gradient(colors: [.green, .yellow, .orange, .red]), center: .center), style: StrokeStyle(lineWidth: 18, lineCap: .round))
                                .rotationEffect(.degrees(-90))

                            VStack(spacing: 4) {
                                Text("Score")
                                    .font(.headline)
                                    .foregroundColor(.white.opacity(0.8))

                                Text("\(animatedScore)")
                                    .font(.system(size: 56, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)

                                Text("out of \(viewModel.totalQuestions)")
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                        }
                        .frame(width: 260, height: 260)
                        .shadow(radius: 25)

                        VStack(alignment: .leading, spacing: 12) {
                            Text("Breakdown")
                                .font(.title2.weight(.semibold))
                                .foregroundColor(.white)

                            Text("Correct: \(viewModel.score)")
                                .foregroundColor(.green)

                            Text("Incorrect: \(viewModel.totalQuestions - viewModel.score)")
                                .foregroundColor(.red)

                            Text(String(format: "Accuracy: %.0f%%", scoreFraction * 100))
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white.opacity(0.15), lineWidth: 1)
                    )
                    .shadow(radius: 20)

                    VStack(alignment: .leading, spacing: 24) {
                        Text("Answer Review")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.white)

                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(Array(viewModel.questions.enumerated()), id: \.1.id) { index, question in
                                Button(action: {}) {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Q\(index + 1). \(question.text)")
                                            .font(.headline)
                                            .foregroundColor(.white)

                                        if let userIndex = viewModel.userAnswers[index] {
                                            let isCorrect = userIndex == question.correctIndex
                                            Text("Your answer: \(question.options[userIndex].text)")
                                                .foregroundColor(isCorrect ? .green : .red)
                                        } else {
                                            Text("Your answer: No answer")
                                                .foregroundColor(.secondary)
                                        }

                                        Text("Correct answer: \(question.options[question.correctIndex].text)")
                                            .foregroundColor(.green)
                                            .font(.subheadline)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(16)
                                    .background(Color.white.opacity(0.04))
                                    .cornerRadius(18)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }

                    Button {
                        viewModel.resetQuiz()
                        dismiss()
                    } label: {
                        Text("Play Again")
                            .font(.title2.weight(.semibold))
                            .padding(.horizontal, 50)
                            .padding(.vertical, 18)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(20)
                            .shadow(radius: 15)
                    }
                    .buttonStyle(.plain)
                    .focused($focusedRetry)
                    .padding(.top, 10)

                    VStack(spacing: 4) {
                        Text("QuizMaster TV")
                            .font(.footnote.weight(.semibold))
                            .foregroundColor(.white.opacity(0.8))

                        Text("Credits: Quiz design & development by Student")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    .padding(.top, 20)
                }
                .padding(60)
            }
        }
        .onAppear {
            focusedRetry = true
            animatedScore = 0
            withAnimation(.easeOut(duration: 1.0)) {
                animatedScore = viewModel.score
            }
        }
        .navigationTitle("Results")
    }
}

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    @State private var showResults: Bool = false

    private enum AnswerFocus: Hashable {
        case option(Int)
        case next
    }

    @FocusState private var focusedField: AnswerFocus?

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.05, green: 0.06, blue: 0.15), Color.purple.opacity(0.85), Color.blue.opacity(0.9)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 32) {
                Text("Question \(viewModel.currentIndex + 1) of \(viewModel.totalQuestions)")
                    .font(.title3.weight(.medium))
                    .foregroundColor(.white.opacity(0.8))

                VStack(alignment: .leading, spacing: 28) {
                    Text(viewModel.currentQuestion.text)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)

                    VStack(spacing: 22) {
                        ForEach(Array(viewModel.currentQuestion.options.enumerated()), id: \.offset) { index, option in
                            Button {
                                viewModel.selectAnswer(at: index)
                                focusedField = .next
                            } label: {
                                HStack {
                                    Text(option.text)
                                        .font(.title2)
                                        .padding(.vertical, 10)
                                    Spacer()
                                }
                                .padding(.horizontal, 24)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(viewModel.selectedIndex == index ? Color.cyan.opacity(0.9) : Color.white.opacity(0.12))
                                )
                                .foregroundColor(.white)
                            }
                            .buttonStyle(.plain)
                            .focused($focusedField, equals: .option(index))
                        }
                    }
                }
                .padding(30)
                .frame(maxWidth: 1100)
                .background(Color.white.opacity(0.06))
                .cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white.opacity(0.18), lineWidth: 1)
                )
                .shadow(radius: 20)

                Spacer(minLength: 10)

                // Hidden navigation link that triggers when quiz is finished
                NavigationLink(isActive: $showResults) {
                    ResultsView()
                        .environmentObject(viewModel)
                } label: {
                    EmptyView()
                }

                Button {
                    viewModel.submitCurrentAnswer()

                    if viewModel.currentIndex == viewModel.totalQuestions - 1 {
                        viewModel.goToNextQuestion()
                        showResults = true
                    } else {
                        viewModel.goToNextQuestion()
                        if let selectedIndex = viewModel.selectedIndex {
                            focusedField = .option(selectedIndex)
                        } else {
                            focusedField = .option(0)
                        }
                    }
                } label: {
                    Text(viewModel.currentIndex == viewModel.totalQuestions - 1 ? "Finish Quiz" : "Next Question")
                        .font(.title2.weight(.semibold))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 16)
                        .frame(maxWidth: 420)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(18)
                }
                .buttonStyle(.plain)
                .focused($focusedField, equals: .next)
                .disabled(viewModel.selectedIndex == nil)
                .opacity(viewModel.selectedIndex == nil ? 0.5 : 1)
            }
            .padding(60)
        }
        .onAppear {
            if let selectedIndex = viewModel.selectedIndex {
                focusedField = .option(selectedIndex)
            } else {
                focusedField = .option(0)
            }
        }
        .navigationTitle("Quiz")
    }
}

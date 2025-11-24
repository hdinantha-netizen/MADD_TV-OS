import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    @FocusState private var isStartFocused: Bool

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.06, green: 0.07, blue: 0.15), Color.purple.opacity(0.9), Color.cyan.opacity(0.9)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Image("QuizMasterLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 260, height: 260)
                        .shadow(radius: 30)

                    Text("QuizMaster TV")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .foregroundStyle(LinearGradient(colors: [.white, Color.yellow.opacity(0.9)], startPoint: .leading, endPoint: .trailing))

                    Text("Test your knowledge on the big screen with 10 quick questions.")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.85))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 80)
                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(32)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(Color.white.opacity(0.25), lineWidth: 1)
                )

                NavigationLink {
                    QuizView()
                        .environmentObject(viewModel)
                } label: {
                    Text("Start Quiz")
                        .font(.title2.weight(.semibold))
                        .padding(.horizontal, 70)
                        .padding(.vertical, 20)
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(22)
                        .shadow(radius: 20)
                }
                .buttonStyle(.plain)
                .focused($isStartFocused)
            }
            .padding(60)
        }
        .onAppear {
            isStartFocused = true
            viewModel.resetQuiz()
        }
    }
}

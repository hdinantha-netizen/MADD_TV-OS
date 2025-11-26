QuizMaster TV – 10Q Challenge

A simple, smooth, and fun 10-question quiz game for tvOS built using SwiftUI, MVVM, and NavigationStack.

QuizMaster TV is a lightweight Apple TV quiz app where users answer 10 multiple-choice questions and receive a final score summary. The app is designed for clarity, ease of navigation, and a clean big-screen UI optimized for tvOS.

 Features
 Home Screen

Clean, TV-friendly layout.

“Start 10-Question Challenge” button.

Optional category selection.

Smooth remote navigation using FocusState and parallax effects.

Quiz Screen

Presents 10 multiple-choice questions one by one.

Shows: Question number, question text, and four answer choices.

Remote navigation between answer options.

Confirm answer → then moves to next question.

Supports going Back to previous questions to revise answers.

Uses animations for correct/incorrect feedback.

Results Screen

After all 10 questions, shows:

Total score

Percentage

List of all questions

Your selected answers

Correct answers

Explanation for each question

“Retry” and “Return Home” actions.

Profiles

Simple profile picker (2–3 profiles).

Saves last score and attempt history using UserDefaults.

Each profile shows last attempt date + score.

AI Recommendation (Mock ML)

Lightweight logic or a mock CoreML model suggests:
“Recommended next category based on your performance.”

Technology Stack

SwiftUI (tvOS)

MVVM Architecture

NavigationStack for smooth navigation

FocusState for remote-friendly controls

Parallax and scaling animations for TV UI

UserDefaults for persistent profile data

Mock CoreML or basic AI logic for recommendations

Unit Tests for scoring logic

UI Tests for navigation Home → Quiz → Results

Project Structure
QuizMasterTV/
 ├── Views/
 │    ├── HomeView.swift
 │    ├── QuizView.swift
 │    ├── ResultsView.swift
 ├── ViewModels/
 │    ├── QuizViewModel.swift
 ├── Models/
 │    ├── Question.swift


How It Works

User selects Start Quiz on the Home screen.

App loads the 10 questions from SampleQuestions.swift.

User answers each question using the Apple TV remote.

After question 10, the app shows:

Final score

Detailed review

User can Retry or return Home.

Score is saved to the active profile.

AI recommends a category for the next round.

How to Run

Open the project in Xcode (tvOS target).

Select Apple TV 4K simulator.

Press Run.

Navigate using the remote/swipe controls.

Testing

Includes:

Unit tests for scoring logic.

UI test verifying Home → Quiz → Results navigation.

Learning Outcomes

This project demonstrates:

NavigationStack on tvOS

Using FocusState for remote interactions

Big-screen optimized UI

MVVM architecture

Quiz logic + scoring system

Data persistence with UserDefaults

Lightweight AI recommendation logic

Clean code organization and testing

Author

Your Name: PERERA K A H D - IT22603722
BSc (Hons) in Information Technology – Year 4
Module: MADD

License

This project is for academic use.

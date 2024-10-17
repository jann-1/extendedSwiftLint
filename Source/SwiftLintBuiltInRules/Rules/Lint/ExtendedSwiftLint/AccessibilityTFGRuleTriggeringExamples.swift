//
//  AccessibilityTFGRuleTriggeringExamples.swift
//  SwiftLint
//
//  Created by Jann‘s AWL Mac on 26.09.2024.
//

// This is a really dumb name but it has to be <= 40 char long
enum AccessibilityTFGRuleTriggeringExamples {
    static let triggeringExamples = [
        // MARK: - .gesture(Gesture())

        // Triggering Example without accessibility modifiers
        Example("""
        struct MyView: View {
            var body: some View {
                ↓Text("Hello, World!")
                    .gesture(TapGesture())
            }
        }
        """),

        // MARK: - .onTapGesture {}

        // Triggering Example without accessibility modifiers
        Example("""
        struct MyView: View {
            var body: some View {
                ↓Text("Tap me")
                    .onTapGesture {
                        // Tap action
                    }
            }
        }
        """),

        // MARK: - .onTapGesture(perform: {})

        // Triggering Example without accessibility modifiers
        Example("""
        struct MyView: View {
            var body: some View {
                ↓Text("Tap me")
                    .onTapGesture(perform: {
                        // Tap action
                    })
            }
        }
        """),

        // MARK: - .onLongPressGesture {}

        // Triggering Example without accessibility modifiers
        Example("""
        struct MyView: View {
            var body: some View {
                ↓Text("Long Press me")
                    .onLongPressGesture {
                        // Long press action
                    }
            }
        }
        """),

        // MARK: - .onLongPressGesture(perform: {})

        // Triggering Example without accessibility modifiers
        Example("""
        struct MyView: View {
            var body: some View {
                ↓Text("Long Press me")
                    .onLongPressGesture(perform: {
                        // Long press action
                    })
            }
        }
        """),

        // MARK: - .highPriorityGesture(Gesture())

        // Triggering Example without accessibility modifiers
        Example("""
        struct MyView: View {
            var body: some View {
                 ↓Text("Swipe me")
                    .highPriorityGesture(SwipeGesture())
            }
        }
        """),

        // MARK: - .simultaneousGesture(Gesture())

        // Triggering Example without accessibility modifiers
        Example("""
        struct MyView: View {
            var body: some View {
                ↓Text("Rotate me")
                    .simultaneousGesture(RotationGesture())
            }
        }
        """),
    ]
}

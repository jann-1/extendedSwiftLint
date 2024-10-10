//
//  AccessibilityForCustomGesturesRuleExamples.swift
//  SwiftLint
//
//  Created by Jann‘s AWL Mac on 26.09.2024.
//

enum AccessibilityRepresentationForGesturesRuleExamples {
    static let nonTriggeringExamples = [
        // MARK: - .gesture(Gesture())

        // Non-Triggering Example with .accessibilityRepresentation
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Hello, World!")
                    .gesture(DragGesture())
                    .accessibilityRepresentation {
                        Slider(value: .constant(0.5))
                    }
            }
        }
        """),

        // Non-Triggering Example with .accessibilityAction
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Hello, World!")
                    .gesture(TapGesture())
                    .accessibilityAction {
                        // Accessible tap action
                    }
            }
        }
        """),

        // MARK: - .onTapGesture {}

        // Non-Triggering Example with .accessibilityRepresentation
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Tap me")
                    .onTapGesture {
                        // Tap action
                    }
                    .accessibilityRepresentation {
                        Button(action: {
                            // Accessible button action
                        }) {
                            Text("Tap me")
                        }
                    }
            }
        }
        """),

        // Non-Triggering Example with .accessibilityAction
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Tap me")
                    .onTapGesture {
                        // Tap action
                    }
                    .accessibilityAction(named: "Tap") {
                        // Accessible tap action
                    }
            }
        }
        """),

        // MARK: - .onTapGesture(perform: {})

        // Non-Triggering Example with .accessibilityRepresentation
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Tap me")
                    .onTapGesture(perform: {
                        // Tap action
                    })
                    .accessibilityRepresentation {
                        Button(action: {
                            // Accessible button action
                        }) {
                            Text("Tap me")
                        }
                    }
            }
        }
        """),

        // Non-Triggering Example with .accessibilityAction
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Tap me")
                    .onTapGesture(perform: {
                        // Tap action
                    })
                    .accessibilityAction {
                        // Accessible tap action
                    }
            }
        }
        """),

        // MARK: - .onLongPressGesture {}

        // Non-Triggering Example with .accessibilityRepresentation
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Long Press me")
                    .onLongPressGesture {
                        // Long press action
                    }
                    .accessibilityRepresentation {
                        Button(action: {
                            // Accessible long press action
                        }) {
                            Text("Long Press me")
                        }
                    }
            }
        }
        """),

        // Non-Triggering Example with .accessibilityAction
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Long Press me")
                    .onLongPressGesture {
                        // Long press action
                    }
                    .accessibilityAction(named: "Long Press") {
                        // Accessible long press action
                    }
            }
        }
        """),

        // MARK: - .onLongPressGesture(perform: {})

        // Non-Triggering Example with .accessibilityRepresentation
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Long Press me")
                    .onLongPressGesture(perform: {
                        // Long press action
                    })
                    .accessibilityRepresentation {
                        Button(action: {
                            // Accessible long press action
                        }) {
                            Text("Long Press me")
                        }
                    }
            }
        }
        """),

        // Non-Triggering Example with .accessibilityAction
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Long Press me")
                    .onLongPressGesture(perform: {
                        // Long press action
                    })
                    .accessibilityAction {
                        // Accessible long press action
                    }
            }
        }
        """),

        // MARK: - .highPriorityGesture(Gesture())

        // Non-Triggering Example with .accessibilityRepresentation
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Swipe me")
                    .highPriorityGesture(SwipeGesture())
                    .accessibilityRepresentation {
                        Button(action: {
                            // Accessible swipe action
                        }) {
                            Text("Swipe me")
                        }
                    }
            }
        }
        """),

        // Non-Triggering Example with .accessibilityAction
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Swipe me")
                    .highPriorityGesture(SwipeGesture())
                    .accessibilityAction(named: "Swipe") {
                        // Accessible swipe action
                    }
            }
        }
        """),

        // MARK: - .simultaneousGesture(Gesture())

        // Non-Triggering Example with .accessibilityRepresentation
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Rotate me")
                    .simultaneousGesture(RotationGesture())
                    .accessibilityRepresentation {
                        Text("Rotatable Text")
                    }
            }
        }
        """),

        // Non-Triggering Example with .accessibilityAction
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Rotate me")
                    .simultaneousGesture(RotationGesture())
                    .accessibilityAction(named: "Rotate") {
                        // Accessible rotate action
                    }
            }
        }
        """),
    ]

    static let triggeringExamples = [
        // MARK: - .gesture(Gesture())

        // Triggering Example without accessibility modifiers
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Hello, World!")
                    ↓.gesture(TapGesture())
            }
        }
        """),

        // MARK: - .onTapGesture {}

        // Triggering Example without accessibility modifiers
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Tap me")
                    ↓.onTapGesture {
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
                Text("Tap me")
                    ↓.onTapGesture(perform: {
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
                Text("Long Press me")
                    ↓.onLongPressGesture {
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
                Text("Long Press me")
                    ↓.onLongPressGesture(perform: {
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
                Text("Swipe me")
                    ↓.highPriorityGesture(SwipeGesture())
            }
        }
        """),

        // MARK: - .simultaneousGesture(Gesture())

        // Triggering Example without accessibility modifiers
        Example("""
        struct MyView: View {
            var body: some View {
                Text("Rotate me")
                    ↓.simultaneousGesture(RotationGesture())
            }
        }
        """),
    ]
}


/* MARK: Not in Use
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
 */

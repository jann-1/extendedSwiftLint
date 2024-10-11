//
//  AccessibilityForCustomGesturesRuleExamples.swift
//  SwiftLint
//
//  Created by Jann‘s AWL Mac on 26.09.2024.
//

enum AccessibilityTraitForGesturesRuleExamples {
    // MARK: - nonTriggeringExamples

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

    // MARK: - triggeringExamples

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

    /*

     static let triggeringExamples = [
         // MARK: - .gesture(Gesture())

         // Triggering Example without accessibility modifiers
         Example("""
         struct MyView: View {
             var body: some View {
                 ↓Text("Hello, World!")
                     .gesture(TapGesture())
                     .padding()
                     .background(Color.blue)
             }
         }
         """),

         Example("""
         struct MyView: View {
             var body: some View {
                 ↓VStack {
                     Text("Title")
                     Image(systemName: "star.fill")
                 }
                 .gesture(TapGesture())
                 .frame(width: 200, height: 200)
                 .border(Color.gray, width: 2)
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
                     .padding()
                     .foregroundColor(.red)
             }
         }
         """),

         Example("""
         struct MyView: View {
             var body: some View {
                 ↓HStack {
                     Text("Item 1")
                     Text("Item 2")
                 }
                 .onTapGesture {
                     // Tap action
                 }
                 .padding()
                 .background(Color.green)
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
                     .padding()
                     .background(Color.yellow)
             }
         }
         """),

         Example("""
         struct MyView: View {
             var body: some View {
                 ↓ZStack {
                     Circle()
                     Text("Center")
                 }
                 .onTapGesture(perform: {
                     // Tap action
                 })
                 .shadow(radius: 5)
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
                     .padding()
                     .background(Color.purple)
             }
         }
         """),

         Example("""
         struct MyView: View {
             var body: some View {
                 ↓HStack {
                     Image(systemName: "hand.point.up.fill")
                     Text("Hold me")
                 }
                 .onLongPressGesture {
                     // Long press action
                 }
                 .frame(width: 150, height: 100)
                 .cornerRadius(10)
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
                     .padding()
                     .border(Color.orange, width: 3)
             }
         }
         """),

         Example("""
         struct MyView: View {
             var body: some View {
                 ↓VStack {
                     Rectangle()
                         .fill(Color.blue)
                         .frame(width: 100, height: 50)
                     Text("Press")
                 }
                 .onLongPressGesture(perform: {
                     // Long press action
                 })
                 .opacity(0.8)
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
                     .padding()
                     .background(Color.pink)
             }
         }
         """),

         Example("""
         struct MyView: View {
             var body: some View {
                 ↓HStack {
                     Text("Swipe left")
                     Text("Swipe right")
                 }
                 .highPriorityGesture(SwipeGesture())
                 .border(Color.black, width: 1)
                 .frame(width: 250, height: 80)
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
                     .padding()
                     .background(Color.gray)
             }
         }
         """),

         Example("""
         struct MyView: View {
             var body: some View {
                 ↓ZStack {
                     Image(systemName: "arrow.2.circlepath")
                     Text("Rotate")
                 }
                 .simultaneousGesture(RotationGesture())
                 .scaleEffect(1.2)
                 .frame(width: 200, height: 200)
             }
         }
         """),
     ]

      */
}

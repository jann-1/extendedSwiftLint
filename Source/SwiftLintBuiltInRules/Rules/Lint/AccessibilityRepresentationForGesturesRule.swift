import SwiftSyntax

@SwiftSyntaxRule
struct AccessibilityRepresentationForGesturesRule: OptInRule {
    var configuration = SeverityConfiguration<Self>(.warning)

    static let description = RuleDescription(
        identifier: "accessibility_representation_for_gesture",
        name: "Accessibility Representation for Gestures",
        description: "Images that provide context should have an accessibility label or should be explicitly hidden " +
            "from accessibility",
        kind: .lint,
        minSwiftVersion: .fiveDotOne,
        nonTriggeringExamples: AccessibilityRepresentationForGesturesRuleExamples.nonTriggeringExamples,
        triggeringExamples: AccessibilityRepresentationForGesturesRuleExamples.triggeringExamples
    )

    func makeVisitor(configuration: ConfigurationType, file: SwiftLintFile) -> ViolationsSyntaxVisitor<ConfigurationType> {
        Visitor(configuration: configuration, file: file)
    }
}

private extension AccessibilityRepresentationForGesturesRule {
    final class Visitor: ViolationsSyntaxVisitor<ConfigurationType> {
        override func visitPost(_ node: DeclReferenceExprSyntax) {
            // Visitor logic to check for gestures and corresponding accessibility modifiers
            let calledExpression = node.baseName.text
            let gestureMethods = [
                "gesture",
                "onTapGesture",
                "onLongPressGesture",
                "highPriorityGesture",
                "simultaneousGesture",
            ]

            // Check if the function call is a gesture modifier
            if gestureMethods.contains(calledExpression) {
                // Traverse sibling nodes to check if an accessibility modifier exists
                var currentNode: Syntax? = node.parent
                var hasAccessibilityModifier = false

                while let parent = currentNode {
                    if let memberAccessExpr = parent.as(FunctionCallExprSyntax.self),
                       let memberCalledExpression = memberAccessExpr.calledExpression.as(MemberAccessExprSyntax.self) {
                        let memberName = memberCalledExpression.declName.baseName.text

                        if [
                            "accessibilityRepresentation",
                            "accessibilityAction",
                        ].contains(memberName) {
                            hasAccessibilityModifier = true
                            break
                        }
                    }
                    currentNode = parent.parent
                }

                // Report a violation if no accessibility modifier was found
                if !hasAccessibilityModifier {
                    let position = node.position.advanced(by: -1)

                    violations.append(ReasonedRuleViolation(
                        // Get Absolute position before the memberCalledExpression
                        position: position,
                        reason: "Gesture modifiers should be accompanied by an accessibility modifier"
                    ))
                }
            }
        }
    }
}

/* Example
 Text("Hello, World!")
     .gesture(Gesture())
     .onTapGesture {}
     .onTapGesture(perform: {})
     .onLongPressGesture {}
     .onLongPressGesture(perform: {})
     .highPriorityGesture(Gesture())
     .simultaneousGesture(Gesture())
 */

import SwiftSyntax

@SwiftSyntaxRule
struct AccessibilityTraitForGesturesRule: OptInRule {
    var configuration = SeverityConfiguration<Self>(.warning)

    static let description = RuleDescription(
        identifier: "accessibility_representation_for_gesture",
        name: "Accessibility Representation for Gestures",
        description: "All Views with gestures should include an accessibility representation, action" +
            "or be hidden from accessibility",
        kind: .lint,
        minSwiftVersion: .fiveDotOne,
        nonTriggeringExamples: AccessibilityTraitForGesturesRuleExamples.nonTriggeringExamples,
        triggeringExamples: AccessibilityTraitForGesturesRuleExamples.triggeringExamples
    )

    func makeVisitor(configuration: ConfigurationType, file: SwiftLintFile)
        -> ViolationsSyntaxVisitor<ConfigurationType> {
        Visitor(configuration: configuration, file: file)
    }
}

private extension AccessibilityTraitForGesturesRule {
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
                var labeledExprPosition: AbsolutePosition?

                while let parent = currentNode {
                    if let functionCallExpr = parent.as(FunctionCallExprSyntax.self),
                       let memberAccessExpr = functionCallExpr.calledExpression.as(MemberAccessExprSyntax.self) {
                        let memberName = memberAccessExpr.declName.baseName.text

                        // Get Position of e.g. the Text View which the modifiers are applied to
                        // Is only set if labeledExprPosition is nil
                        if let funcCallExpr = memberAccessExpr.base?.as(FunctionCallExprSyntax.self),
                           let declReferenceExpr = funcCallExpr.calledExpression.as(DeclReferenceExprSyntax.self),
                           labeledExprPosition == nil {
                            labeledExprPosition = declReferenceExpr.baseName.positionAfterSkippingLeadingTrivia
                        }

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
                    // Fallback: if no `labeledExprPosition` was found, the pos of the gesture modifier will be marked.
                    let position = labeledExprPosition ?? node.position.advanced(by: -1)

                    violations.append(ReasonedRuleViolation(
                        // Get Absolute position before the memberCalledExpression
                        position: position,
                        reason: "Gesture modifiers should be accompanied by an accessibility modifier" +
                            " like accessibilityRepresentation or accessibilityAction"
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

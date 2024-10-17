import SwiftSyntax

@SwiftSyntaxRule
struct AccessibilityTraitForGestureRule: OptInRule {
    // TODO: Add more checks for non violation modifiers
    // e.g. accessibility traits: isButton, isLink

    var configuration = SeverityConfiguration<Self>(.warning)

    static let description = RuleDescription(
        identifier: "accessibility_representation_for_gesture",
        name: "Accessibility Representation for Gestures",
        description: "All Views with gestures should include an accessibility representation, action" +
            "or be hidden from accessibility",
        kind: .lint,
        minSwiftVersion: .fiveDotOne,
        nonTriggeringExamples: AccessibilityTraitForGestureRuleExamples.nonTriggeringExamples,
        triggeringExamples: AccessibilityTraitForGestureRuleExamples.triggeringExamples
    )

    func makeVisitor(configuration: ConfigurationType, file: SwiftLintFile)
        -> ViolationsSyntaxVisitor<ConfigurationType> {
        Visitor(configuration: configuration, file: file)
    }
}

private extension AccessibilityTraitForGestureRule {
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
                var currentNode: Syntax? = Syntax(node)
                var hasAccessibilityModifier = false
                var labeledExprPosition: AbsolutePosition?

                while let parent = currentNode {
                    if let functionCallExpr = parent.as(FunctionCallExprSyntax.self),
                       let memberAccessExpr = functionCallExpr.calledExpression.as(MemberAccessExprSyntax.self) {
                        let memberName = memberAccessExpr.declName.baseName.text

                        // Get Position of e.g. the Text View which the modifiers are applied to
                        // Is only set if labeledExprPosition is nil
                        if labeledExprPosition == nil {
                            if let exprSyntax = memberAccessExpr.base,
                               let baseNode = findBaseView(from: exprSyntax) {
                                labeledExprPosition = baseNode.baseName.positionAfterSkippingLeadingTrivia
                            }
                        }

                        if [
                            "accessibilityRepresentation",
                            "accessibilityAction",
                            "accessibilityHidden",
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
                        reason: "All Views with gestures should include an accessibility representation, action" +
                            "or be hidden from accessibility"
                    ))
                }
            }
        }

        private func findBaseView(from expression: ExprSyntax) -> DeclReferenceExprSyntax? {
            var currentExpression: ExprSyntax? = expression

            // Recursively iterate over the base and calledExpression until a DeclReferenceExprSyntax is found
            while let funcCallExpr = currentExpression?.as(FunctionCallExprSyntax.self) {
                if let declRefExpr = funcCallExpr.calledExpression.as(DeclReferenceExprSyntax.self) {
                    return declRefExpr
                }

                if let memberAccessExpr = funcCallExpr.calledExpression.as(MemberAccessExprSyntax.self) {
                    currentExpression = memberAccessExpr.base
                    continue
                }

                break
            }

            return nil
        }
    }
}

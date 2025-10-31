func grader(percentages: (Int, Int, Int)) -> (((Double, Double, Double)) -> Int?)? {
    let (p1, p2, p3) = percentages
    let totalPercent = p1 + p2 + p3
    
    // If total percentage does not equal 100, return nil
    guard totalPercent == 100 else { return nil }
    
    // Return a closure that takes component scores
    return { scores in
        let (s1, s2, s3) = scores

        // Check each score is 0–100
        guard (0...100).contains(s1),
              (0...100).contains(s2),
              (0...100).contains(s3) else { return nil }
        
        // Compute total weighted points
        let totalPoints = s1 * Double(p1) / 100.0
                        + s2 * Double(p2) / 100.0
                        + s3 * Double(p3) / 100.0
        
        // If total points are outside 0–100, return nil
        guard totalPoints >= 0 && totalPoints <= 100 else { return nil }
        
        // Compute intermediate grade
        let grade: Double
        if totalPoints < 40 {
            grade = 0.0
        } else {
            // Linear mapping from 40 -> 0.5 to 100 -> 5.49
            grade = 0.5 + (totalPoints - 40) * (5.49 - 0.5) / (100 - 40)
        }
        
        // Return final rounded grade
        return Int(grade.rounded())
    }
}

print("Example #1 prints 1 5 2:")
if let g1 = grader(percentages: (60, 30, 10)) {
    print(g1((40.0, 40.0, 40.0)) ?? "N/A")
    print(g1((100.0, 100.0, 100.0)) ?? "N/A")
    print(g1((100.0, 11.0, 0.0)) ?? "N/A")
}

print("\nExample #2 prints 1 5 N/A:")
if let g2 = grader(percentages: (80, 20, 0)) {
    print(g2((40.0, 40.0, 40.0)) ?? "N/A")
    print(g2((100.0, 100.0, 100.0)) ?? "N/A")
    print(g2((100.0, 110.0, 0.0)) ?? "N/A")
}

print("\nExample #3 prints no grader:")
if let g3 = grader(percentages: (61, 30, 10)) {
    print(g3((40.0, 40.0, 40.0)) ?? "N/A")
} else {
    print("no grader")
}

print("\nThe total point required for grades 1 to 5 in this course:")
// Computes the minimum total points required for grades 1 to 5 in this course
func minPoints(forFinalGrade grade: Int) -> Double {
    let threshold = Double(grade) - 0.5
    let points = ((threshold - 0.5) * 60 / (5.49 - 0.5)) + 40
    return points
}

for g in 1...5 {
    print("Minimum total points for grade \(g): \(minPoints(forFinalGrade: g))")
}

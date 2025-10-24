func grader(examp: Int, assignmentp: Int, projectp: Int) -> Int {
    var examScore = examp
    if examScore < 0 {
        examScore = 0
    } else if examScore > 100 {
        examScore = 100
    }
    
    var assignmentScore = assignmentp
    if assignmentScore < 0 {
        assignmentScore = 0
    } else if assignmentScore > 100 {
        assignmentScore = 100
    }
    
    let total_points = 0.8*examScore + 0.2*assignmentScore
    
    let grade = if (examScore < 40) {
        0.0
    } else {
        let raw = 
    }

    return grade
}

print(grader(examp: 85, assignmentp: 100, projectp: 0))

//
//  StudentController.swift
//  SearchControllerTableView
//
//  Created by Emily Mearns on 6/21/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class StudentController {
    
    static var students = ["Steve", "Emily", "Sean", "Karl", "Nic", "Kevin", "Ross", "Eva", "Skylar", "Mason", "Habib", "Tyler", "Patrick", "AJ", "Parker"]
    
    static func searchForStudentWith(name: String) -> [String] {
        var results: [String] = []
        for student in students {
            if student.containsString(name) {
                results.append(student)
            }
        }
        return results
    }
}
//
//  TestQuizEntity.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/12.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation

class TestQuizEntity {
    var problemNo: Int
    var chapterTitle: String
    var testIdentifer: String
    
    var allocation: Int
    var quiz: String
    var theme: String
    var empha: String?
    var translate: String?
    var answer: Int
    var comment: String
    var choice: [String]
    
    init(dictionary: [String: Any]) {
        problemNo = dictionary["problemNo"] as! Int
        chapterTitle = dictionary["chapterTitle"] as! String
        testIdentifer = dictionary["testIdentifer"] as! String
        
        allocation = dictionary["allocation"] as! Int
        quiz = dictionary["quiz"] as! String
        theme = dictionary["theme"] as! String
        empha = dictionary["empha"] as? String
        translate = dictionary["translate"] as? String
        answer = dictionary["answer"] as! Int
        comment = dictionary["comment"] as! String
        choice = dictionary["choice"] as! [String]

    }
}

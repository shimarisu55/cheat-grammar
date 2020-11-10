//
//  QuestionEntity.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/23.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation

class QuestionEntity {
    let chapterTitle: String
    let paragraph: String
    let title: String
    let introQuiz: String
    let introTheme: String
    let introEmpha: String?
    let overview: String
    let empha: String?
    let introAnswer: String
    let lastQuestion: Bool
    
    let quiz1: String
    let theme1: String
    let empha1: String?
    let answer1: Int
    let comment1: String
    let choice1: [String]
    
    let quiz2: String
    let theme2: String
    let empha2: String?
    let answer2: Int
    let comment2: String
    let choice2: [String]
    
    let quiz3: String
    let theme3: String
    let empha3: String?
    let answer3: Int
    let comment3: String
    let choice3: [String]
    
    init(dictionary: [String: Any]) {
        chapterTitle = dictionary["chapterTitle"] as! String
        paragraph = dictionary["paragraph"] as! String
        title = dictionary["title"] as! String
        introQuiz = dictionary["introQuiz"] as! String
        introTheme = dictionary["introTheme"] as! String
        introEmpha = dictionary["introEmpha"] as? String
        overview = dictionary["overview"] as! String
        empha = dictionary["empha"] as? String
        introAnswer = dictionary["introAnswer"] as! String
        lastQuestion = dictionary["lastQuestion"] as? Bool ?? false
        
        quiz1 = dictionary["quiz1"] as! String
        theme1 = dictionary["theme1"] as! String
        empha1 = dictionary["empha1"] as? String
        answer1 = dictionary["answer1"] as! Int
        comment1 = dictionary["comment1"] as! String
        choice1 = dictionary["choice1"] as! [String]
        
        quiz2 = dictionary["quiz2"] as! String
        theme2 = dictionary["theme2"] as! String
        empha2 = dictionary["empha2"] as? String
        answer2 = dictionary["answer2"] as! Int
        comment2 = dictionary["comment2"] as! String
        choice2 = dictionary["choice2"] as! [String]
        
        quiz3 = dictionary["quiz3"] as! String
        theme3 = dictionary["theme3"] as! String
        empha3 = dictionary["empha3"] as? String
        answer3 = dictionary["answer3"] as! Int
        comment3 = dictionary["comment3"] as! String
        choice3 = dictionary["choice3"] as! [String]
    }
}

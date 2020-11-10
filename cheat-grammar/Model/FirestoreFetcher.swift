//
//  FetchFirestoreModel.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/23.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirebaseDBFetcher {
    static let sharedInstance = FirebaseDBFetcher()
    private let db = Firestore.firestore()
    private var ref: DatabaseReference = Database.database().reference()

    /// 該当のデータを呼ぶ(intro)
    func fetchIntroductionDocuments(keyword: String, completion: @escaping (QuestionEntity?) -> Swift.Void) {
        db.collection("introduction").document(keyword).getDocument() { (document, error) in
            if let question = document.flatMap({
                $0.data().flatMap({ (data) in
                    return QuestionEntity(dictionary: data)})
            }) {
                completion(question)
            } else {
                completion(nil)
            }
        }
    }
    
    func fetchTestDocuments(testIdentifer: String, completion: @escaping ([TestQuizEntity]?) -> Swift.Void) {
        db.collection("practice").whereField("testIdentifer", isEqualTo: testIdentifer).order(by: "problemNo", descending: false).getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                completion(nil)
            } else {
                var testQuizEntities = [TestQuizEntity]()
                for query in querySnapshot!.documents {
                  let testQuizEntity = TestQuizEntity(dictionary: query.data())
                    testQuizEntities.append(testQuizEntity)
                }
                completion(testQuizEntities)
            }

        }
    }
    
    func setValueDB(keyword:String, answer:String) {
        ref.child("workSheet").childByAutoId().setValue(["QID":keyword, "answer":answer])
    }
    
    /// アンケート結果を２種類ひっぱり終わった後に、円グラフを描く
    func referWorkSheet(keyword: String, compleation: @escaping (( [String:[String:String]]? )->Void)) {
        let subGroupsRef = ref.child("workSheet")
        let query = subGroupsRef.queryOrdered(byChild: "QID").queryEqual(toValue:keyword).queryLimited(toLast: 100)
        query.observeSingleEvent(of: .value) { snapshot in
            if let snapData = snapshot.value as? [String:[String:String]] {
                compleation(snapData)
                return
            }
            compleation(nil)
        }
    }
    
    
}

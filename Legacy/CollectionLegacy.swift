////
////  Collection.swift
////  ioniCup
////
////  Created by Lorenzo Fiamingo on 30/12/2019.
////
//
//import FirebaseFirestore
//
//extension DB {
//
//    class Collection<Document> where Document<Model: Codable>: ObservableObject, Identifiable where Model: Modelable  {
//
//        typealias ID = String
//        
//        typealias Reference = CollectionReference
//        
//        let id: ID
//        
//        let reference: Reference
//        
//        var documents: [Document] = []
//        
//        private var listener: ListenerRegistration?
//        
//        init(reference: Reference) {
//            self.id = reference.collectionID
//            self.reference = reference
//        }
//        
//        func getDocuments() {
//            reference.order(by: "order").getDocuments { (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    self.documents.removeAll()
//                    for document in querySnapshot!.documents {
//                        self.documents.append(Document(document: document))
//                    }
//                }
//            }
//        }
//        
//        func startListening(listenToDocumentsData: Bool = false) {
//            listener = reference.order(by: "order").addSnapshotListener { (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    querySnapshot?.documentChanges.forEach {diff in
//                        if (diff.type == .added) {
//                            self.documents.insert(Document(document: diff.document), at: Int(diff.newIndex))
//                        }
//                        if (diff.type == .modified) {
//                            self.documents.move(fromOffsets: IndexSet(integer: Int(diff.oldIndex)), toOffset: Int(diff.newIndex))
//                            if listenToDocumentsData {
//                                self.documents[Int(diff.newIndex)].write(data: diff.document.data())
//                            }
//                        }
//                        if (diff.type == .removed) {
//                            print("Removed city: \(diff.document.data())")
//                        }
//                    }
//                }
//            }
//        }
//        
//        func stopListening() {
//            listener?.remove()
//        }
//    }
//}
//
//extension DB.Collection.ID {
//
//    static let stages = "stages"
//}

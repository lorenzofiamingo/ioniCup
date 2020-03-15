////
////  Document.swift
////  ioniCup
////
////  Created by Lorenzo Fiamingo on 26/12/2019.
////
//
//import FirebaseFirestore
//
//protocol Modelable {
//    init()
//}
//
//extension DB {
//    
//    class Document<Model: Codable & Modelable>: ObservableObject, Identifiable {
//        
//        typealias ID = String
//        
//        typealias Reference = DocumentReference
//        
//        let id: ID
//        
//        let reference: Reference
//        
//        var snapshot: DocumentSnapshot?
//        
//        private var listener: ListenerRegistration?
//        
//        @Published var model: Model = .init()
//        
////        @Published var collections: [String: Collection<Model>] = [:]
////
////        var collectionIDs: [Collection<Model>.ID] {
////            []
////        }
//        
//        init(reference: Reference) {
//            self.id = reference.documentID
//            self.reference = reference
////            self.collectionIDs.forEach {
////                collections[$0] = Collection(reference: reference.collection($0))
////            }
//        }
//        
//        init(document: QueryDocumentSnapshot, writeInitialData: Bool = true) {
//            self.id = document.documentID
//            self.reference = document.reference
////            self.collectionIDs.forEach {
////                collections[$0] = Collection(reference: reference.collection($0))
////            }
//            if writeInitialData {
//                self.write(data: document.data())
//            }
//        }
//        
//        func get() {
//            reference.getDocument { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                self.snapshot = document
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//                self.write(data: data)
//            }
//        }
//        
//        func write(data: [String: Any]) {
//            self.model = try! JSONDecoder().decode(Model.self, from: data)
//        }
//        
//        func startListening() {
//            listener = reference
//                .addSnapshotListener { documentSnapshot, error in
//                    guard let document = documentSnapshot else {
//                        print("Error fetching document: \(error!)")
//                        return
//                    }
//                    self.snapshot = document
//                    guard let data = document.data() else {
//                        print("Document data was empty.")
//                        return
//                    }
//                    print("Current data: \(data)")
//                    self.write(data: data)
//            }
//        }
//        
//        func stopListening() {
//            listener?.remove()
//        }
//        
//        func updateModel() {
//            let data = try! JSONEncoder().encode(model)
//            let jsonObject = try! JSONSerialization.jsonObject(with: data, options: [])
//            if let fields = jsonObject as? [AnyHashable: Any] {
//                reference.updateData(fields) { err in
//                    if let err = err {
//                        print("Error updating document: \(err)")
//                    } else {
//                        print("Document successfully updated")
//                    }
//                }
//            }
//        }
//        
//        func updateData(_ fields: [AnyHashable: Any]) {
//            reference.updateData(fields) { err in
//                if let err = err {
//                    print("Error updating document: \(err)")
//                } else {
//                    print("Document successfully updated")
//                }
//            }
//        }
//        
//        func delete() {
//            reference.delete() { err in
//                if let err = err {
//                    print("Error removing document: \(err)")
//                } else {
//                    print("Document successfully removed!")
//                }
//            }
//        }
//    }
//}

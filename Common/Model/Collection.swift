//
//  Collection.swift
//  ioniCup iOS
//
//  Created by Lorenzo Fiamingo on 08/01/2020.
//

import Combine
import FirebaseFirestore
import Ballcap

extension DB {
    
    final class Collection<Document: Object & DataRepresentable & DataOrderable & DataListenable>: ObservableObject {
        
        @Published var source: DataSource<Document>
        
        @Published var documents: [Document] = []
        
        var collectionReference: CollectionReference
        
        init(reference: CollectionReference, option: DataSource<Document>.Option = .init()) {
            collectionReference = reference
            source = DataSource<Document>.Query(reference).order(by: "order").dataSource()
            source.onChanged { (_, snapshot) in
                self.documents = snapshot.after.sorted(by: { $0[\.order] < $1[\.order] })
                self.documents.forEach { $0.listen() }
            }.listen()
        }
    }
}

extension DB.Collection {
    
    func addDocument() {
        var model = Document.Model()
        model.setOrderFromOrderableArray(documents.map { $0.data! })
        let document = Document.init(documentReference: collectionReference.document(), from: model)
        document.save()
    }
    
    func moveDocuments(fromOffsets: IndexSet, toOffset: Int) {
        documents.move(fromOffsets: fromOffsets, toOffset: toOffset)
        let batch = Batch()
        for (index, document) in documents.enumerated() {
            document.data?.order = index
            batch.update(document)
        }
        batch.commit()
    }
    
    func deleteDocuments(indexSet: IndexSet) {
        let batch = Batch()
        for (index, document) in documents.enumerated() {
            document.data?.order = index
            if indexSet.contains(index) {
                batch.delete(document)
            }
        }
        batch.commit()
    }
}

protocol Orderable {
    
    var order: Int { get set }
}

extension Orderable {
    
    mutating func setOrderFromOrderableArray(_ array: [Orderable]) {
        if let last = array.last {
            order = last.order + 1
        } else {
            order = 0
        }
    }
}

protocol DataOrderable {
    
    associatedtype Model: Orderable
    
    var data: Model? { get set }
}

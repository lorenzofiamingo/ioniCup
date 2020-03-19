//
//  TeamDetailEditor.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 07/03/2020.
//

import SwiftUI
import AppKit
import Ballcap
import FirebaseStorage
import FirebaseFirestore
import CoreLocation

struct TeamDetailEditor: View {
    
    @ObservedObject var team: DB.Team.Document
    
    private let titleWidth: CGFloat = 100
    
    var body: some View {
        ScrollView {
            HStack {
                HStack {
                    Spacer()
                    Text("Logo:")
                }.frame(maxWidth: titleWidth)
                TeamLogoImage(url: team[\.logoURL])
                    .padding()
                    .frame(width: 150, height: 150)
                    .border(Color.black.opacity(0.1), width: 0.5)
                    .background(Color.black.opacity(0.10))
                    .onDrop(of: [(kUTTypeFileURL as String)], isTargeted: nil) { providers -> Bool in
                        let provider: NSItemProvider = providers.first!
                        provider.loadItem(forTypeIdentifier: (kUTTypeFileURL as String)) { (item, error) in
                            guard let d = item as? Data else { return }
                            guard let url = URL(dataRepresentation: d, relativeTo: nil) else { return }
                            guard let data = try? Data(contentsOf: url) else { return }
                            let file: File = File(self.team, name: "logo", data: data, mimeType: .custom("image/"+url.pathExtension, url.pathExtension))
                            self.team[\.logoURL] = "loading"
                            file.save { (metadata, error) in
                                guard let url = file.url else { return }
                                self.team[\.logoURL] = url.absoluteString
                                self.team.update()
                            }
                        }
                        return true
                }
                VStack {
                    Spacer()
                    Button("􀌗 Carica") {
                        ImageOpener.shared.show { url in
                            guard let data = try? Data(contentsOf: url) else { return }
                            let file: File = File(self.team, name: "logo", data: data, mimeType: .custom("image/"+url.pathExtension, url.pathExtension))
                            self.team[\.logoURL] = "loading"
                            file.save { (metadata, error) in
                                guard let url = file.url else { return }
                                self.team[\.logoURL] = url.absoluteString
                                self.team.update()
                            }
                        }
                    }
                }
                Spacer()
            }
            HStack {
                HStack {
                    Spacer()
                    Text("Colore:")
                }.frame(maxWidth: titleWidth)
                Rectangle()
                    .frame(width: 150, height: 20)
                    .border(Color.black.opacity(0.1), width: 0.5)
                    .background(Color.black.opacity(0.10))
                    .foregroundColor(self.team[\.color].color)
                    .onLongPressGesture(perform: self.team.showColorPanel)
                Button("Modifica", action: self.team.showColorPanel)
                Spacer()
            }
            HStack {
                HStack {
                    Spacer()
                    Text("Nome:")
                }.frame(maxWidth: titleWidth)
                TextField("Nome", text: $team[\.name]) { self.team.update() }
                Spacer()
            }
            HStack {
                HStack {
                    Spacer()
                    Text("Nome breve:")
                }.frame(maxWidth: titleWidth)
                TextField("Nome breve", text: $team[\.shortName]) { self.team.update() }
                Spacer()
            }
            HStack {
                HStack {
                    Spacer()
                    Text("Città:")
                }.frame(maxWidth: titleWidth)
                TextField("Città", text: $team[\.city].name) {
                    self.getCoordinate(addressString: self.team[\.city].name) { (coordinate, error) in
                        self.team[\.city].coordinate = GeoPoint(latitude: coordinate.latitude,
                                                                longitude: coordinate.longitude)
                        self.team.update()
                    }
                }
                Spacer()
            }
            Divider().padding(.vertical)
            //                Section(header: Text("Giocatori"), footer: Button("Aggiungi giocatore", action: team.addPlayer)) {
            HStack(alignment: .top) {
                HStack {
                    Spacer()
                    Text("Giocatori:").padding(.top, 2.5)
                }.frame(maxWidth: titleWidth)
                VStack {
                    ForEach(team[\.players].enumeratedArray(), id: \.offset) { (idx, player) in
                        HStack {
                            TextField("Nome", text: self.$team[\.players][idx].name) { self.team.update() }
                            TextField("Cognome", text: self.$team[\.players][idx].surname) { self.team.update() }
                            HStack {
                                TextField("Numero", text: self.$team[\.players][idx].number) { self.team.update() }
                                Button("􀆄") {
                                    self.team[\.players].remove(at: idx)
                                    self.team.update()
                                }
                            }
                        }
                    }
                    HStack {
                        Button("Aggiungi", action: team.addPlayer)
                        Spacer()
                    }
                }
                Spacer()
            }
            //                }
            Divider().padding(.vertical)
            HStack(alignment: .top) {
                HStack {
                    Spacer()
                    Text("Istruttori:")
                }.frame(maxWidth: titleWidth)
                VStack {
                    ForEach(team[\.coaches].enumeratedArray(), id: \.offset) { (idx, player) in
                        HStack {
                            TextField("Nome", text: self.$team[\.coaches][idx].name) { self.team.update() }
                            TextField("Cognome", text: self.$team[\.coaches][idx].surname) { self.team.update() }
                            HStack {
                                Button("􀆄") {
                                    self.team[\.coaches].remove(at: idx)
                                    self.team.update()
                                }
                            }
                        }
                    }
                    HStack {
                        Button("Aggiungi", action: team.addCoach)
                        Spacer()
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

extension Collection {
    func enumeratedArray() -> Array<(offset: Int, element: Self.Element)> {
        return Array(self.enumerated())
    }
}

extension TeamDetailEditor {
    
    func getCoordinate( addressString : String,
                        completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                    
                    completionHandler(location.coordinate, nil)
                    return
                }
            }
            
            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
}

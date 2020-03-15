//
//  AttachmentDetail.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 08/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct AttachmentDetail: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Regolamento Ionicup Arena")
                .font(.system(.headline, design: .rounded))
                .padding()
            Divider()
            ScrollView {
                    Text("""
1. Osservanza della disciplina sportiva
I tesserati, gli affiliati e gli altri soggetti dell'ordinamento sportivo sono obbligati all'osservanza delle norme statutarie, regolamentari e sulla giustizia, nonché delle altre misure e decisioni adottate dal CONI e dall'Ente di appartenenza, ivi compreso il presente Codice. Essi sono tenuti ad adire previamente agli strumenti di tutela previsti dai rispettivi ordinamenti.
Gli organi competenti adottano le misure dirette a facilitare la conoscenza e il rispetto della normativa vigente.
Le società, le associazioni e gli altri Enti dell'ordinamento sportivo rispondono dei comportamenti adottati in funzione dei loro interessi, da parte dei propri tesserati, dirigenti o soci e devono adottare codici organizzativi idonei alla prevenzione degli illeciti.
3
2. Principio di lealtà
I tesserati, gli affiliati e gli altri soggetti dell'ordinamento sportivo devono comportarsi secondo i principi di lealtà e correttezza in ogni funzione, prestazione o rapporto comunque riferibile all'attività sportiva. I tesserati e gli altri soggetti dell'ordinamento sportivo cooperano attivamente alla ordinata e civile convivenza sportiva.
3. Divieto di alterazione dei risultati sportivi
E' fatto divieto ai tesserati, gli affiliati e gli altri soggetti dell'ordinamento sportivo di compiere, con qualsiasi mezzo, atti diretti ad alterare artificiosamente lo svolgimento o il risultato di una gara ovvero ad assicurare a chiunque un indebito vantaggio nelle competizioni sportive.
4. Divieto di doping e di altre forme di nocumento della salute
E' fatto divieto ai tesserati, gli affiliati e agli altri soggetti dell'ordinamento sportivo di tenere comportamenti comunque in violazione o in contrasto con la disciplina antidoping in vigore.
I tesserati, gli affiliati e gli altri soggetti dell'ordinamento sportivo devono astenersi da qualsiasi altra condotta atta a recare pregiudizio alla salute dell'atleta.
5. Principio di non violenza
I tesserati, gli affiliati e gli altri soggetti dell'ordinamento sportivo non devono adottare comportamenti o rilasciare dichiarazioni che in qualunque modo determinino o incitino alla violenza o ne costituiscano apologia.
I tesserati, gli affiliati e gli altri soggetti dell'ordinamento sportivo devono astenersi da qualsiasi condotta suscettibile di ledere l'integrità fisica e morale dell'avversario nelle gare e nelle competizioni sportive e adottano iniziative positive per sensibilizzare il pubblico delle manifestazioni sportive al rispetto degli atleti, delle squadre e dei relativi sostenitori.
6. Principio di non discriminazione
I tesserati, gli affiliati e gli altri soggetti dell'ordinamento sportivo devono astenersi da qualsiasi comportamento discriminatorio in relazione alla razza, all'origine etnica o territoriale, al sesso, all'età, alla religione, alle opinioni politiche e filosofiche.
""")
                .padding(.horizontal)
            }
        }
    }
}

struct AttachmentDetail_Previews: PreviewProvider {
    static var previews: some View {
        AttachmentDetail()
    }
}

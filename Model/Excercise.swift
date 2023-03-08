//
//  Excercise.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/3/22.
//

import Foundation

struct Excercise: Identifiable {
    var id: String?
    //let id = UUID()
    let name: String
    let video: String
    let description: String
    let duration: String
    let dificulty: String
    let datePublished: String
    let url: String
    
}

extension Excercise {
    static let dummyData: [Excercise] = [
        Excercise(id: "1",
                  name: "Superman Alternativ",
                  video: "www.urlcatrevideo.com",
                  description: "Utilizați mușchii spatelui inferior pentru a vă ridica pieptul de pe podea. Țineți gâtul și brațele aliniate cu coloana vertebrală. Fii foarte atent cu acest exercițiu. Nu ridicați în același timp pieptul și picioarele - acest lucru pune multă presiune pe discurile de pe spate. De asemenea, nu vă ridicați capul mai mult de 20 de centimetri.",
                  duration: "30",
                  dificulty: "medie",
                  datePublished: "2019-02-04",
                  url: "www.siteweb.com"),
        
        Excercise(id: "2",
                  name: "Serii Abdomene",
                  video: "www.urlcatrevideo.com",
                  description: "Utilizați mușchii spatelui inferior pentru a vă ridica pieptul de pe podea. Țineți gâtul și brațele aliniate cu coloana vertebrală. Fii foarte atent cu acest exercițiu. Nu ridicați în același timp pieptul și picioarele - acest lucru pune multă presiune pe discurile de pe spate. De asemenea, nu vă ridicați capul mai mult de 20 de centimetri.",
                  duration: "15",
                  dificulty: "usor",
                  datePublished: "2019-02-04",
                  url: "www.siteweb.com"),
        
        Excercise(id: "3",
                  name: "Genoflexiuni",
                  video: "www.urlcatrevideo.com",
                  description: "Utilizați mușchii spatelui inferior pentru a vă ridica pieptul de pe podea. Țineți gâtul și brațele aliniate cu coloana vertebrală. Fii foarte atent cu acest exercițiu. Nu ridicați în același timp pieptul și picioarele - acest lucru pune multă presiune pe discurile de pe spate. De asemenea, nu vă ridicați capul mai mult de 20 de centimetri.",
                  duration: "25",
                  dificulty: "medie",
                  datePublished: "2019-02-04",
                  url: "www.siteweb.com"),
        
        Excercise(id: "4",
                  name: "Fandari",
                  video: "www.urlcatrevideo.com",
                  description: "Utilizați mușchii spatelui inferior pentru a vă ridica pieptul de pe podea. Țineți gâtul și brațele aliniate cu coloana vertebrală. Fii foarte atent cu acest exercițiu. Nu ridicați în același timp pieptul și picioarele - acest lucru pune multă presiune pe discurile de pe spate. De asemenea, nu vă ridicați capul mai mult de 20 de centimetri.",
                  duration: "20",
                  dificulty: "medie",
                  datePublished: "2019-02-04",
                  url: "www.siteweb.com"),
        
        Excercise(id: "5",
                  name: "Flotari",
                  video: "www.urlcatrevideo.com",
                  description: "Utilizați mușchii spatelui inferior pentru a vă ridica pieptul de pe podea. Țineți gâtul și brațele aliniate cu coloana vertebrală. Fii foarte atent cu acest exercițiu. Nu ridicați în același timp pieptul și picioarele - acest lucru pune multă presiune pe discurile de pe spate. De asemenea, nu vă ridicați capul mai mult de 20 de centimetri.",
                  duration: "30",
                  dificulty: "greu",
                  datePublished: "2019-02-04",
                  url: "www.siteweb.com"),
        
        Excercise(id: "6",
                  name: "Tractiuni",
                  video: "www.urlcatrevideo.com",
                  description: "Utilizați mușchii spatelui inferior pentru a vă ridica pieptul de pe podea. Țineți gâtul și brațele aliniate cu coloana vertebrală. Fii foarte atent cu acest exercițiu. Nu ridicați în același timp pieptul și picioarele - acest lucru pune multă presiune pe discurile de pe spate. De asemenea, nu vă ridicați capul mai mult de 20 de centimetri.",
                  duration: "30",
                  dificulty: "greu",
                  datePublished: "2019-02-04",
                  url: "www.siteweb.com"),
    ]
}

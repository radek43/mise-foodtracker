//
//  Recipe.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/3/22.
//

import Foundation
import FirebaseFirestoreSwift

enum Category: String {
    case micDejun  = "Mic Dejun"
    case supa = "Supa"
    case salata = "Salata"
    case aperitiv = "Aperitiv"
    case felPrincipal = "Fel Principal"
    case felulDoi = "Felul doi"
    case desert = "Desert"
    case bauturi = "Bauturi"
}

struct Recipe: Identifiable, Decodable {
    @DocumentID var id: String?
    //let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    let datePublished: String
    let url: String
    
}

extension Recipe {
    static let all: [Recipe] = [
        
        Recipe(id: "1",
               name: "Chiftelute de ciuperci cu seminte de canepa",
               image: "https://gourmandelle.com/wp-content/uploads/2013/11/Chiftelute-cu-ciuperci-si-seminte-de-canepa-Protein-Rich-Mushroom-Hemp-Patties-with-Herbs-burger.jpg.webp",
               description: "Incearca reteta vegana de chiftelute de ciuperci cu seminte de canepa, foarte bogate in proteine si gata in doar jumatate de ora!",
               ingredients: "360g ciuperci, marunite \n5 Linguri de seminte de canepa \no legatura de marar, maruntit \no ceapa, maruntita \n2 lingurite de cimbru uscat \n2 Linguri in macinat + 3 Linguri apa \n4 Linguri fulgi de drojdie inactiva \n3-4 Linguri de pudra proteica de canepa, adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. \n4 Linguri vin alb, optional \n3 Linguri de ulei (pentru prajit/copt) + 1 Lingura de ulei (pentru sotat) sare si piper, dupa gust",
               directions: "Amesteca inul macinat cu apa si lasa-le intr-un bol mic pana se ingroasa - aprox. 5 minute. Incinge o lingura de ulei intr-o tigaie mai mare. Adauga ceapa si caleste-o. Adauga ciupercile maruntite, cimbrul uscat, vinul alb, sare si piper. Soteaza-le 10 minute si acopera-le cu un capac. Da tigaia la o parte de pe foc. Adauga ouale batute sau inul + drojdia inactiva si amesteca bine. Adauga marar maruntit, seminte de canepa si pudra proteica de canepa. Adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. Acum, sunt doua metode de a prepara chiftelutele de ciuperci. 1. Prin prajire usoara in f. putin ulei sau 2. Prin coacere. Am testat ambele metode si chiftelutele vor iesi bune indiferent de metoda utilizata. Prajirea usoara este insa ceva mai rapida.",
               category: "Main",
               datePublished: "2019-03-19",
               url:"https://gourmandelle.com/ro/chiftelute-de-ciuperci-canepa/"),
        Recipe(id: "2",
               name: "Chiftelute de ciuperci cu seminte de canepa",
               image: "https://gourmandelle.com/wp-content/uploads/2013/11/Chiftelute-cu-ciuperci-si-seminte-de-canepa-Protein-Rich-Mushroom-Hemp-Patties-with-Herbs-burger.jpg.webp",
               description: "Incearca reteta vegana de chiftelute de ciuperci cu seminte de canepa, foarte bogate in proteine si gata in doar jumatate de ora!",
               ingredients: "360g ciuperci, marunite \n5 Linguri de seminte de canepa \no legatura de marar, maruntit \no ceapa, maruntita \n2 lingurite de cimbru uscat \n2 Linguri in macinat + 3 Linguri apa \n4 Linguri fulgi de drojdie inactiva \n3-4 Linguri de pudra proteica de canepa, adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. \n4 Linguri vin alb, optional \n3 Linguri de ulei (pentru prajit/copt) + 1 Lingura de ulei (pentru sotat) sare si piper, dupa gust",
               directions: "Amesteca inul macinat cu apa si lasa-le intr-un bol mic pana se ingroasa - aprox. 5 minute. Incinge o lingura de ulei intr-o tigaie mai mare. Adauga ceapa si caleste-o. Adauga ciupercile maruntite, cimbrul uscat, vinul alb, sare si piper. Soteaza-le 10 minute si acopera-le cu un capac. Da tigaia la o parte de pe foc. Adauga ouale batute sau inul + drojdia inactiva si amesteca bine. Adauga marar maruntit, seminte de canepa si pudra proteica de canepa. Adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. Acum, sunt doua metode de a prepara chiftelutele de ciuperci. 1. Prin prajire usoara in f. putin ulei sau 2. Prin coacere. Am testat ambele metode si chiftelutele vor iesi bune indiferent de metoda utilizata. Prajirea usoara este insa ceva mai rapida.",
               category: "Main",
               datePublished: "2019-03-19",
               url:"https://gourmandelle.com/ro/chiftelute-de-ciuperci-canepa/"),
        Recipe(id: "3",
               name: "Chiftelute de ciuperci cu seminte de canepa",
               image: "https://gourmandelle.com/wp-content/uploads/2013/11/Chiftelute-cu-ciuperci-si-seminte-de-canepa-Protein-Rich-Mushroom-Hemp-Patties-with-Herbs-burger.jpg.webp",
               description: "Incearca reteta vegana de chiftelute de ciuperci cu seminte de canepa, foarte bogate in proteine si gata in doar jumatate de ora!",
               ingredients: "360g ciuperci, marunite \n5 Linguri de seminte de canepa \no legatura de marar, maruntit \no ceapa, maruntita \n2 lingurite de cimbru uscat \n2 Linguri in macinat + 3 Linguri apa \n4 Linguri fulgi de drojdie inactiva \n3-4 Linguri de pudra proteica de canepa, adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. \n4 Linguri vin alb, optional \n3 Linguri de ulei (pentru prajit/copt) + 1 Lingura de ulei (pentru sotat) sare si piper, dupa gust",
               directions: "Amesteca inul macinat cu apa si lasa-le intr-un bol mic pana se ingroasa - aprox. 5 minute. Incinge o lingura de ulei intr-o tigaie mai mare. Adauga ceapa si caleste-o. Adauga ciupercile maruntite, cimbrul uscat, vinul alb, sare si piper. Soteaza-le 10 minute si acopera-le cu un capac. Da tigaia la o parte de pe foc. Adauga ouale batute sau inul + drojdia inactiva si amesteca bine. Adauga marar maruntit, seminte de canepa si pudra proteica de canepa. Adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. Acum, sunt doua metode de a prepara chiftelutele de ciuperci. 1. Prin prajire usoara in f. putin ulei sau 2. Prin coacere. Am testat ambele metode si chiftelutele vor iesi bune indiferent de metoda utilizata. Prajirea usoara este insa ceva mai rapida.",
               category: "Main",
               datePublished: "2019-03-19",
               url:"https://gourmandelle.com/ro/chiftelute-de-ciuperci-canepa/"),
        Recipe(id: "4",
               name: "Chiftelute de ciuperci cu seminte de canepa",
               image: "https://gourmandelle.com/wp-content/uploads/2013/11/Chiftelute-cu-ciuperci-si-seminte-de-canepa-Protein-Rich-Mushroom-Hemp-Patties-with-Herbs-burger.jpg.webp",
               description: "Incearca reteta vegana de chiftelute de ciuperci cu seminte de canepa, foarte bogate in proteine si gata in doar jumatate de ora!",
               ingredients: "360g ciuperci, marunite \n5 Linguri de seminte de canepa \no legatura de marar, maruntit \no ceapa, maruntita \n2 lingurite de cimbru uscat \n2 Linguri in macinat + 3 Linguri apa \n4 Linguri fulgi de drojdie inactiva \n3-4 Linguri de pudra proteica de canepa, adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. \n4 Linguri vin alb, optional \n3 Linguri de ulei (pentru prajit/copt) + 1 Lingura de ulei (pentru sotat) sare si piper, dupa gust",
               directions: "Amesteca inul macinat cu apa si lasa-le intr-un bol mic pana se ingroasa - aprox. 5 minute. Incinge o lingura de ulei intr-o tigaie mai mare. Adauga ceapa si caleste-o. Adauga ciupercile maruntite, cimbrul uscat, vinul alb, sare si piper. Soteaza-le 10 minute si acopera-le cu un capac. Da tigaia la o parte de pe foc. Adauga ouale batute sau inul + drojdia inactiva si amesteca bine. Adauga marar maruntit, seminte de canepa si pudra proteica de canepa. Adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. Acum, sunt doua metode de a prepara chiftelutele de ciuperci. 1. Prin prajire usoara in f. putin ulei sau 2. Prin coacere. Am testat ambele metode si chiftelutele vor iesi bune indiferent de metoda utilizata. Prajirea usoara este insa ceva mai rapida.",
               category: "Main",
               datePublished: "2019-03-19",
               url:"https://gourmandelle.com/ro/chiftelute-de-ciuperci-canepa/"),
        Recipe(id: "5",
               name: "Chiftelute de ciuperci cu seminte de canepa",
               image: "https://gourmandelle.com/wp-content/uploads/2013/11/Chiftelute-cu-ciuperci-si-seminte-de-canepa-Protein-Rich-Mushroom-Hemp-Patties-with-Herbs-burger.jpg.webp",
               description: "Incearca reteta vegana de chiftelute de ciuperci cu seminte de canepa, foarte bogate in proteine si gata in doar jumatate de ora!",
               ingredients: "360g ciuperci, marunite \n5 Linguri de seminte de canepa \no legatura de marar, maruntit \no ceapa, maruntita \n2 lingurite de cimbru uscat \n2 Linguri in macinat + 3 Linguri apa \n4 Linguri fulgi de drojdie inactiva \n3-4 Linguri de pudra proteica de canepa, adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. \n4 Linguri vin alb, optional \n3 Linguri de ulei (pentru prajit/copt) + 1 Lingura de ulei (pentru sotat) sare si piper, dupa gust",
               directions: "Amesteca inul macinat cu apa si lasa-le intr-un bol mic pana se ingroasa - aprox. 5 minute. Incinge o lingura de ulei intr-o tigaie mai mare. Adauga ceapa si caleste-o. Adauga ciupercile maruntite, cimbrul uscat, vinul alb, sare si piper. Soteaza-le 10 minute si acopera-le cu un capac. Da tigaia la o parte de pe foc. Adauga ouale batute sau inul + drojdia inactiva si amesteca bine. Adauga marar maruntit, seminte de canepa si pudra proteica de canepa. Adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. Acum, sunt doua metode de a prepara chiftelutele de ciuperci. 1. Prin prajire usoara in f. putin ulei sau 2. Prin coacere. Am testat ambele metode si chiftelutele vor iesi bune indiferent de metoda utilizata. Prajirea usoara este insa ceva mai rapida.",
               category: "Main",
               datePublished: "2019-03-19",
               url:"https://gourmandelle.com/ro/chiftelute-de-ciuperci-canepa/"),
        Recipe(id: "6",
               name: "Chiftelute de ciuperci cu seminte de canepa",
               image: "https://gourmandelle.com/wp-content/uploads/2013/11/Chiftelute-cu-ciuperci-si-seminte-de-canepa-Protein-Rich-Mushroom-Hemp-Patties-with-Herbs-burger.jpg.webp",
               description: "Incearca reteta vegana de chiftelute de ciuperci cu seminte de canepa, foarte bogate in proteine si gata in doar jumatate de ora!",
               ingredients: "360g ciuperci, marunite \n5 Linguri de seminte de canepa \no legatura de marar, maruntit \no ceapa, maruntita \n2 lingurite de cimbru uscat \n2 Linguri in macinat + 3 Linguri apa \n4 Linguri fulgi de drojdie inactiva \n3-4 Linguri de pudra proteica de canepa, adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. \n4 Linguri vin alb, optional \n3 Linguri de ulei (pentru prajit/copt) + 1 Lingura de ulei (pentru sotat) sare si piper, dupa gust",
               directions: "Amesteca inul macinat cu apa si lasa-le intr-un bol mic pana se ingroasa - aprox. 5 minute. Incinge o lingura de ulei intr-o tigaie mai mare. Adauga ceapa si caleste-o. Adauga ciupercile maruntite, cimbrul uscat, vinul alb, sare si piper. Soteaza-le 10 minute si acopera-le cu un capac. Da tigaia la o parte de pe foc. Adauga ouale batute sau inul + drojdia inactiva si amesteca bine. Adauga marar maruntit, seminte de canepa si pudra proteica de canepa. Adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. Acum, sunt doua metode de a prepara chiftelutele de ciuperci. 1. Prin prajire usoara in f. putin ulei sau 2. Prin coacere. Am testat ambele metode si chiftelutele vor iesi bune indiferent de metoda utilizata. Prajirea usoara este insa ceva mai rapida.",
               category: "Main",
               datePublished: "2019-03-19",
               url:"https://gourmandelle.com/ro/chiftelute-de-ciuperci-canepa/"),
        Recipe(id: "7",
               name: "Chiftelute de ciuperci cu seminte de canepa",
               image: "https://gourmandelle.com/wp-content/uploads/2013/11/Chiftelute-cu-ciuperci-si-seminte-de-canepa-Protein-Rich-Mushroom-Hemp-Patties-with-Herbs-burger.jpg.webp",
               description: "Incearca reteta vegana de chiftelute de ciuperci cu seminte de canepa, foarte bogate in proteine si gata in doar jumatate de ora!",
               ingredients: "360g ciuperci, marunite \n5 Linguri de seminte de canepa \no legatura de marar, maruntit \no ceapa, maruntita \n2 lingurite de cimbru uscat \n2 Linguri in macinat + 3 Linguri apa \n4 Linguri fulgi de drojdie inactiva \n3-4 Linguri de pudra proteica de canepa, adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. \n4 Linguri vin alb, optional \n3 Linguri de ulei (pentru prajit/copt) + 1 Lingura de ulei (pentru sotat) sare si piper, dupa gust",
               directions: "Amesteca inul macinat cu apa si lasa-le intr-un bol mic pana se ingroasa - aprox. 5 minute. Incinge o lingura de ulei intr-o tigaie mai mare. Adauga ceapa si caleste-o. Adauga ciupercile maruntite, cimbrul uscat, vinul alb, sare si piper. Soteaza-le 10 minute si acopera-le cu un capac. Da tigaia la o parte de pe foc. Adauga ouale batute sau inul + drojdia inactiva si amesteca bine. Adauga marar maruntit, seminte de canepa si pudra proteica de canepa. Adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. Acum, sunt doua metode de a prepara chiftelutele de ciuperci. 1. Prin prajire usoara in f. putin ulei sau 2. Prin coacere. Am testat ambele metode si chiftelutele vor iesi bune indiferent de metoda utilizata. Prajirea usoara este insa ceva mai rapida.",
               category: "Main",
               datePublished: "2019-03-19",
               url:"https://gourmandelle.com/ro/chiftelute-de-ciuperci-canepa/"),
        Recipe(id: "8",
               name: "Chiftelute de ciuperci cu seminte de canepa",
               image: "https://gourmandelle.com/wp-content/uploads/2013/11/Chiftelute-cu-ciuperci-si-seminte-de-canepa-Protein-Rich-Mushroom-Hemp-Patties-with-Herbs-burger.jpg.webp",
               description: "Incearca reteta vegana de chiftelute de ciuperci cu seminte de canepa, foarte bogate in proteine si gata in doar jumatate de ora!",
               ingredients: "360g ciuperci, marunite \n5 Linguri de seminte de canepa \no legatura de marar, maruntit \no ceapa, maruntita \n2 lingurite de cimbru uscat \n2 Linguri in macinat + 3 Linguri apa \n4 Linguri fulgi de drojdie inactiva \n3-4 Linguri de pudra proteica de canepa, adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. \n4 Linguri vin alb, optional \n3 Linguri de ulei (pentru prajit/copt) + 1 Lingura de ulei (pentru sotat) sare si piper, dupa gust",
               directions: "Amesteca inul macinat cu apa si lasa-le intr-un bol mic pana se ingroasa - aprox. 5 minute. Incinge o lingura de ulei intr-o tigaie mai mare. Adauga ceapa si caleste-o. Adauga ciupercile maruntite, cimbrul uscat, vinul alb, sare si piper. Soteaza-le 10 minute si acopera-le cu un capac. Da tigaia la o parte de pe foc. Adauga ouale batute sau inul + drojdia inactiva si amesteca bine. Adauga marar maruntit, seminte de canepa si pudra proteica de canepa. Adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. Acum, sunt doua metode de a prepara chiftelutele de ciuperci. 1. Prin prajire usoara in f. putin ulei sau 2. Prin coacere. Am testat ambele metode si chiftelutele vor iesi bune indiferent de metoda utilizata. Prajirea usoara este insa ceva mai rapida.",
               category: "Main",
               datePublished: "2019-03-19",
               url:"https://gourmandelle.com/ro/chiftelute-de-ciuperci-canepa/")
    ]
}


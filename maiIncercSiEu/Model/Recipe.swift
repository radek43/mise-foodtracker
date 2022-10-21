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
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    
}

extension Recipe {
    static let dummyData: [Recipe] = [

        Recipe(id: "1",
               name: "Chiftelute de ciuperci cu seminte de canepa",
               image: "https://gourmandelle.com/wp-content/uploads/2013/11/Chiftelute-cu-ciuperci-si-seminte-de-canepa-Protein-Rich-Mushroom-Hemp-Patties-with-Herbs-burger.jpg.webp",
               description: "Incearca reteta vegana de chiftelute de ciuperci cu seminte de canepa, foarte bogate in proteine si gata in doar jumatate de ora!",
               ingredients: "360g ciuperci, marunite \n5 Linguri de seminte de canepa \no legatura de marar, maruntit \no ceapa, maruntita \n2 lingurite de cimbru uscat \n2 Linguri in macinat + 3 Linguri apa \n4 Linguri fulgi de drojdie inactiva \n3-4 Linguri de pudra proteica de canepa, adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. \n4 Linguri vin alb, optional \n3 Linguri de ulei (pentru prajit/copt) + 1 Lingura de ulei (pentru sotat) sare si piper, dupa gust",
               directions: "Amesteca inul macinat cu apa si lasa-le intr-un bol mic pana se ingroasa - aprox. 5 minute. Incinge o lingura de ulei intr-o tigaie mai mare. Adauga ceapa si caleste-o. Adauga ciupercile maruntite, cimbrul uscat, vinul alb, sare si piper. Soteaza-le 10 minute si acopera-le cu un capac. Da tigaia la o parte de pe foc. Adauga ouale batute sau inul + drojdia inactiva si amesteca bine. Adauga marar maruntit, seminte de canepa si pudra proteica de canepa. Adauga doar 3 linguri la inceput. Daca amestecul este inca prea umed, mai adauga cate o lingura pana ajunge la consistenta optima si se pot asambla usor chiftelutele. Acum, sunt doua metode de a prepara chiftelutele de ciuperci. 1. Prin prajire usoara in f. putin ulei sau 2. Prin coacere. Am testat ambele metode si chiftelutele vor iesi bune indiferent de metoda utilizata. Prajirea usoara este insa ceva mai rapida.",
               category: "Main"),

        Recipe(id: "2",
               name: "Terci de ovăz copt, cu unt de susan și mere",
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/rice-porridge-with-nuts-honey.jpg",
               description: "Această rețetă este o opțiune grozavă pentru un mic dejun ușor, care oferă fibre solubile din ovăz și mere, precum și proteine și grăsimi nesaturate sănătoase din untul de susan (în comerț se găsește sub numele de tahini). Este un mic dejun extraordinar pe care îl poți prepara dinainte și consuma toată săptămâna; este foarte bun reîncălzit. De asemenea, poții înlocui cu orice tip de unt de nuci, lapte vegetal, pere sau piersici la conservă.",
               ingredients: "• 2 căni de fulgi ovăz integral \n• ¼ cană de zahăr brun sau brut \n• 1 linguriță de scorțișoară \n• 1 linguriță de praf de copt \n• ½ linguriță de sare himalayană \n• 1¾ cană de lapte integral \n• 3 linguri de unt topit, răcit \n• 1 linguriță de extract de vanilie (sau vanilie pudră) \n• 1 ou mare • ½ cană de unt de susan \n• 2 mere decojite și date pe răzătoare",
               directions: "• Preîncălzește cuptorul la 170 °C \n• Unge un vas de yena dreptunghiular \n• Într-un vas separat, amestecă ingredientele uscate (ovăzul, scorțișoara, zahărul brun, \n• praful de copt și sarea) \n• Într-un alt vas, amestecă laptele, ouăle, untul topit și esența de vanilie (sau pudra de vanilie) \n• Combină cele două amestecuri într-un singur vas \n• Adăugă merele răzuite și untul de susan \n• Toarnă terciul de ovăz în vasul de copt pregătit \n• Coace compoziția timp de 45 de minute, până devine maro deschis deasupra",
               category: "Mic Dejun"),

        Recipe(id: "3",
               name: "Mâncare de pui și linte rosie",
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/salad-with-red-lentils-spinach-leaves-cherry-tomatoes-chicken-meat-mozzarella-cheese-ceramic-plate-old-concrete-gray-surface-1.jpg",
               description: "Friptura este o opțiune potrivită pentru prânz sau cină. Puiul și lintea rosie asigură o doză adecvată de proteină, iar legumele oferă antioxidanți și fibre. Această mâncare este foarte adaptabilă; poți alege carne tocată sau orice fel de legume ai în frigider. O poți prepara și în stil vegetarian, înlocuind supa de pui și puiul cu supă de legume, tofu și orez integral.",
               ingredients: "• 3 linguri de ulei de măsline extravirgin \n• 0,5 kg de pulpe de pui fără os, fără piele*, tăiate cuburi \n• 1 ceapă, tocată \n• 1½ căni de morcovi, felii subțiri \n• 1 țelină, tăiată cuburi \n• ½ căni de fasole verde proaspătă sau congelată \n• 1 dovlecel mediu tocat \n• 4 căni de supă de pui \n• 1 cană de linte rosie \n• 1 lingură de condimente italienești (rozmarin, coriandru, oregano) \n• linguriță de sare himalayană \n• ¼ linguriță de piper negru *Poți opta pentru piept de pui dacă dorești o variantă mai ușoară sau pulpe de pui cu piele pentru mai multe calorii, pentru a îți menține greutatea. De asemenea, poți opta pentru carne tocată de pui sau curcan, pentru a mesteca mai ușor",
               directions: "• Încălzește uleiul într-un vas mare de fontă sau inox la foc mediu-mare \n• Adăugă cuburile de pui, puțină apă și gătește timp de 5 minute \n• Adăugă cepele și morcovii și gătiți până când puiul este gata și legumele sunt moi \n• Adăugă fasolea verde, zucchini și supa de pui. Adăugă condimentele și dă totul în clocot \n• Când fierbe, adaugă lintea rosie. Adu la foc mic și acoperă. Lasă pe foc 15-20 minute, până când lintea este gătită",
               category: "Cina"),

        Recipe(id: "4",
               name: "Smoothie cu unt de arahide și mango",
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/lassi-drink-is-smoothies-milkshake-light-background-traditional-indian-pakistan-drink-with.jpg",
               description: "Acest smoothie este o combinație delicioasă de fructe, legume și unt de arahide. Banana este o sursă bogată de potasiu, iar mango este o sursă bună de carotenoizi și vitamina C. Semințele de in adaugă fibre suplimentare, iar turmericul oferă un plus de antioxidanți. Acest smoothie oferă, de asemenea, o doză sănătoasă de proteine, datorită untului de arahide, a inului și iaurtului. Lactatele pot fi înlocuite cu orice iaurt fără lapte vegetal (cocos, soia, quinoa sau migdale).",
               ingredients: "• 2 curmale uscate, fără sămburi și tăiate \n• 100ml iaurt \n• ½ banană \n• 2 nuci mărunțite",
               directions: "• Amestecă curmalele cu iaurtul. Acoperă totul și lasă peste noapte in frigider ca să se înmoaie curmalele \n• Curăță banana, taie-o rondele și adaugă-o în amestecul de iaurt și curmale \n• Presară nucă pe deasupra",
               category: "Smoothie"),

        Recipe(id: "5",
               name: "Sufleu de cartofi, curry și pătrunjel",
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/baked-potatoes-with-turkey-meat-potato-casserole-closeup-wooden-table.jpg",
               description: "Acest fel de mâncare pe bază de ouă, ușor de mestecat, este foarte bogat în proteine și legume, perfect pentru micul dejun, brunch și chiar o cină ușoară. Cartofii au un conținut bogat de flavonoizi, vitamina B6 și potasiu, iar pătrunjelul este bogat în Vitamina A, Vitamina C și acid folic. Ouăle, brânza de vaci și brânza opțională oferă acestui fel principal o doză sănătoasă de proteină, esențială pentru vindecare și forță pe durata tratamentului. Acest sufleu poate fi consumat direct scos din cuptor și este chiar mai bun după o zi sau două.",
               ingredients: "• 2 linguri de ulei de măsline extravirgin \n• ¼ cană de ceapă mărunțită \n• 1 cartof mediu decojit și tăiat cuburi \n• 1½ cană de pătrunjel \n• 8 ouă mari \n• ½ cană de brânză de vaci 4% \n• ½ linguriță de sare himalayană \n• ¼ linguriță de piper negru \n• 1 linguriță de curry ¾ cană de telemea de capra sub 25% grasimi (opțional)",
               directions: "• Preîncălzește cuptorul la 170 °C \n• Folosind o tigaie de fontă sau tigaie ceramică, încălzește uleiul la foc mic. \n• Adăugă ceapa, puțină apă și țineți-o pe foc până devine translucidă, cam 5 minute. \n• Adăugă cuburile de cartofi, acoperă și lăsă la abur 10-12 minute până se gătesc. Amestecă ocazional. \n• În timp ce cartofii sunt pe foc, amestecă ouăle, brânza de vaci, sarea, piperul și curry într-un vas separat. \n• Când cartofii sunt gata, adăugă pătrunjelul în tigaie și lăsă să se gătească la abur până se înmoaie, aproximativ 5 minute \n• Adăugă amestecul cu ou în tigaie de ceramică și amestecați pentru a asigura distribuirea legumelor \n• Lăsă pe aragaz, la foc mediu până când se coc marginile, 4-6 minute \n• Dacă adăugi brânză, presără deasupra amestecului cu ou \n• Transferă în cuptorul preîncălzit in vas de yena și coace până când ouăle sunt gătite, iar partea superioară devine maronie, aproximativ 14-16 minute.",
               category: "Main"),

        Recipe(id: "6",
               name: "Brioșe cu macaroane și brânză",
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/Baked-Mac-and-Cheese-Muffins-with-Marinara-Sauce-2.jpg",
               description: "Aceste brioșe abundă de calorii și oferă un mod unic de a te răsfăța cu un clasic reconfortant. Pe lângă faptul că sunt moi, însiropate și ușor de mestecat, acestea se și pot prepara într-o porție gestionabilă. Brioșele se pot prepara dinainte și pot fi congelate. Poți alterna legumele și să folosești broccoli, spanac, fasole sau cartof ca alternative la ingredientele vegetale sănătoase. Pot fi servite ca fel principal sau garnitură. Dacă vrei să preparați brioșe foarte mari, folosește o tavă mare în care încap șase brioșe.",
               ingredients: "\n• 2230 g paste (paste din faină integrală de grau de dimensiuni mici gen melcișori sau fundițe) \n• 1 cană de ciuperci tăiate cuburi \n• 1 cana de morcovi și țelină \n• 1/4 pachet de unt nesărat \n• 1/4 cană de făină integrală \n• 1 cană de lapte integral \n• 1 cană de cascaval ras \n• 1 cană de mozzarella rasă • Pui sau porc dat pe răzătoare (opțional)",
               directions: "• Preîncălzește cuptorul la 190 °C \n• Tapetează tava de brioșe cu forme de copt și pulverizează fiecare formă cu spray de gătit antiaderent \n• Gătește pastele conform instrucțiunilor de pe pachet, al dente sau mai moi dacă este nevoie în caz de dificultate la mestecat sau înghițire \n• Sotează ciupercile într-un cubuleț de unt la foc mic aproximativ 7 minute \n• Fierbe țelina și morcovii până se înmoaie \n• Scurge rădăcinoasele și pasează-le la blenderul vertical împreună cu ciupercile \n• Topește restul de unt în tigaie, la foc mic \n• Presără făină, amestecând constant pentru a forma un sos omogen (amestecul trebuie să devină maroniu deschis), aproximativ 3-5 minute \n• Adaugă lent lapte și amestecă puternic până când obții un sos gros (sos béchamel), aproximativ 1-2 minute \n• Amestecă sosul cu piureul de legume și cu ¾ cană din fiecare tip de brânză (păstrează restul pentru deasupra) \n• Amestecă pastele gătite și carnea tocată opțională \n• Așază amestecul cu lingura în forme, presărând pe fiecare brânză rămasă \n• Coace brioșele la mijlocul cuptorului până devin maronii și se umflă, aproximativ 15-20 de minute \n• Lasă 5 minute să se răcească înainte de a servi",
               category: "Main"),

        Recipe(id: "7",
               name: "Salată cu avocado și ou",
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/healthy-green-vegetarian-buddha-bowl-lunch-with-eggs-rice-tomato-avocado-blue-cheese-table.jpg",
               description: "Salata cu ou este un fel de mâncare versatil pentru cei care au nevoie de o variantă cu aport caloric ridicat, ușor de mestecat și înghițit. Ouăle sunt o sursă bună de proteină de înaltă calitate, iar avocado oferă un aport de grăsime monosaturată benefică pentru inimă și pentru reducerea inflamației din corp. Această salată poate fi consumată singură sau alături de un sandviș, wrap, crackerși integrali sau crudități.",
               ingredients: "• 6 ouă, fierte tari și tocate \n• 3 avocado, tăiate pe jumătate, fără sâmburi \n• 2 linguri de iaurt grecesc gras \n• 1 linguriță de suc de lămâie \n• 2 lingurițe de mărar proaspăt \n• ½ linguriță de sare himalayană",
               directions: "• Adăugă toate ingredientele într-un vas și zdrobește-le ușor cu o furculiță \n• Servește cu pâine, crackerși integrai, salată sau orez brun",
               category: "Main"),

        Recipe(id: "8",
               name: "Smoothie cu cheesecake cu căpșuni",
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/strawberry-smoothie-with-basil-table.jpg",
               description: "Acest smoothie delicios este o modalitate sănătoasă de a te răsfăța cu un preparat foarte nutritiv. Brânza dulce de vaci și laptele sunt surse bogate de proteine și calciu. Brânza de vaci poate fi înlocuită cu iaurt sau varianta sa fără lactoza sau cu iaurt vegetal (cum ar fi cele de cocos sau soia). Pentru un plus caloric, folosește smântână dulce, iar pentru un plus de proteine, adăugă lapte praf degresat sau pulbere de proteină, în funcție de recomandările primite de la medicul nutriționist.",
               ingredients: "• 1 cană de căpșuni congelate \n• ¼ cană de brânză de vaci din lapte integral \n• ½ cană de lapte integral \n• 4 biscuiți digestivi din ovăz mărunțiți (30 de grame) \n• 1 linguriță de miere sau xilitol din mesteacăn (varianta pentru cei cu surplus corporal sau pentru cei cu diabet zaharat)",
               directions: "• Adăugă toate ingredientele într-un blender \n• Amestecă până se omogenizează",
               category: "Main")
    ]
}


//
//  PreviewData.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 29.03.2023.
//

import Foundation

var userPreviewData = User(fullname: "John Doe", name: "john.doe", email: "john.doe@email.com", is_staff: true)

var recipePreviewData: [RecipeList] = [
    RecipeList(id: 1,
           title: "Oua umplute",
           calories: "803.33",
           image: "https://fit2life.ro/uploads/retete/oua-umplute-_0_1679162396.jpg"),
    RecipeList(id: 2,
           title: "Smoothie cu cheesecake cu căpșuni",
           calories: "433",
           image: "https://onco-plan.ro/wp-content/uploads/2021/07/strawberry-smoothie-with-basil-table.jpg"),
    RecipeList(id: 3,
           title: "Mâncare de pui și linte rosie",
           calories: "388",
           image: "https://onco-plan.ro/wp-content/uploads/2021/07/salad-with-red-lentils-spinach-leaves-cherry-tomatoes-chicken-meat-mozzarella-cheese-ceramic-plate-old-concrete-gray-surface-1.jpg"),
    RecipeList(id: 4,
           title: "Supă cremă de sparanghel",
           calories: "295",
           image: "https://onco-plan.ro/wp-content/uploads/2021/07/asparagus-spinach-soup.jpg")
]

var recipeDetailPreviewData: Recipe = 
    Recipe(id: 4,
           title: "Supă cremă de sparanghel",
           calories: "295",
           category: "Mancaruri",
           time_minutes: 35,
           protein: "12",
           carbs: "42",
           fibers: "7.5",
           fat: "11",
           description: "• Lasă sparanghelul la aburi 20 de minute sau până când este moale când îl încerci cu furculița \n• Toacă ceapa \n• Încălzește uleiul de măsline într-o tigaie mare, adaugă puțină apă și sotează ceapa până devine translucidă, aproximativ 2-3 minute \n• Redu focul la mediu și adăugați fasolea, sarea, piperul și cimbrul și lăsă pe foc încă 5 minute \n• Adăugă sparanghelul gătit la aburi; când devine moale, adăugă supa de pui și fierbe la foc mic timp de 10 minute. \n• Ia supa gătită de pe foc și pune în vas. Folosește blenderul vertical pentru a transforma supa în piure. Ai grijă însă; supa este fierbinte. \n• Adăugă smântâna dulce și pune la loc pe foc mic, timp de încă 5 minute \n• Lăsă să se răcească înainte de a servi. Decorează fiecare vas cu avocado cuburi „crutoane” (¼ avocado per vas) \n• La final, decorează cu smântână și stoarcei o lămâie (dacă poți tolera aciditatea) pentru un plus de aromă și prospețime ",
           ingredients: "• 2 legături de sparanghel curățat și tăiat \n• 1 cană de fasole boabe albă, spălată și scursă \n• 1 ceapă medie \n• 2 linguri de ulei de măsline extravirgin \n• 4 căni de supă de pui \n• ¼ cană de smântână dulce \n• ⅛ linguriță de sare himalayană \n• ⅛ linguriță de piper \n• ½ linguriță de cimbru \n• 1 avocado copt, tăiat cuburi \n• Smântână (asezonare opțională)",
           image: "https://onco-plan.ro/wp-content/uploads/2021/07/asparagus-spinach-soup.jpg")
    

var previewActivityData: [Activity] = [
    Activity(id: 1, title: "abdomene", met: "4.5"),
    Activity(id: 2, title: "aerobic", met: "6.5"),
    Activity(id: 3, title: "baschet", met: "8"),
    Activity(id: 4, title: "patinaj", met: "7"),
]


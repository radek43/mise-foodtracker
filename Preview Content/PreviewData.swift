//
//  PreviewData.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 29.03.2023.
//

import Foundation
import SwiftUI

var userPreviewData = User(email: "john.doe@email.com", name: "john.doe", fullname: "John Doe", is_staff: true, calorie_goal: "2854", weight: "84", height: "187", gender: 0, activity_factor: 2, dob: "2021-02-21")


var recipePreviewData: [RecipeList] = [
    RecipeList(id: 1,
               title: "Smoothie cu cheesecake cu căpșuni",
               category: "Mancaruri",
               calories: "295",
               protein: "7.5",
               carbs: "12",
               fat: "42",
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/strawberry-smoothie-with-basil-table.jpg"),
    RecipeList(id: 2,
               title: "Mâncare de pui și linte rosie",
               category: "Mancaruri",
               calories: "295",
               protein: "7.5",
               carbs: "12",
               fat: "42",
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/salad-with-red-lentils-spinach-leaves-cherry-tomatoes-chicken-meat-mozzarella-cheese-ceramic-plate-old-concrete-gray-surface-1.jpg"),
    RecipeList(id: 3,
               title: "Supă cremă de sparanghel",
               category: "Mancaruri",
               calories: "295",
               protein: "7.5",
               carbs: "12",
               fat: "42",
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/asparagus-spinach-soup.jpg")
]


var recipeDetailPreviewData: Recipe = 
Recipe(id: 4,
       title: "Supă cremă de sparanghel",
       category: "Mancaruri",
       calories: "295",
       protein: "7.5",
       carbs: "12",
       fat: "42",
       image: "https://onco-plan.ro/wp-content/uploads/2021/07/asparagus-spinach-soup.jpg",
       fibers: "11",
       time_minutes: 35,
       description: "• Lasă sparanghelul la aburi 20 de minute sau până când este moale când îl încerci cu furculița \n• Toacă ceapa \n• Încălzește uleiul de măsline într-o tigaie mare, adaugă puțină apă și sotează ceapa până devine translucidă, aproximativ 2-3 minute \n• Redu focul la mediu și adăugați fasolea, sarea, piperul și cimbrul și lăsă pe foc încă 5 minute \n• Adăugă sparanghelul gătit la aburi; când devine moale, adăugă supa de pui și fierbe la foc mic timp de 10 minute. \n• Ia supa gătită de pe foc și pune în vas. Folosește blenderul vertical pentru a transforma supa în piure. Ai grijă însă; supa este fierbinte. \n• Adăugă smântâna dulce și pune la loc pe foc mic, timp de încă 5 minute \n• Lăsă să se răcească înainte de a servi. Decorează fiecare vas cu avocado cuburi „crutoane” (¼ avocado per vas) \n• La final, decorează cu smântână și stoarcei o lămâie (dacă poți tolera aciditatea) pentru un plus de aromă și prospețime ",
       ingredients: "• 2 legături de sparanghel curățat și tăiat \n• 1 cană de fasole boabe albă, spălată și scursă \n• 1 ceapă medie \n• 2 linguri de ulei de măsline extravirgin \n• 4 căni de supă de pui \n• ¼ cană de smântână dulce \n• ⅛ linguriță de sare himalayană \n• ⅛ linguriță de piper \n• ½ linguriță de cimbru \n• 1 avocado copt, tăiat cuburi \n• Smântână (asezonare opțională)")


var activityPreviewData: [Activity] = [
    Activity(id: 1, title: "Abdomene", met: "4.5"),
    Activity(id: 2, title: "Aerobic", met: "6.5"),
    Activity(id: 3, title: "Baschet", met: "8"),
    Activity(id: 4, title: "Patinaj", met: "7")
]

var dishPreviewData: [FoodList] = [
    FoodList(id: 1, title: "Arahide Nutline", calories: "645.0"),
    FoodList(id: 2, title: "Iaurt de baut mango si para Zuzu", calories: "81.0"),
    FoodList(id: 3, title: "Prosciutto crudo Casa Domani", calories: "231.0"),
    FoodList(id: 4, title: "Bautura carbogazoasa Pepsi Twist Lemon", calories: "41.0")
]

var dishDetailPreviewData: Food = Food(id: 1, title: "Arahide Nutline", calories: "645.0", carbs: "11.5", fibers: "0.0", fat: "55.7", protein: "24.4", estimates: "")

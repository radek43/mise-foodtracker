//
//  PreviewData.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 29.03.2023.
//

import Foundation
import SwiftUI

var userPreviewData = User(email: "john.doe@email.com",
                           name: "john.doe",
                           fullname: "John Doe",
                           is_staff: true,
                           calorie_goal: 2854,
                           weight: 84,
                           height: 187,
                           gender: 0,
                           activity_factor: 2,
                           dob: "2021-02-21")


var recipePreviewData: [RecipeList] = [
    RecipeList(id: 1,
               title: "Smoothie cu cheesecake cu căpșuni",
               category: "Mancaruri",
               calories: 295,
               protein: 7.5,
               carbs: 12,
               fat: 42,
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/strawberry-smoothie-with-basil-table.jpg"),
    RecipeList(id: 2,
               title: "Mâncare de pui și linte rosie",
               category: "Mancaruri",
               calories: 295,
               protein: 7.5,
               carbs: 12,
               fat: 42,
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/salad-with-red-lentils-spinach-leaves-cherry-tomatoes-chicken-meat-mozzarella-cheese-ceramic-plate-old-concrete-gray-surface-1.jpg"),
    RecipeList(id: 3,
               title: "Supă cremă de sparanghel",
               category: "Mancaruri",
               calories: 295,
               protein: 7.5,
               carbs: 12,
               fat: 42,
               image: "https://onco-plan.ro/wp-content/uploads/2021/07/asparagus-spinach-soup.jpg")
]


var recipeDetailPreviewData: Recipe = 
Recipe(id: 4,
       title: "Supă cremă de sparanghel",
       category: "Mancaruri",
       calories: 295,
       protein: 7.5,
       carbs: 12,
       fat: 42,
       image: "https://onco-plan.ro/wp-content/uploads/2021/07/asparagus-spinach-soup.jpg",
       fibers: 11,
       time_minutes: 35,
       description: "• Lasă sparanghelul la aburi 20 de minute sau până când este moale când îl încerci cu furculița \n• Toacă ceapa \n• Încălzește uleiul de măsline într-o tigaie mare, adaugă puțină apă și sotează ceapa până devine translucidă, aproximativ 2-3 minute \n• Redu focul la mediu și adăugați fasolea, sarea, piperul și cimbrul și lăsă pe foc încă 5 minute \n• Adăugă sparanghelul gătit la aburi; când devine moale, adăugă supa de pui și fierbe la foc mic timp de 10 minute. \n• Ia supa gătită de pe foc și pune în vas. Folosește blenderul vertical pentru a transforma supa în piure. Ai grijă însă; supa este fierbinte. \n• Adăugă smântâna dulce și pune la loc pe foc mic, timp de încă 5 minute \n• Lăsă să se răcească înainte de a servi. Decorează fiecare vas cu avocado cuburi „crutoane” (¼ avocado per vas) \n• La final, decorează cu smântână și stoarcei o lămâie (dacă poți tolera aciditatea) pentru un plus de aromă și prospețime ",
       ingredients: "• 2 legături de sparanghel curățat și tăiat \n• 1 cană de fasole boabe albă, spălată și scursă \n• 1 ceapă medie \n• 2 linguri de ulei de măsline extravirgin \n• 4 căni de supă de pui \n• ¼ cană de smântână dulce \n• ⅛ linguriță de sare himalayană \n• ⅛ linguriță de piper \n• ½ linguriță de cimbru \n• 1 avocado copt, tăiat cuburi \n• Smântână (asezonare opțională)")


var activityPreviewData: [Activity] = [
    Activity(id: 1, title: "Abdomene", met: 4.5),
    Activity(id: 2, title: "Aerobic", met: 6.5),
    Activity(id: 3, title: "Baschet", met: 8),
    Activity(id: 4, title: "Patinaj", met: 7)
]

var dishPreviewData: [FoodList] = [
    FoodList(id: 1, title: "Arahide Nutline", calories: 645.0),
    FoodList(id: 2, title: "Iaurt de baut mango si para Zuzu", calories: 81.0),
    FoodList(id: 3, title: "Prosciutto crudo Casa Domani", calories: 231.0),
    FoodList(id: 4, title: "Bautura carbogazoasa Pepsi Twist Lemon", calories: 41.0)
]

var dishDetailPreviewData: Food = Food(id: 1,
                                       title: "Arahide Nutline",
                                       calories: 645.0,
                                       carbs: 11.5,
                                       fibers: 0.0,
                                       fat: 55.7,
                                       protein: 24.4,
                                       estimates: "1 punga = 200g")

var dishLogPreviewData: DishLog = DishLog(id: "1",
                                          mealtype: 1,
                                          title: "Arahide Nutline",
                                          servingSize: 100,
                                          calories: 645.0,
                                          protein: 24.4,
                                          carbs: 11.5,
                                          fibers: 0.0,
                                          fat: 55.7)

var logPreviewData: [Log] = [
    Log(dateTime: Date.from(year: 2023, month: 5, day: 19),
        foods: [
            DishLog(id: "1",
                    mealtype: 1,
                    title: "Cartofi prajiti",
                    servingSize: 120,
                    calories: 150,
                    protein: 14,
                    carbs: 31,
                    fibers: 0,
                    fat: 25),
            DishLog(mealtype: 1,
                    title: "Ciorbă de cartofi",
                    servingSize: 100,
                    calories: 350,
                    protein: 44,
                    carbs: 23,
                    fibers: 0,
                    fat: 11),
            DishLog(mealtype: 1,
                    title: "Cereale cu lapte",
                    servingSize: 100,
                    calories: 420,
                    protein: 32,
                    carbs: 47,
                    fibers: 0,
                    fat: 15)
        ],
        activities: [
            ActivityLog(title: "Alergare", calories: 48, duration: 12),
            ActivityLog(title: "Haltere", calories: 23, duration: 12),
            ActivityLog(title: "Plimbare", calories: 12, duration: 12)
        ],
        weight: 50,
        water: 6),
    
    Log(dateTime: Date.from(year: 2023, month: 5, day: 17),
        foods: [
            DishLog(mealtype: 1,
                    title: "Pepene roșu",
                    servingSize: 100,
                    calories: 250,
                    protein: 64,
                    carbs: 13,
                    fibers: 0,
                    fat: 21),
            DishLog(mealtype: 1,
                    title: "Căpșuni",
                    servingSize: 100,
                    calories: 250,
                    protein: 14,
                    carbs: 12,
                    fibers: 0,
                    fat: 28),
            DishLog(mealtype: 1,
                    title: "Alune",
                    servingSize: 100,
                    calories: 250,
                    protein: 24,
                    carbs: 23,
                    fibers: 0,
                    fat: 25)
        ],
        activities: [
            ActivityLog(title: "Plimbare", calories: 140, duration: 12),
            ActivityLog(title: "Alergare", calories: 140, duration: 12),
            ActivityLog(title: "Somn", calories: 140, duration: 12)
        ],
        weight: 78,
        water: 3),
    Log(dateTime: Date().stripTime(),
        foods: [
            DishLog(mealtype: 1,
                    title: "Halva",
                    servingSize: 100,
                    calories: 250,
                    protein: 74,
                    carbs: 23,
                    fibers: 0,
                    fat: 21),
            DishLog(mealtype: 1,
                    title: "Ciocolată",
                    servingSize: 100,
                    calories: 250,
                    protein: 36,
                    carbs: 63,
                    fibers: 0,
                    fat: 18),
            DishLog(mealtype: 1,
                    title: "Bere",
                    servingSize: 100,
                    calories: 50,
                    protein: 4,
                    carbs: 13,
                    fibers: 0,
                    fat: 45)
        ],
        activities: [
            ActivityLog(title: "Somn", calories: 140, duration: 12),
            ActivityLog(title: "ALergare", calories: 140, duration: 12),
            ActivityLog(title: "Haltere", calories: 140, duration: 12)
        ],
        weight: 20,
        water: 1),
]



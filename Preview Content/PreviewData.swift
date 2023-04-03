//
//  PreviewData.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 29.03.2023.
//

import Foundation

var userPreviewData = User(fullname: "John Doe", name: "john.doe", email: "john.doe@email.com", is_staff: false)

var recipePreviewData: [Recipe] = [
    Recipe(id: 69, title: "Oua umplute", category: "Mancaruri", time_minutes: 40, calories: 803.33, protein: 55.26, carbs: 5.03, fibers: 0, fat: 59.8, description: "Se fierb ouăle. După ce s-au răcit se decojesc, se taie în 2 si se separa albușul de gălbenuș. Gălbenușul se pisează cu muștar, pate si smântână. Se pune apoi compoziția de gălbenuș in albusuri. ", ingredients: "• 360.00g - Oua proaspete Agricola \n• 20.00g - Mustar dulce La Minut \n• 80.00g - Pate de porc cu verdeturi Bucegi \n• 30.00g - Smantana 12% Olympus", image: "https://fit2life.ro/uploads/retete/oua-umplute-_0_1679162396.jpg")
]

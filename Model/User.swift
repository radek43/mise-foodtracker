//
//  User.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 01.09.2022.
//

import Foundation
import SwiftUI

enum Regex: String {
    case email = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,49}$"
    case password = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    case username = "^(?!.*\\.\\.)(?!.*\\.$)[^\\W][\\w.]{0,29}$"
}

enum UserError: Error, LocalizedError {
    case invalidURL
    case invalidCredentials
    case serverError
    case invalidData
    case unknown(Error)
    case invalidEmail
    case invalidUsername
    
    var errorDescription: String? {
        switch self {
            case .invalidURL:
                return "Link invalid."
            case .serverError:
                return "Aplicația nu poate comunica cu serverul. Vă rugăm reîncercați mai târziu."
            case .invalidData:
                return "A aparut o eroare. Vă rugăm reîncercați mai târziu."
            case .invalidEmail:
                return "Această adresă de email nu este validă sau este folosită deja. Vă rugăm introduceți alt email."
            case .invalidUsername:
                return "Aceast username este folosit deja. Vă rugăm introduceți alt username."
            case .unknown(let error):
                return error.localizedDescription
            case .invalidCredentials:
                return "Adresă de email sau parola incorectă."
        }
    }
}

// Token model
struct Token: Codable {
    let token: String
}

// User model
struct User: Codable {
    // MARK: - PROPERTIES
    let email: String
    let name: String
    let fullname: String
    let is_staff: Bool
    let calorie_goal: Double
    let weight: Double
    let height: Double
    let gender: Int
    let activity_factor: Int
    let dob: String
    
    // MARK: - COMPUTED PROPERTIES
    var formattedDob: Date {
        return convertStringToDate(dateString: dob) ?? Date()
    }
    
    var age: Int {
        return convertDobToAge(dob: dob)
    }
    
    var activityMeta: String {
        switch activity_factor {
            case 0:
                return ("Sedentar")
            case 1:
                return ("Usor activ")
            case 2:
                return ("Activ")
            case 3:
                return ("Foarte activ")
            case 4:
                return ("Extra activ")
            default:
                return ""
        }
    }
    
    var activityValue: Double {
        switch activity_factor {
            case 0:
                return 1.2
            case 1:
                return 1.375
            case 2:
                return 1.55
            case 3:
                return 1.725
            case 4:
                return 1.9
            default:
                return 1.2
        }
    }
    
    var tdee: Double {
        return getTDEE(gender: gender, weight: weight, height: height, age: age, activityLevel: activityValue)
    }
    
    var bmi: Double {
        return calculateBMI(weight: weight, height: height)
    }
    
    func convertStringToDate(dateString: String) -> Date? {
        // Convert to date type
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateString)
    }
    
    func convertDobToAge(dob: String) -> Int {
        // Convert the birthdate string to a Date object
        guard let birthdate = convertStringToDate(dateString: dob) else {
            print("Invalid date format")
            return 0
        }
        
        // Calculate the age of the person based on the current date
        let now = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthdate, to: now)
        let age = ageComponents.year!
        
        // Return the person's age
        return age
    }
    
    func getTDEE(gender: Int, weight: Double, height: Double, age: Int, activityLevel: Double) -> Double {
        var bmr: Double = 0
        
        // Calculate BMR based on gender using the Harris-Benedict equation
        if gender == 0 {   // male
            let calculatedWeight = 13.397 * weight
            let calculatedHeight = 4.799 * height
            let calculatedAge = 5.677 * Double(age)
            
            bmr = 88.362 + calculatedWeight + calculatedHeight - calculatedAge
        } else if gender == 1 {   // female
            let calculatedWeight = 9.247 * weight
            let calculatedHeight = 3.098 * height
            let calculatedAge = 4.330 * Double(age)
            
            bmr = 447.593 + calculatedWeight + calculatedHeight - calculatedAge
        }
        
        var tdee = bmr * activityLevel
        tdee = round(tdee * 10) / 10.0
        
        return tdee
    }
    
    func calculateBMI(weight: Double, height: Double) -> Double {
        // Calculate BMI
        var bmi = (weight / height / height) * 10_000
        bmi = round(bmi * 10) / 10.0
        return bmi
    }
}

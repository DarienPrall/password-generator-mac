//
//  Generator.swift
//  Password Generator
//
//  Created by Darien Prall on 04-23-2023
//  Reviewed for GitHub Deployment on 11-28-2024

import Foundation

struct Generator {

    func generatePassword() -> String {
        
    //define variables
        let lowercasedAlpha = "abcdefghijklmnopqrstuvwxyz"
        let uppercasedAlpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let numbers = "1234567890"
        let amountOfNum = Int.random(in: 1...2)
        let amountOfUpper = Int.random(in: 1...2)
        var randomPassword: [String] = []
        var joinedPassword: String
        var i = 0
        var _: String
        
    //append 18 random lowercase letters to randomPassword array
        while i < 18 {
            let randomLetter = lowercasedAlpha[lowercasedAlpha.index(lowercasedAlpha.startIndex, offsetBy: Int.random(in: 1...25))]
            randomPassword.append(String(randomLetter))
            i+=1
        }
    
    //replace a random letter in the randomPassword array with random number(s)
        var j = 0
        while j < amountOfNum {
            //which index in the randompass are we changing
            let firstRandomPassIndex = Int.random(in: 0...17)
            let RandomNumIndex = String(numbers[numbers.index(numbers.startIndex, offsetBy: Int.random(in: 0...9))])
            randomPassword[firstRandomPassIndex] = RandomNumIndex
            j+=1
        }
        
    //replace a random letter in the randomPassword array with random uppercase letter(s)
        var k = 0
        while k < amountOfUpper {
            let secondRandomPassIndex = Int.random(in: 0...17)
            let randomAlphaIndex = String(uppercasedAlpha[uppercasedAlpha.index(uppercasedAlpha.startIndex, offsetBy: Int.random(in: 0...25))])
            randomPassword[secondRandomPassIndex] = randomAlphaIndex
            k+=1
        }
    
    //shuffle the randomPassword array to ensure stronger security in password
        randomPassword.shuffle()
    //add "-"s to the randomPassword array at the 5th and 11th index
        randomPassword[5].append("-")
        randomPassword[11].append("-")
    //join randomPassword array to form string
        joinedPassword = randomPassword.joined()
    
        return joinedPassword
    }

}

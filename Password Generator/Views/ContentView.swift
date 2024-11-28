//
//  ContentView.swift
//  Password Generator
//
//  Created by Darien Prall on 04-24-2023.
//  Reviewd for GitHub Deployment on 11-28-2024
//

import SwiftUI

struct ContentView: View {
    
    @State private var passwordIsVisible: Bool = false
    @State private var generator: Generator = Generator()
    @State private var passwordText = Generator().generatePassword()
    
    var body: some View {
        
        VStack(spacing: -2.0) {
            Spacer()
            Image(systemName: "lock.shield.fill")
                .resizable()
                .foregroundColor(.blue)
                .aspectRatio(contentMode: .fit)
                .frame(width: 95, height: 95)
                .shadow(radius: 0)
            mainTextView(text: "Password Generator")
            subTextView(text: "Stay Safe. Stay Protected.")
            Spacer()
            passwordTextView(passwordIsVisible: $passwordIsVisible, text: passwordText)
                .animation(Animation.easeIn(duration: 0.8))
// needing to find a replacement for .animatkion as it has been deprecated in iOS 15.0
// possible replacements are withAnimation or animation(...)
                .textSelection(.enabled)
            Spacer()
            Button(action: {
                print("success")
                passwordText = generator.generatePassword()
                self.passwordIsVisible = true
            }) {
                buttonView()
            }
//            .alert(isPresented: $passwordIsVisible, content: {
//                return Alert(title: Text(""), message: Text("\(generator.generatePassword())"))
//               })
        }
        

        
    }
}


struct mainTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .padding(.top)
            .kerning(1.0)
            .bold()
            .font(.system(size: 48, weight: .bold))
            .frame(maxWidth: .infinity)
            .foregroundColor(Color("darkGray5"))
    }
}

struct buttonView: View {
    var body: some View {
        Text("Generate")
            .font(.system(size: 24, design: .default))
            .kerning(1.2)
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

struct passwordTextView: View {
    @Binding var passwordIsVisible: Bool
    var text: String
    var body: some View {
        Text(passwordIsVisible ? text : "                   " )
            .font(.title2)
            .foregroundColor(passwordIsVisible ? Color("darkGray5") : Color("darkGray5"))
            .kerning(3.3)
            .padding()

    }
}

struct subTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding(11.0)
            .foregroundColor(Color("lightGray"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


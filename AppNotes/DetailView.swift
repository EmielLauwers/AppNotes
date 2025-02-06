//
//  DetailView.swift
//  AppNotes
//
//  Created by Emiel lauwers on 04/02/2025.
//

import SwiftUI


struct DetailView: View {
    @Binding var task: ContentView.Taak
    
    var body: some View {
        VStack {
            TextField("Taaknaam", text: $task.naam)
                .font(.title)
                .padding()
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.blue)
            
            TextEditor(text: $task.beschrijving)
                .font(.body)
                .padding()
                .border(Color.black).padding()
                
                .foregroundColor(.blue)
                .padding()
                .frame(height: 150) // Pas de hoogte aan naar behoefte
            
            
            
            Text("Status: \(task.isVoltooid ? "Voltooid" : "Niet voltooid")")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        }
        Spacer()
    }
}




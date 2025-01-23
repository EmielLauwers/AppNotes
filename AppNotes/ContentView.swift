
//

import SwiftUI


struct ContentView: View {
    @State var note: String
   
    var body: some View {
        NavigationStack{
            VStack {
                TextField("note", text: $note).textFieldStyle(.roundedBorder).padding()
                Spacer()
               
                
                
            }
            .navigationTitle("notes")
            .padding()
        }
    }
}

#Preview {
    ContentView(note: "")
}

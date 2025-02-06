import SwiftUI

struct ContentView: View {
    @State private var taak: String = ""
    @State private var takenlijst: [Taak] = []
    
    
    struct Taak: Identifiable {
        let id = UUID()
        var naam: String
        var isVoltooid: Bool
        var beschrijving: String
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Voeg taak toe", text: $taak)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                        .fontWeight(.bold)
                        .cornerRadius(10)
                    
                    Button(action: {
                        if !taak.isEmpty {
                            let nieuweTaak = Taak(naam: taak, isVoltooid: false, beschrijving: "")
                            takenlijst.append(nieuweTaak)
                            taak = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    .padding(.leading)
                }
                .padding()
                
                Spacer()
                
                List {
                    ForEach(takenlijst) { taak in
                        HStack {
                            Image(systemName: taak.isVoltooid ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(taak.isVoltooid ? .green : .gray)
                                .onTapGesture {
                                    toggleTaakStatus(taak)
                                }
                            
                            Text(taak.naam)
                                .strikethrough(taak.isVoltooid, color: .gray)
                                .foregroundColor(taak.isVoltooid ? .gray : .primary)
                            
                            NavigationLink(destination: DetailView(task: $takenlijst[takenlijst.firstIndex(where: { $0.id == taak.id })!])) {
                               
                            }
                        }
                        .padding(.vertical, 5)
                    }
                    .onDelete(perform: removeRij)
                }
            }
            .navigationTitle("Hoofdscherm")
        }
    }
    
    func toggleTaakStatus(_ taak: Taak) {
        if let index = takenlijst.firstIndex(where: { $0.id == taak.id }) {
            takenlijst[index].isVoltooid.toggle()
        }
    }
    
    func removeRij(at offsets: IndexSet) {
        takenlijst.remove(atOffsets: offsets)
    }
}


        
    

#Preview {
    ContentView()
}

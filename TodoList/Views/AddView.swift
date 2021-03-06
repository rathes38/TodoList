//
//  AddView.swift
//  TodoList
//
//  Created by Ratheesh R L on 27/04/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var mListViewModel : ListViewModel
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...",
                    text: $textFieldText
                )
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                Button(action: saveBtnPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                })
            }.padding()
            
        }
        .navigationTitle("Add Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveBtnPressed(){
        if textIsValidated(){
            mListViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValidated() -> Bool{
        if textFieldText.count < 3 {
            alertTitle = "Todo must have 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}

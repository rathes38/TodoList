//
//  NoItemView.swift
//  TodoList
//
//  Created by Ratheesh R L on 27/04/22.
//

import SwiftUI

struct NoItemView: View {
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no Items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("You should click the add button and add a bunch of items to your TODO list!")
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(12)
                    })                
            }
            .multilineTextAlignment(.center)
            .padding(40)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemView()
                .navigationTitle("Title")
        }
    }
}

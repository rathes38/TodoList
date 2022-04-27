//
//  ListView.swift
//  TodoList
//
//  Created by Ratheesh R L on 27/04/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var mListViewModel : ListViewModel
    
    var body: some View {
        ZStack{
            if mListViewModel.items.isEmpty {
                NoItemView()
            } else {
                List{
                    ForEach(mListViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    mListViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: mListViewModel.deleteItem)
                    .onMove(perform: mListViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: !mListViewModel.items.isEmpty ? EditButton() : nil,
            trailing: !mListViewModel.items.isEmpty ? NavigationLink("Add", destination: AddView()) : nil
        )
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}

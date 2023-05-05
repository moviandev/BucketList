//
//  EditView.swift
//  BucketList
//
//  Created by Matheus Viana on 18/04/23.
//

import SwiftUI

struct EditView: View {  
    @Environment(\.dismiss) var dismiss
    var onSave: (Location) -> Void
    var location: Location
    @StateObject private var viewModel: EditViewModel

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby...") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("loading...")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ")
                            + Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later")
                    }
                }
            }
            .navigationTitle("Plave details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = viewModel.name
                    newLocation.description = viewModel.description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location        
        self.onSave = onSave
        
        _viewModel = StateObject(wrappedValue: EditViewModel(location: location))
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example) { _ in }
    }
}

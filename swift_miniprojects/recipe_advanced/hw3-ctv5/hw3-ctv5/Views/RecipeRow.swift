import Foundation
import SwiftUI
import SwiftData

struct RecipeRow: View {
    @Environment(\.modelContext) private var modelContext
    let recipe: Recipe
    var body: some View {
        HStack{
            HStack{
            AsyncImage(url: recipe.thumbnailUrl) { image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            } placeholder: {
                if recipe.thumbnailUrl != nil {
                    ProgressView()
                } else {
                    Image(systemName: "fork.knife")
                }
            }
            .frame(maxWidth: 100, maxHeight: 100)
                
                
                VStack (alignment: .leading){
                    Text(recipe.mealCourse.rawValue)
                        .textCase(.uppercase)
                    Text(recipe.name)
                        .fontWeight(.heavy)
                }
                
                Spacer()
                Image(systemName: recipe.lastPreparedAt != nil ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(recipe.lastPreparedAt != nil ? Color.green : Color.black)
            }
        }
        
        
    }
}



//
//  RecipeController.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import Foundation

class RecipeController: ObservableObject {
    private let apiService = ShaRecipeService()
        
    @Published private(set) var fetchedCuratedRecipe: [CuratedRecipe] = []
    @Published private(set) var shareableRecipe: [ShareableRecipe] = []
    @Published private(set) var isFetching: Bool = false
    @Published private(set) var isError: Bool = false
    
    init() {
        fetchCuratedRecipes()
        shareableRecipe = getShareableRecipeFromUserDefaults()
    }
    
    // async here because it is not a good idea to put task in init
    func fetchCuratedRecipes() {
        isError = false
        isFetching = true
        Task {
            do {
                let curatedRecipes = try await apiService.fetchCurated()
                DispatchQueue.main.async {
                    self.fetchedCuratedRecipe = curatedRecipes
                    self.isFetching = false
                }
            } catch {
                print("Failed to fetch curated recipes: \(error)")
                DispatchQueue.main.async {
                    self.isFetching = false
                    self.isError = true
                }
            }
        }
    }
    
    func fetchShareableRecipe(code: String) async throws -> ShareableRecipe {
        let shareableRes = try await apiService.getShareable(code: code)
        let shareableRecipe = ShareableRecipe(
            name: shareableRes.name,
            description: shareableRes.description,
            ingredients: shareableRes.ingredients,
            direction: shareableRes.direction,
            category: shareableRes.category,
            code: shareableRes.code
        )
        return shareableRecipe
    }
    
    func createShareableRecipe(recipe: CreateShareableReq) async throws -> ShareableRecipe {
        let shareableRes = try await apiService.createShareable(recipe: recipe)
        let shareableRecipe = ShareableRecipe(
            name: recipe.name,
            description: recipe.description,
            ingredients: recipe.ingredients,
            direction: recipe.direction,
            category: recipe.category,
            code: shareableRes.code
        )
        return shareableRecipe
    }

    // add a recipe locally and save to user default
    func addShareableRecipe(recipe: ShareableRecipe) {
        shareableRecipe.append(recipe)
        saveShareableRecipeToUserDefaults()
    }
    
    // delete a recipe from the array then save it
    func deleteShareableRecipe(recipe: ShareableRecipe) {
        shareableRecipe.removeAll(where: { $0.id == recipe.id })
        saveShareableRecipeToUserDefaults()
    }

    
    // check if we already have the code locally
    func isShareableRecipeExist(_ code: String) -> Bool {
        return shareableRecipe.contains(where: { $0.code == code })
    }
    
    // retrive/update/clear data from UserDefault
    func getShareableRecipeFromUserDefaults() -> [ShareableRecipe] {
        if let data = UserDefaults.standard.data(forKey: "ShaRecipeKey") {
            if let decoded = try? JSONDecoder().decode([ShareableRecipe].self, from: data) {
                return decoded
            }
        }
        return []
    }

    func saveShareableRecipeToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(shareableRecipe) {
            UserDefaults.standard.set(encoded, forKey: "ShaRecipeKey")
        }
    }
    
    func clearShareableRecipe() {
        shareableRecipe = []
        UserDefaults.standard.removeObject(forKey: "ShaRecipeKey")
    }

    
    // for testing preview
    static let allStaticCuratedRecipe: [CuratedRecipe] = [
        CuratedRecipe(
            name: "Healthy banana bread",
            image: "https://img.taste.com.au/qe2CA14c/w643-h428-cfill-q90/taste/2019/02/healthy-banana-bread-p64-147080-3.jpg",
            description: "Try this healthy banana bread made with less sugar and no butter. Best of all it's still as sweet as ever!",
            ingredients: "100g (1 cup) coconut flour\n160g (1 1/4 cups) wholemeal spelt flour\n3 1/2 tsp baking powder\n40g (1/2 cup) desiccated coconut\n1 tsp ground cinnamon\n50g (1/3 cup) coconut or rapadura sugar\n3 large bananas, mashed (310g flesh), plus 1 extra, for decoration\n3 eggs\n80ml (1/3 cup) olive oil\n160ml (2/3 cup) oat, soy or rice milk\nMaple syrup, to serve (optional)",
            direction: "Preheat oven to 180C/ 160C fan forced. Grease and line a 7.5cm deep, 22.5 x 8.5cm (base measurement) loaf pan with non-stick baking paper, allowing the long sides to overhang.\nCombine the flours, baking powder, coconut, cinnamon and sugar in a large bowl. Make a well in the centre. Add the banana, eggs, oil and milk and stir to combine. Pour the mixture into the prepared pan. Smooth surface. Very finely slice the remaining banana. Place banana slices, overlapping each over, to cover the entire surface of the loaf.\nBake for 45-55 minutes or until a skewer comes out clean when inserted in the centre. Slice and serve with a drizzle of maple syrup if desired.",
            category: "Dessert"
        ),
    ]
    
    static let allStaticShareableRecipe: [ShareableRecipe] = [
        ShareableRecipe(
            name: "Healthy banana bread",
            description: "Try this healthy banana bread made with less sugar and no butter. Best of all it's still as sweet as ever!",
            ingredients: "100g (1 cup) coconut flour\n160g (1 1/4 cups) wholemeal spelt flour\n3 1/2 tsp baking powder\n40g (1/2 cup) desiccated coconut\n1 tsp ground cinnamon\n50g (1/3 cup) coconut or rapadura sugar\n3 large bananas, mashed (310g flesh), plus 1 extra, for decoration\n3 eggs\n80ml (1/3 cup) olive oil\n160ml (2/3 cup) oat, soy or rice milk\nMaple syrup, to serve (optional)",
            direction: "Preheat oven to 180C/ 160C fan forced. Grease and line a 7.5cm deep, 22.5 x 8.5cm (base measurement) loaf pan with non-stick baking paper, allowing the long sides to overhang.\nCombine the flours, baking powder, coconut, cinnamon and sugar in a large bowl. Make a well in the centre. Add the banana, eggs, oil and milk and stir to combine. Pour the mixture into the prepared pan. Smooth surface. Very finely slice the remaining banana. Place banana slices, overlapping each over, to cover the entire surface of the loaf.\nBake for 45-55 minutes or until a skewer comes out clean when inserted in the centre. Slice and serve with a drizzle of maple syrup if desired.",
            category: "Dessert",
            code: "1710"
        ),
    ]
}

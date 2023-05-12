//
//  RecipeController.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import Foundation

class RecipeController {
    static let allCuratedRecipe: [CuratedRecipe] = [
        CuratedRecipe(
            name: "Healthy banana bread",
            image: "https://img.taste.com.au/qe2CA14c/w643-h428-cfill-q90/taste/2019/02/healthy-banana-bread-p64-147080-3.jpg",
            description: "Try this healthy banana bread made with less sugar and no butter. Best of all it's still as sweet as ever!",
            ingredients: "100g (1 cup) coconut flour\n160g (1 1/4 cups) wholemeal spelt flour\n3 1/2 tsp baking powder\n40g (1/2 cup) desiccated coconut\n1 tsp ground cinnamon\n50g (1/3 cup) coconut or rapadura sugar\n3 large bananas, mashed (310g flesh), plus 1 extra, for decoration\n3 eggs\n80ml (1/3 cup) olive oil\n160ml (2/3 cup) oat, soy or rice milk\nMaple syrup, to serve (optional)",
            direction: "Preheat oven to 180C/ 160C fan forced. Grease and line a 7.5cm deep, 22.5 x 8.5cm (base measurement) loaf pan with non-stick baking paper, allowing the long sides to overhang.\nCombine the flours, baking powder, coconut, cinnamon and sugar in a large bowl. Make a well in the centre. Add the banana, eggs, oil and milk and stir to combine. Pour the mixture into the prepared pan. Smooth surface. Very finely slice the remaining banana. Place banana slices, overlapping each over, to cover the entire surface of the loaf.\nBake for 45-55 minutes or until a skewer comes out clean when inserted in the centre. Slice and serve with a drizzle of maple syrup if desired.",
            category: "Dessert"
        ),
        CuratedRecipe(
            name: "Miso, tofu and udon noodle soup-to-go",
            image: "https://img.taste.com.au/gGidxYaM/w643-h428-cfill-q90/taste/2017/05/miso-paste-126621-2.jpg",
            description: "For an easy lunch on-the-go, try this healthy miso, tofu and noodle soup.",
            ingredients: "100g (1/3 cup) white miso paste\n2 tbsp hulled tahini\n2 tbsp soy sauce\n2 tbsp mirin\n1 tbsp sriracha chilli sauce, plus extra, to serve\n2 x 200g pkts fresh udon noodles or shelf-life udon noodles\n1 baby buk choy, thinly sliced\n80g oyster mushrooms, thinly sliced\n200g firm silken tofu, cut into 1cm pieces\n2 green shallots, thinly sliced\n1 tbsp pickled ginger slices\n1.5L (6 cups) boiling water",
            direction: "Whisk miso, tahini, soy sauce, mirin and sriracha in a small bowl. Divide mixture among four 750ml (3 cup) glass jars with lids.\nLayer noodles, buk choy, mushroom, tofu, shallot and ginger in jars. Cover with lids. Place in the fridge until ready to serve.\nTo serve, add 375ml (11 ⁄2 cups) boiling water to each jar. Stir until well combined. Cover with lids. Stand for 2 minutes or until the vegetables have softened. Serve drizzled with extra sriracha.",
            category: "Soup"
        ),
        CuratedRecipe(
            name: "Slow-cooked lamb vindaloo pies",
            image: "https://img.taste.com.au/DOx-UF-o/w643-h428-cfill-q90/taste/2020/08/slow-cooked-lamb-vindaloo-pies-164050-2.jpg",
            description: "Vindaloo meat pies are full of Indian flavour and fall-apart-tender lamb",
            ingredients: "2 tbsp vegetable oil\n2 brown onions, finely chopped\n2 tsp yellow mustard seeds\n1kg boneless lamb shoulder or leg, excess fat trimmed, cut into 3cm pieces\n4 tomatoes, coarsely chopped\n1 tbsp brown sugar\n2 fresh or dried bay leaves\n1 cinnamon stick\n80ml (1/3 cup) white vinegar\n2 sheets frozen shortcrust pastry, just thawed\n2 sheets frozen puff pastry, just thawed\n2 egg yolks, lightly whisked\nBought tomato chutney, to serve",
            direction: "To make spice paste, place all ingredients and 2 tbs water in the food processor. Process until smooth, adding extra water 1 tbs at a time to help blend, if necessary.\nHeat oil in a large heavy-based saucepan over medium-high heat. Add onion and a pinch of salt. Cook, stirring occasionally, for 10 minutes or until softened. Stir in mustard seeds for 1 minute. Add spice paste and stir for 1 minute or until aromatic.\nAdd lamb and cook for 4 minutes or until lamb just starts to colour. Add the tomato, sugar, bay leaves, cinnamon, vinegar and 60ml (1 ⁄4 cup) water. Reduce heat to low. Cover partially with a lid and simmer, stirring occasionally, for 2 hours or until the lamb is tender and sauce thickens. Season. Set aside to cool completely.\nPreheat oven to 200C/180C fan forced. Cut each pastry sheet into 4 squares. Line eight 8cm (base measurement) pie tins with shortcrust squares. Trim excess. Fill with lamb mixture. Top with puff squares. Press edges together. Use a sharp knife to trim any excess pastry. Use a fork to press edges together to seal. Brush each pie with egg yolk and transfer to a large baking tray (depending on size of your oven and baking trays, you may need to cook in batches). Bake for 20 minutes or until pastry is golden. Serve with chutney.\n",
            category: "Main"
        )
    ]
}

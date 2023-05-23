# UTS-IOS-ShaRecipe
UTS IOS development assignemnt 3

## Introduction
ShaRecipe (Share Recipe) is an app that allow user to not only view a wide range of curated recipe but also create their own recipe (shareble recipe). 

Every recipe created by the user will generate a code (shareable code) which the user can share with their friends and family.

If an user have a code, they can enter the code to get the recipe.

Creating a new recipe or getting a shareable recipe will require network connection. However, once the user fetched/created the shareable recipe, those recipes will be avalible offline.

User can manage their local recipe library by removing unwanted recipe or clear everything.

## Linked repo
- ShareRecipe App: https://github.com/Mike0298/UTS-IOS-ShaRecipe
- ShaRecipe API server: https://github.com/Mike0298/UTS-IOS-ShaRecipe-API

## Important information
- As the API server is hosted with Render free tier, the server is in Singapore. For faster respond, please install the ShaRecipe API server into your local machine and follow the instruction to setup the server locally. This should be faster as the MongoDB cluster is hosted in Australia
- In order for the app to use local server, please change `serviceEndPoint` in `Model/ShaRecipeService.swift` to the following:
```
private let serviceEndPoint = "http://localhost:5000/api"
```
- Please note that the API server hosted on Render will slow down to hibernation when inactive for a long time. It will take a while for it to resume normal activity when the service is requested. It is normal for the app to take extra time to communicate with the server when this happen. 

## Author
- StudentId: 12441376 Commit under the name of Mike Pham and Mike0298
- StudentId: 14304962 Commit under the name of ShinyShinx


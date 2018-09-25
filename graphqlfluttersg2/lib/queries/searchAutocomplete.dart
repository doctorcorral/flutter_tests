String  autocomplete = """
{
    outocomplete(query:  "querystring", mealType: RECIPE) {
    edges {
      node {
        name
        mealType
        mealTypeDisplayName
        databaseId
        extraInfo
        nutrients {
          chocdf
          fat
          sugar
          procnt
        }
      }
    }
  }
}
"""
    .replaceAll('\n', ' ');

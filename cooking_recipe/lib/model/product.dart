class Product {
  String? image, url, source,label;
  Product({this.image,this.url,this.source,this.label});
}




// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);

// import 'dart:convert';

// Product productFromJson(String str) => Product.fromJson(json.decode(str));

// String productToJson(Product data) => json.encode(data.toJson());

// class Product {
//     Product({
//         this.q,
//         this.from,
//         this.to,
//         this.more,
//         this.count,
//         this.hits,
//     });

//     String? q;
//     int? from;
//     int? to;
//     bool? more;
//     int? count;
//     List<Hit>? hits;

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         q: json["q"],
//         from: json["from"],
//         to: json["to"],
//         more: json["more"],
//         count: json["count"],
//         hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "q": q,
//         "from": from,
//         "to": to,
//         "more": more,
//         "count": count,
//         "hits": List<dynamic>.from(hits!.map((x) => x.toJson())),
//     };
// }

// class Hit {
//     Hit({
//         this.recipe,
//     });

//     Recipe? recipe;

//     factory Hit.fromJson(Map<String, dynamic> json) => Hit(
//         recipe: Recipe.fromJson(json["recipe"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "recipe": recipe!.toJson(),
//     };
// }

// class Recipe {
//     Recipe({
//         this.uri,
//         this.label,
//         this.image,
//         this.source,
//         this.url,
//         this.shareAs,
//         this.recipeYield,
//         this.dietLabels,
//         this.healthLabels,
//         this.cautions,
//         this.ingredientLines,
//         this.ingredients,
//         this.calories,
//         this.totalWeight,
//         this.totalTime,
//         this.cuisineType,
//         this.mealType,
//         this.dishType,
//         this.totalNutrients,
//         this.totalDaily,
//         this.digest,
//     });

//     String? uri;
//     String? label;
//     String? image;
//     String? source;
//     String? url;
//     String? shareAs;
//     int? recipeYield;
//     List<String>? dietLabels;
//     List<String>? healthLabels;
//     List<String>? cautions;
//     List<String>? ingredientLines;
//     List<Ingredient>? ingredients;
//     double? calories;
//     double? totalWeight;
//     int? totalTime;
//     List<String>? cuisineType;
//     List<String>? mealType;
//     List<String>? dishType;
//     Map<String, Total>? totalNutrients;
//     Map<String, Total>? totalDaily;
//     List<Digest>? digest;

//     factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
//         uri: json["uri"],
//         label: json["label"],
//         image: json["image"],
//         source: json["source"],
//         url: json["url"],
//         shareAs: json["shareAs"],
//         recipeYield: json["yield"],
//         dietLabels: List<String>.from(json["dietLabels"].map((x) => x)),
//         healthLabels: List<String>.from(json["healthLabels"].map((x) => x)),
//         cautions: List<String>.from(json["cautions"].map((x) => x)),
//         ingredientLines: List<String>.from(json["ingredientLines"].map((x) => x)),
//         ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
//         calories: json["calories"].toDouble(),
//         totalWeight: json["totalWeight"].toDouble(),
//         totalTime: json["totalTime"],
//         cuisineType: List<String>.from(json["cuisineType"].map((x) => x)),
//         mealType: List<String>.from(json["mealType"].map((x) => x)),
//         dishType: List<String>.from(json["dishType"].map((x) => x)),
//         totalNutrients: Map.from(json["totalNutrients"]).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
//         totalDaily: Map.from(json["totalDaily"]).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
//         digest: List<Digest>.from(json["digest"].map((x) => Digest.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "uri": uri,
//         "label": label,
//         "image": image,
//         "source": source,
//         "url": url,
//         "shareAs": shareAs,
//         "yield": recipeYield,
//         "dietLabels": List<dynamic>.from(dietLabels!.map((x) => x)),
//         "healthLabels": List<dynamic>.from(healthLabels!.map((x) => x)),
//         "cautions": List<dynamic>.from(cautions!.map((x) => x)),
//         "ingredientLines": List<dynamic>.from(ingredientLines!.map((x) => x)),
//         "ingredients": List<dynamic>.from(ingredients!.map((x) => x.toJson())),
//         "calories": calories,
//         "totalWeight": totalWeight,
//         "totalTime": totalTime,
//         "cuisineType": List<dynamic>.from(cuisineType!.map((x) => x)),
//         "mealType": List<dynamic>.from(mealType!.map((x) => x)),
//         "dishType": List<dynamic>.from(dishType!.map((x) => x)),
//         "totalNutrients": Map.from(totalNutrients!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "totalDaily": Map.from(totalDaily!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "digest": List<dynamic>.from(digest!.map((x) => x.toJson())),
//     };
// }

// class Digest {
//     Digest({
//         this.label,
//         this.tag,
//         this.schemaOrgTag,
//         this.total,
//         this.hasRdi,
//         this.daily,
//         this.unit,
//         this.sub,
//     });

//     String? label;
//     String? tag;
//     String? schemaOrgTag;
//     double? total;
//     bool? hasRdi;
//     double? daily;
//     Unit? unit;
//     List<Digest>? sub;

//     factory Digest.fromJson(Map<String, dynamic> json) => Digest(
//         label: json["label"],
//         tag: json["tag"],
//         schemaOrgTag: json["schemaOrgTag"] == null ? null : json["schemaOrgTag"],
//         total: json["total"].toDouble(),
//         hasRdi: json["hasRDI"],
//         daily: json["daily"].toDouble(),
//         unit: unitValues.map[json["unit"]],
//         sub: json["sub"] == null ? null : List<Digest>.from(json["sub"].map((x) => Digest.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "label": label,
//         "tag": tag,
//         "schemaOrgTag": schemaOrgTag == null ? null : schemaOrgTag,
//         "total": total,
//         "hasRDI": hasRdi,
//         "daily": daily,
//         "unit": unitValues.reverse[unit],
//         "sub": sub == null ? null : List<dynamic>.from(sub!.map((x) => x.toJson())),
//     };
// }

// enum Unit { G, MG, UNIT_G, EMPTY, KCAL }

// final unitValues = EnumValues({
//     "%": Unit.EMPTY,
//     "g": Unit.G,
//     "kcal": Unit.KCAL,
//     "mg": Unit.MG,
//     "µg": Unit.UNIT_G
// });

// class Ingredient {
//     Ingredient({
//         this.text,
//         this.quantity,
//         this.measure,
//         this.food,
//         this.weight,
//         this.foodCategory,
//         this.foodId,
//         this.image,
//     });

//     String? text;
//     double? quantity;
//     String? measure;
//     String? food;
//     double? weight;
//     String? foodCategory;
//     String? foodId;
//     String? image;

//     factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
//         text: json["text"],
//         quantity: json["quantity"].toDouble(),
//         measure: json["measure"] == null ? null : json["measure"],
//         food: json["food"],
//         weight: json["weight"].toDouble(),
//         foodCategory: json["foodCategory"],
//         foodId: json["foodId"],
//         image: json["image"],
//     );

//     Map<String, dynamic> toJson() => {
//         "text": text,
//         "quantity": quantity,
//         "measure": measure == null ? null : measure,
//         "food": food,
//         "weight": weight,
//         "foodCategory": foodCategory,
//         "foodId": foodId,
//         "image": image,
//     };
// }

// class Total {
//     Total({
//         this.label,
//         this.quantity,
//         this.unit,
//     });

//     String? label;
//     double? quantity;
//     Unit? unit;

//     factory Total.fromJson(Map<String, dynamic> json) => Total(
//         label: json["label"],
//         quantity: json["quantity"].toDouble(),
//         unit: unitValues.map[json["unit"]],
//     );

//     Map<String, dynamic> toJson() => {
//         "label": label,
//         "quantity": quantity,
//         "unit": unitValues.reverse[unit],
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String>? reverseMap;

//     EnumValues({required this.map , required this.reverseMap});

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap!;
//     }
// }

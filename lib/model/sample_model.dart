// class Data {
//   String? restaurantId;
//   String? restaurantName;
//   String? restaurantImage;
//   String? tableId;
//   String? tableName;
//   String? branchName;
//   String? nexturl;
//   List<TableMenuList>? tableMenuList;

//   Data(
//       {this.restaurantId,
//       this.restaurantName,
//       this.restaurantImage,
//       this.tableId,
//       this.tableName,
//       this.branchName,
//       this.nexturl,
//       this.tableMenuList});

//   Data.fromJson(Map<String, dynamic> json) {
//     restaurantId = json['restaurant_id'];
//     restaurantName = json['restaurant_name'];
//     restaurantImage = json['restaurant_image'];
//     tableId = json['table_id'];
//     tableName = json['table_name'];
//     branchName = json['branch_name'];
//     nexturl = json['nexturl'];
//     if (json['table_menu_list'] != null) {
//       tableMenuList = <TableMenuList>[];
//       json['table_menu_list'].forEach((v) {
//         tableMenuList!.add(TableMenuList.fromJson(v));
//       });
//     }
//   }
// }

// class TableMenuList {
//   String? menuCategory;
//   String? menuCategoryId;
//   String? menuCategoryImage;
//   String? nexturl;
//   List<CategoryDishes>? categoryDishes;

//   TableMenuList(
//       {this.menuCategory,
//       this.menuCategoryId,
//       this.menuCategoryImage,
//       this.nexturl,
//       this.categoryDishes});

//   TableMenuList.fromJson(Map<String, dynamic> json) {
//     menuCategory = json['menu_category'];
//     menuCategoryId = json['menu_category_id'];
//     menuCategoryImage = json['menu_category_image'];
//     nexturl = json['nexturl'];
//     if (json['category_dishes'] != null) {
//       categoryDishes = <CategoryDishes>[];
//       json['category_dishes'].forEach((v) {
//         categoryDishes!.add(CategoryDishes.fromJson(v));
//       });
//     }
//   }
// }

// class CategoryDishes {
//   String? dishId;
//   String? dishName;
//   double? dishPrice;
//   String? dishImage;
//   String? dishCurrency;
//   int? dishCalories;
//   String? dishDescription;
//   bool? dishAvailability;
//   int? dishType;
//   String? nexturl;
//   List<AddonCat>? addonCat;

//   CategoryDishes(
//       {this.dishId,
//       this.dishName,
//       this.dishPrice,
//       this.dishImage,
//       this.dishCurrency,
//       this.dishCalories,
//       this.dishDescription,
//       this.dishAvailability,
//       this.dishType,
//       this.nexturl,
//       this.addonCat});

//   CategoryDishes.fromJson(Map<String, dynamic> json) {
//     dishId = json['dish_id'];
//     dishName = json['dish_name'];
//     dishPrice = json['dish_price'];
//     dishImage = json['dish_image'];
//     dishCurrency = json['dish_currency'];
//     dishCalories = json['dish_calories'];
//     dishDescription = json['dish_description'];
//     dishAvailability = json['dish_Availability'];
//     dishType = json['dish_Type'];
//     nexturl = json['nexturl'];
//     if (json['addonCat'] != null) {
//       addonCat = <AddonCat>[];
//       json['addonCat'].forEach((v) {
//         addonCat!.add(AddonCat.fromJson(v));
//       });
//     }
//   }
// }

// class AddonCat {
//   String? addonCategory;
//   String? addonCategoryId;
//   int? addonSelection;
//   String? nexturl;
//   List<Addons>? addons;

//   AddonCat(
//       {this.addonCategory,
//       this.addonCategoryId,
//       this.addonSelection,
//       this.nexturl,
//       this.addons});

//   AddonCat.fromJson(Map<String, dynamic> json) {
//     addonCategory = json['addon_category'];
//     addonCategoryId = json['addon_category_id'];
//     addonSelection = json['addon_selection']; 
//     nexturl = json['nexturl'];
//     if (json['addons'] != null) {
//       addons = <Addons>[];
//       json['addons'].forEach((v) {
//         addons!.add(new Addons.fromJson(v));
//       });
//     }
//   }
// }

// class Addons {
//   String? dishId;
//   String? dishName;
//   int? dishPrice;
//   String? dishImage;
//   String? dishCurrency;
//   int? dishCalories;
//   String? dishDescription;
//   bool? dishAvailability;
//   int? dishType;

//   Addons(
//       {this.dishId,
//       this.dishName,
//       this.dishPrice,
//       this.dishImage,
//       this.dishCurrency,
//       this.dishCalories,
//       this.dishDescription,
//       this.dishAvailability,
//       this.dishType});

//   Addons.fromJson(Map<String, dynamic> json) {
//     dishId = json['dish_id'];
//     dishName = json['dish_name'];
//     dishPrice = json['dish_price'];
//     dishImage = json['dish_image'];
//     dishCurrency = json['dish_currency'];
//     dishCalories = json['dish_calories'];
//     dishDescription = json['dish_description'];
//     dishAvailability = json['dish_Availability'];
//     dishType = json['dish_Type'];
//   }
// }

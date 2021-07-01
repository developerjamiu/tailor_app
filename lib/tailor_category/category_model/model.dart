class CategoryModel {
  List<Category> category;

  CategoryModel({this.category});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = [];
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class Category {
  String categoryName;
  List image;

  Category({this.categoryName, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'] == null ? null : json['category_name'];
    if (json['image'] != null) {
      image = [];
      json['image'].forEach((v) {
        image.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    if (this.image != null) {
      data['image'] = this.image.map((v) => v).toList();
    }
    return data;
  }
}
// To parse this JSON data, do
//
//     final categoryWiseModel = categoryWiseModelFromJson(jsonString);

import 'dart:convert';

CategoryWiseModel categoryWiseModelFromJson(String str) => CategoryWiseModel.fromJson(json.decode(str));

String categoryWiseModelToJson(CategoryWiseModel data) => json.encode(data.toJson());

class CategoryWiseModel {
    CategoryWiseModel({
        this.data,
        this.success,
        this.status,
    });

    List<Category> data;
    bool success;
    int status;

    factory CategoryWiseModel.fromJson(Map<String, dynamic> json) => CategoryWiseModel(
        data: List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
        success: json["success"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "status": status,
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.banner,
        this.icon,
        this.numberOfChildren,
        this.categorize,
    });

    int id;
    String name;
    String banner;
    String icon;
    int numberOfChildren;
    List<Categorize> categorize;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        banner: json["banner"],
        icon: json["icon"],
        numberOfChildren: json["number_of_children"],
        categorize: List<Categorize>.from(json["categorize"].map((x) => Categorize.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "banner": banner,
        "icon": icon,
        "number_of_children": numberOfChildren,
        "categorize": List<dynamic>.from(categorize.map((x) => x.toJson())),
    };
}

class Categorize {
    Categorize({
        this.id,
        this.parentId,
        this.level,
        this.name,
        this.orderLevel,
        this.commisionRate,
        this.banner,
        this.icon,
        this.featured,
        this.top,
        this.digital,
        this.slug,
        this.metaTitle,
        this.metaDescription,
        this.createdAt,
        this.updatedAt,
        this.categoryTranslations,
        this.products,
    });

    int id;
    int parentId;
    int level;
    String name;
    int orderLevel;
    int commisionRate;
    String banner;
    String icon;
    int featured;
    int top;
    int digital;
    String slug;
    String metaTitle;
    dynamic metaDescription;
    DateTime createdAt;
    DateTime updatedAt;
    List<CategoryTranslation> categoryTranslations;
    List<Product> products;

    factory Categorize.fromJson(Map<String, dynamic> json) => Categorize(
        id: json["id"],
        parentId: json["parent_id"],
        level: json["level"],
        name: json["name"],
        orderLevel: json["order_level"],
        commisionRate: json["commision_rate"],
        banner: json["banner"],
        icon: json["icon"],
        featured: json["featured"],
        top: json["top"],
        digital: json["digital"],
        slug: json["slug"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryTranslations: List<CategoryTranslation>.from(json["category_translations"].map((x) => CategoryTranslation.fromJson(x))),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "level": level,
        "name": name,
        "order_level": orderLevel,
        "commision_rate": commisionRate,
        "banner": banner,
        "icon": icon,
        "featured": featured,
        "top": top,
        "digital": digital,
        "slug": slug,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category_translations": List<dynamic>.from(categoryTranslations.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class CategoryTranslation {
    CategoryTranslation({
        this.id,
        this.categoryId,
        this.name,
        this.lang,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int categoryId;
    String name;
    Lang lang;
    DateTime createdAt;
    DateTime updatedAt;

    factory CategoryTranslation.fromJson(Map<String, dynamic> json) => CategoryTranslation(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        lang: langValues.map[json["lang"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "lang": langValues.reverse[lang],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum Lang { EN }

final langValues = EnumValues({
    "en": Lang.EN
});

class Product {
    Product({
        this.id,
        this.name,
        this.addedBy,
        this.userId,
        this.categoryId,
        this.brandId,
        this.photos,
        this.thumbnailImg,
        this.videoProvider,
        this.videoLink,
        this.tags,
        this.description,
        this.unitPrice,
        this.purchasePrice,
        this.variantProduct,
        this.attributes,
        this.choiceOptions,
        this.colors,
        this.variations,
        this.todaysDeal,
        this.published,
        this.approved,
        this.stockVisibilityState,
        this.cashOnDelivery,
        this.featured,
        this.sellerFeatured,
        this.currentStock,
        this.unit,
        this.weight,
        this.minQty,
        this.lowStockQuantity,
        this.discount,
        this.discountType,
        this.discountStartDate,
        this.discountEndDate,
        this.tax,
        this.taxType,
        this.shippingType,
        this.shippingCost,
        this.isQuantityMultiplied,
        this.estShippingDays,
        this.numOfSale,
        this.metaTitle,
        this.metaDescription,
        this.metaImg,
        this.pdf,
        this.slug,
        this.rating,
        this.barcode,
        this.digital,
        this.auctionProduct,
        this.fileName,
        this.filePath,
        this.externalLink,
        this.externalLinkBtn,
        this.wholesaleProduct,
        this.createdAt,
        this.updatedAt,
        this.productTranslations,
        this.taxes,
    });

    int id;
    String name;
    AddedBy addedBy;
    int userId;
    int categoryId;
    int brandId;
    String photos;
    String thumbnailImg;
    VideoProvider videoProvider;
    dynamic videoLink;
    Tags tags;
    String description;
    double unitPrice;
    dynamic purchasePrice;
    int variantProduct;
    Attributes attributes;
    ChoiceOptions choiceOptions;
    String colors;
    dynamic variations;
    int todaysDeal;
    int published;
    int approved;
    StockVisibilityState stockVisibilityState;
    int cashOnDelivery;
    int featured;
    int sellerFeatured;
    int currentStock;
    Unit unit;
    double weight;
    int minQty;
    int lowStockQuantity;
    int discount;
    Type discountType;
    dynamic discountStartDate;
    dynamic discountEndDate;
    dynamic tax;
    dynamic taxType;
    ShippingType shippingType;
    int shippingCost;
    int isQuantityMultiplied;
    dynamic estShippingDays;
    int numOfSale;
    String metaTitle;
    String metaDescription;
    String metaImg;
    dynamic pdf;
    String slug;
    int rating;
    dynamic barcode;
    int digital;
    int auctionProduct;
    dynamic fileName;
    dynamic filePath;
    dynamic externalLink;
    dynamic externalLinkBtn;
    int wholesaleProduct;
    DateTime createdAt;
    DateTime updatedAt;
    List<ProductTranslation> productTranslations;
    List<Tax> taxes;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        addedBy: addedByValues.map[json["added_by"]],
        userId: json["user_id"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        photos: json["photos"],
        thumbnailImg: json["thumbnail_img"],
        videoProvider: videoProviderValues.map[json["video_provider"]],
        videoLink: json["video_link"],
        tags: tagsValues.map[json["tags"]],
        description: json["description"] == null ? null : json["description"],
        unitPrice: json["unit_price"].toDouble(),
        purchasePrice: json["purchase_price"],
        variantProduct: json["variant_product"],
        attributes: attributesValues.map[json["attributes"]],
        choiceOptions: choiceOptionsValues.map[json["choice_options"]],
        colors: json["colors"],
        variations: json["variations"],
        todaysDeal: json["todays_deal"],
        published: json["published"],
        approved: json["approved"],
        stockVisibilityState: stockVisibilityStateValues.map[json["stock_visibility_state"]],
        cashOnDelivery: json["cash_on_delivery"],
        featured: json["featured"],
        sellerFeatured: json["seller_featured"],
        currentStock: json["current_stock"],
        unit: unitValues.map[json["unit"]],
        weight: json["weight"].toDouble(),
        minQty: json["min_qty"],
        lowStockQuantity: json["low_stock_quantity"],
        discount: json["discount"],
        discountType: typeValues.map[json["discount_type"]],
        discountStartDate: json["discount_start_date"],
        discountEndDate: json["discount_end_date"],
        tax: json["tax"],
        taxType: json["tax_type"],
        shippingType: shippingTypeValues.map[json["shipping_type"]],
        shippingCost: json["shipping_cost"],
        isQuantityMultiplied: json["is_quantity_multiplied"],
        estShippingDays: json["est_shipping_days"],
        numOfSale: json["num_of_sale"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaImg: json["meta_img"],
        pdf: json["pdf"],
        slug: json["slug"],
        rating: json["rating"],
        barcode: json["barcode"],
        digital: json["digital"],
        auctionProduct: json["auction_product"],
        fileName: json["file_name"],
        filePath: json["file_path"],
        externalLink: json["external_link"],
        externalLinkBtn: json["external_link_btn"],
        wholesaleProduct: json["wholesale_product"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        productTranslations: List<ProductTranslation>.from(json["product_translations"].map((x) => ProductTranslation.fromJson(x))),
        taxes: List<Tax>.from(json["taxes"].map((x) => Tax.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "added_by": addedByValues.reverse[addedBy],
        "user_id": userId,
        "category_id": categoryId,
        "brand_id": brandId,
        "photos": photos,
        "thumbnail_img": thumbnailImg,
        "video_provider": videoProviderValues.reverse[videoProvider],
        "video_link": videoLink,
        "tags": tagsValues.reverse[tags],
        "description": description == null ? null : description,
        "unit_price": unitPrice,
        "purchase_price": purchasePrice,
        "variant_product": variantProduct,
        "attributes": attributesValues.reverse[attributes],
        "choice_options": choiceOptionsValues.reverse[choiceOptions],
        "colors": colors,
        "variations": variations,
        "todays_deal": todaysDeal,
        "published": published,
        "approved": approved,
        "stock_visibility_state": stockVisibilityStateValues.reverse[stockVisibilityState],
        "cash_on_delivery": cashOnDelivery,
        "featured": featured,
        "seller_featured": sellerFeatured,
        "current_stock": currentStock,
        "unit": unitValues.reverse[unit],
        "weight": weight,
        "min_qty": minQty,
        "low_stock_quantity": lowStockQuantity,
        "discount": discount,
        "discount_type": typeValues.reverse[discountType],
        "discount_start_date": discountStartDate,
        "discount_end_date": discountEndDate,
        "tax": tax,
        "tax_type": taxType,
        "shipping_type": shippingTypeValues.reverse[shippingType],
        "shipping_cost": shippingCost,
        "is_quantity_multiplied": isQuantityMultiplied,
        "est_shipping_days": estShippingDays,
        "num_of_sale": numOfSale,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_img": metaImg,
        "pdf": pdf,
        "slug": slug,
        "rating": rating,
        "barcode": barcode,
        "digital": digital,
        "auction_product": auctionProduct,
        "file_name": fileName,
        "file_path": filePath,
        "external_link": externalLink,
        "external_link_btn": externalLinkBtn,
        "wholesale_product": wholesaleProduct,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product_translations": List<dynamic>.from(productTranslations.map((x) => x.toJson())),
        "taxes": List<dynamic>.from(taxes.map((x) => x.toJson())),
    };
}

enum AddedBy { ADMIN }

final addedByValues = EnumValues({
    "admin": AddedBy.ADMIN
});

enum Attributes { THE_1 }

final attributesValues = EnumValues({
    "[\"1\"]": Attributes.THE_1
});

enum ChoiceOptions { ATTRIBUTE_ID_1_VALUES_S_M_L_XL_XXL, ATTRIBUTE_ID_1_VALUES_L_XL_XXL, ATTRIBUTE_ID_1_VALUES_M_L_XL_XXL, ATTRIBUTE_ID_1_VALUES_S_M_L_XL, ATTRIBUTE_ID_1_VALUES_S_M_L_XXL }

final choiceOptionsValues = EnumValues({
    "[{\"attribute_id\":\"1\",\"values\":[\"L\",\"XL\",\"XXL\"]}]": ChoiceOptions.ATTRIBUTE_ID_1_VALUES_L_XL_XXL,
    "[{\"attribute_id\":\"1\",\"values\":[\"M\",\"L\",\"XL\",\"XXL\"]}]": ChoiceOptions.ATTRIBUTE_ID_1_VALUES_M_L_XL_XXL,
    "[{\"attribute_id\":\"1\",\"values\":[\"S\",\"M\",\"L\",\"XL\"]}]": ChoiceOptions.ATTRIBUTE_ID_1_VALUES_S_M_L_XL,
    "[{\"attribute_id\":\"1\",\"values\":[\"S\",\"M\",\"L\",\"XL\",\"XXL\"]}]": ChoiceOptions.ATTRIBUTE_ID_1_VALUES_S_M_L_XL_XXL,
    "[{\"attribute_id\":\"1\",\"values\":[\"S\",\"M\",\"L\",\"XXL\"]}]": ChoiceOptions.ATTRIBUTE_ID_1_VALUES_S_M_L_XXL
});

enum Type { AMOUNT }

final typeValues = EnumValues({
    "amount": Type.AMOUNT
});

class ProductTranslation {
    ProductTranslation({
        this.id,
        this.productId,
        this.name,
        this.unit,
        this.description,
        this.lang,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int productId;
    String name;
    Unit unit;
    String description;
    Lang lang;
    DateTime createdAt;
    DateTime updatedAt;

    factory ProductTranslation.fromJson(Map<String, dynamic> json) => ProductTranslation(
        id: json["id"],
        productId: json["product_id"],
        name: json["name"],
        unit: unitValues.map[json["unit"]],
        description: json["description"] == null ? null : json["description"],
        lang: langValues.map[json["lang"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": name,
        "unit": unitValues.reverse[unit],
        "description": description == null ? null : description,
        "lang": langValues.reverse[lang],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum Unit { PC }

final unitValues = EnumValues({
    "pc": Unit.PC
});

enum ShippingType { FREE }

final shippingTypeValues = EnumValues({
    "free": ShippingType.FREE
});

enum StockVisibilityState { QUANTITY }

final stockVisibilityStateValues = EnumValues({
    "quantity": StockVisibilityState.QUANTITY
});

enum Tags { EMPTY, KURTIS }

final tagsValues = EnumValues({
    "": Tags.EMPTY,
    "kurtis": Tags.KURTIS
});

class Tax {
    Tax({
        this.id,
        this.productId,
        this.taxId,
        this.tax,
        this.taxType,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int productId;
    int taxId;
    int tax;
    Type taxType;
    DateTime createdAt;
    DateTime updatedAt;

    factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        id: json["id"],
        productId: json["product_id"],
        taxId: json["tax_id"],
        tax: json["tax"],
        taxType: typeValues.map[json["tax_type"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "tax_id": taxId,
        "tax": tax,
        "tax_type": typeValues.reverse[taxType],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum VideoProvider { YOUTUBE }

final videoProviderValues = EnumValues({
    "youtube": VideoProvider.YOUTUBE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

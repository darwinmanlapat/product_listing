class ProductRoutePath {
  final int? id;
  final bool isUnknown;

  ProductRoutePath.productList()
      : id = null,
        isUnknown = false;

  ProductRoutePath.productDetails(this.id) : isUnknown = false;

  ProductRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isProductListPage => id == null;

  bool get isProductDetailsPage => id != null;
}

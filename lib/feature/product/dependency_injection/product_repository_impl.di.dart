import 'package:product_listing/feature/product/data/repository/repository.dart';

import 'product_remote_source.di.dart';

final productRepositoryDI =
    ProductRepositoryImpl(remoteSource: productRemoteSourceDI);

import 'package:product_listing/core/services/services.dart';
import 'package:product_listing/feature/product/data/data_sources/remote/remote.dart';

final productRemoteSourceDI = ProductRemoteSource(httpClient: dioClient);

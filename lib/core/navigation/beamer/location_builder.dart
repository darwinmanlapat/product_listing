import 'package:beamer/beamer.dart';
import 'package:product_listing/core/navigation/beamer/locations/locations.dart';

final locationBuilder = BeamerLocationBuilder(
  beamLocations: [
    ProductsLocation(),
    ProductLocation(),
  ],
);

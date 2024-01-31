import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing/app.dart';
import 'package:product_listing/feature/product/dependency_injection/product_repository_impl.di.dart';
import 'package:product_listing/feature/product/presentation/blocs/product/product_bloc.dart';
import 'package:product_listing/feature/product/presentation/blocs/selected_product/selected_product_bloc.dart';

import 'core/config/config.dart';
import 'core/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.instance.initialize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = const SimpleBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(repository: productRepositoryDI)
            ..add(
              GetProducts(),
            ),
        ),
        BlocProvider<SelectedProductBloc>(
          create: (context) =>
              SelectedProductBloc(repository: productRepositoryDI),
        ),
      ],
      child: const ProductListingApp(),
    ),
  );
}

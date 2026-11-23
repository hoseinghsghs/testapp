import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/api_client.dart';
import 'features/products/data/repositories/product_repository.dart';
import 'features/products/presentation/cubit/product_cubit.dart';
import 'features/products/presentation/pages/product_page.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        // 1. ساخت ApiClient
        RepositoryProvider<ApiClient>(create: (context) => ApiClient()),

        // 2. ساخت ProductRepository
        RepositoryProvider<ProductRepository>(
          create: (context) {
            return ProductRepository(context.read<ApiClient>());
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: BlocProvider<ProductCubit>(
        create: (context) {
          return ProductCubit(context.read<ProductRepository>());
        },
        child: const ProductPage(),
      ),
    );
  }
}

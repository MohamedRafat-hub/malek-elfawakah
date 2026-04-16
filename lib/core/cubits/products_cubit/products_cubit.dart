import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductCubit extends Cubit<ProductsState> {
  ProductCubit(this.productRepo) : super(ProductsInitial());

  final ProductRepo productRepo;

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getBestSellingProducts();
    result.fold((failure) {
      emit(ProductsFailure(failure.message));
    }, (products) {
      emit(ProductsSuccess(products));
    });
  }

  Future<void> getProducts() async {
    emit(ProductsLoading());

    var result = await productRepo.getProducts();

    result.fold((failure) {
      emit(ProductsFailure(failure.message));
    }, (products) {
      emit(ProductsSuccess(products));
    });
  }
}

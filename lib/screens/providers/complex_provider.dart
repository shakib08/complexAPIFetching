import 'package:complex/screens/Model/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

class ComplexNotifier extends StateNotifier<AsyncValue<List<complex>>> {
  final ApiService _apiService;

  ComplexNotifier(this._apiService) : super(const AsyncValue.loading()) {
    fetchComplexData();
  }

  Future<void> fetchComplexData() async {
    try {
      final data = await _apiService.fetchComplexData();
      state = AsyncValue.data(data);
    } catch (e, stackTrace) { // Added stackTrace
      state = AsyncValue.error(e, stackTrace); // Pass stackTrace here
    }
  }
}

final apiServiceProvider = Provider((ref) => ApiService());

final complexListProvider =
    StateNotifierProvider<ComplexNotifier, AsyncValue<List<complex>>>((ref) {
  return ComplexNotifier(ref.read(apiServiceProvider));
});

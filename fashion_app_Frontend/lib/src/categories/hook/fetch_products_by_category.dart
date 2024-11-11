// // ignore_for_file: depend_on_referenced_packages
//
// import 'package:fashion/common/utils/environment.dart';
// import 'package:fashion/src/product/hooks/results/products_results.dart';
// import 'package:fashion/src/product/models/products_model.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:http/http.dart' as http;
//
// FetchProducts fetchProductsByCategory(int category) {
//   final products = useState<List<Products>>([]);
//   final isLoading = useState(false);
//   final error = useState<String?>(null);
//
//   Future<void> fetchData() async {
//     isLoading.value = true;
//
//     try {
//       Uri url = Uri.parse(
//           '${Environment.appBaseUrl}/api/products/category/?category=$category');
//
//       final response = await http.get(url);
//
//       if (response.statusCode == 200) {
//         products.value = productsFromJson(response.body);
//       }
//     } catch (e) {
//       error.value = e.toString();
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Side Effect
//   useEffect(() {
//     fetchData();
//     return;
//   }, []);
//
//   // Refetch Function
//   void refetch() {
//     isLoading.value = true;
//     fetchData();
//   }
//
//   // Return values
//   return FetchProducts(
//     products: products.value,
//     isLoading: isLoading.value,
//     error: error.value,
//     refetch: refetch,
//   );
// }

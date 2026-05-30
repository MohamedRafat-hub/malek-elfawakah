
abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? uid}); // General method

  Future<dynamic> getData(
      {required String path, String? documentId, Map<String, dynamic>? query});

  Future<bool> checkIfDataExist(
      {required String path, required String documentId});

  Future<void> updateData(
      {required String path,
      required String documentId,
      required Map<String, dynamic> data});
  Future<void> deleteData({required String path, required String documentId});

  Future<int>getNextOrderNumber({required String path , required String doc});
}

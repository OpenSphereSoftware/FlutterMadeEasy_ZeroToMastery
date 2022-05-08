void main() async {
  DataService dataService = DataService();
  String data = await dataService.getData();
  print(data);
}

class DataService {
  Future<String> _getDataFromCloud() async {
    // get data from cloud -> time
    await Future.delayed(Duration(seconds: 4));
    print("get data finished");
    return "fake data";
  }

  Future<String> _parseDataFromCloud({required String dataFromCloud}) async {
    // parse data from cloud -> time
    await Future.delayed(Duration(seconds: 2));
    print("parse data finished");
    return "parsed data";
  }

  Future<String> getData() async {
     final String dataFromCloud = await _getDataFromCloud();
     final String parsedData = await _parseDataFromCloud(dataFromCloud: dataFromCloud);

    // ! alternative way syntax
    /* final String parsedData =
        await _getDataFromCloud().then((dataFromCloud) async {
      return await _parseDataFromCloud(dataFromCloud: dataFromCloud);
    });*/

    return parsedData;
  }
}

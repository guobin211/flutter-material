const bottomIndex = 'bottomIndex';
Map<String, dynamic> globalData = Map();

initGlobalData() {
  globalData['bottomIndex'] = 0;
}

void setData<T>(String key, T data) {
  globalData[key] = data;
}

dynamic getData(String key) {
  return globalData[key];
}

const bottomIndex = 'bottomIndex';
Map<String, dynamic> globalData = Map();

void setData<T>(String key, T data) {
  globalData[key] = data;
}

dynamic getData(String key) {
  return globalData[key];
}

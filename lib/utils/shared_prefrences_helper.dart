import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefrenceKey{
  static const String mostRecentKey = 'most_recent';
}
void saveLastSuraIndex(int newSuraIndex)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentList = prefs.getStringList(SharedPrefrenceKey.mostRecentKey)?? [];
  if(mostRecentList.contains('$newSuraIndex')){
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0, '$newSuraIndex');
  }else {
    mostRecentList.insert(0, '$newSuraIndex');
  }
  if(mostRecentList.length > 5){
    mostRecentList.removeLast();
  }
  await prefs.setStringList(SharedPrefrenceKey.mostRecentKey, mostRecentList);
}

 Future<List<int>> readMostRecentList()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentListAsString = prefs.getStringList(SharedPrefrenceKey.mostRecentKey)??[];
  List<int> mostRecentListAsInt =  mostRecentListAsString.map((element) => int.parse(element),).toList();
  return mostRecentListAsInt;

}
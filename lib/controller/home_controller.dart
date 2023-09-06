import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../model/user.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  int currentImageIndex = 0;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<User> users = [];

  final _database = FirebaseDatabase.instance.ref();

  @override
  void onInit() async {
    super.onInit();
    if(users.isEmpty) isLoading = true;

    _database.child('data').onValue.listen((event) {

      for (var element in (event.snapshot.value as Map<Object?, Object?>).values) {
        users.add(User.fromJson(element as Map<Object?, Object?>));
      }
      isLoading = false;
    });
  }

  leftClicked() {
    if(users[currentIndex].images == null || users[currentIndex].images!.isEmpty) {
      return;
    }
    if(currentImageIndex == 0) {
      return;
    }
    else {
      currentImageIndex--;
      update();
    }
  }

  rightClicked() {
    if(users[currentIndex].images == null || users[currentIndex].images!.isEmpty) {
      return;
    }
    if(currentImageIndex == (users[currentIndex].images?.length ?? 1)-1) {
      return;
    }else {
      currentImageIndex++;
      update();
    }
  }

  nextItem(index) {
    users.removeAt(index);

    if (currentIndex >
        users.length - 1) {
      currentIndex = 0;
    }
    currentImageIndex = 0;
    update();
  }

}
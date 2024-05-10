class CounterController {
  int counter = 0;

  void increment () {
    counter++;
  }

  void decrement () {
    if (counter != 0){
      counter--;
    }
  }


}
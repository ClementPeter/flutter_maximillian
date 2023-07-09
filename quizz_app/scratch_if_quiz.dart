void main() {
  String condition = 'sunday';
//using-if condtions
//   List todo = [
//     1,
//     2,
//     3,
//     if(condition =='sunday')
//     4
//     else
//     5
//   ];
//   print(todo);

  //using ternary
  List todo = [
    1,
    2,
    3,
    condition == 'sunday' ? 4 : 5,
  ];
  print(todo);
}

//Open for extension and close for modification.

// Ex: Wrong example
// class Shape {
//   String type;
//   Shape(this.type);
// }

// class AreaCalculator {
//   //As you can see we need to modify the function to accomadate new shape.
//   double calculateArea(Shape shape) {
//     if (shape.type == "Circle") {
//       return 2.14 * 3.14;
//     } else if (shape.type == "rectangle") {
//       return 4 * 5;
//     } else {
//       return 0;
//     }
//   }
// }

//Ex:Correct example.
//As you can see we dont have to modify the class even if we want to add new function.
//Following OCP leads to creation of interfaces.

abstract interface class Shape {
  double calculateArea();
}

class Circle extends Shape {
  @override
  double calculateArea() {
    return 0;
  }
}

class Square extends Shape {
  @override
  double calculateArea() {
    return 12;
  }
}

class AreaCalculator {
  double calculateArea(Shape shape) {
    return shape.calculateArea();
  }
}

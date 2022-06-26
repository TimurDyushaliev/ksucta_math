abstract class MathUtils {
  static bool validateIntegers(int a, int b, int index) {
    switch (index) {
      case 0:
        return true;
      case 1:
        return b != 0 && a % b == 0;
      case 2:
        return true;
      case 3:
        return !(a - b).isNegative;
      default:
        throw Exception('Invalid index value: $index. Only valid 0..3');
    }
  }

  static bool validateAlgorithm(int a, int b, int c, int index) {
    switch (index) {
      case 0:
        return true;
      case 1:
        if (b != 0 && a % b == 0) {
          return a ~/ b > c;
        } else {
          return false;
        }
      case 2:
        final additionResult = a + b;
        return c != 0 && additionResult % c == 0;
      case 3:
        return a > b;
      default:
        throw Exception('Invalid index value: $index. Only valid 0..3');
    }
  }
}

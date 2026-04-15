class CustomExceptions implements Exception
{
   final String errorMessage;

  CustomExceptions(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}
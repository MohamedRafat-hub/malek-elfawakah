class CustomExceptions implements Exception
{
   final String errormessage;

  CustomExceptions(this.errormessage);

  @override
  String toString() {
    return errormessage;
  }
}
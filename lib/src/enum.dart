enum PhylloEnvironment { development, sandbox, production }

extension PhylloEnvironmentExtension on PhylloEnvironment {
  String get name {
    return toString().split('.').last;
  }
}

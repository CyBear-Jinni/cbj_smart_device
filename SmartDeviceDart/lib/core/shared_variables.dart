


class SharedVariables {

  SharedVariables(String projectRootDirectoryPath) {
    _projectRootDirectoryPath = projectRootDirectoryPath;
    print('PATH: $_projectRootDirectoryPath');
  }

  ///  Save the location of all the files that were created during the snapcraft
  static String _projectRootDirectoryPath;

  static String getProjectRootDirectoryPath() => _projectRootDirectoryPath;
}

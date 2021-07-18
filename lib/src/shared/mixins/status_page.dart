enum StatusPage { none, loading, success, error }

extension StatusPageExt on StatusPage {
  bool get isLoading => this == StatusPage.loading;
  bool get isErro => this == StatusPage.loading;
}

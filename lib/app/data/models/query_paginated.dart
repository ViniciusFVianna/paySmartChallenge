class QueryPaginated<T> {
  int? page;
  List<T>? results;
  int? totalPages;
  int? totalResults;

  QueryPaginated({this.page, this.results, this.totalPages, this.totalResults});

  QueryPaginated.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
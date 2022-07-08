class PaginationFilter {
  int? page;
  String? query;
  int? totalPages;

  PaginationFilter({
    this.page,
    this.query,
    this.totalPages,
});
@override
  String toString() {
    String result = '';

    if(page != null && totalPages != null && page.toString().isNotEmpty && page! <= totalPages!){
      result += '&page=$page';
    }
    if(query != null && query!.isNotEmpty){
      result += '&query=$query';
    }

    return Uri.encodeFull(result);
  }
}
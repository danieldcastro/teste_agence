// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductDto {
  final String imageUrl;
  final String title;
  final String description;
  ProductDto({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  factory ProductDto.empty() =>
      ProductDto(imageUrl: '', title: '', description: '');

  @override
  String toString() =>
      'ProductDto(imageUrl: $imageUrl, title: $title, description: $description)';
}

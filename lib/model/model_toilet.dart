class ToiletItem{
  final String name;
  final String image;
  final int id;
  final bool isSelect;

  ToiletItem({required this.name, required this.image, required this.id, required this.isSelect});

  ToiletItem copyWith({bool? isSelect}) {
    return ToiletItem(
      name: this.name,
      image: this.image,
      id: this.id,
      isSelect: isSelect ?? this.isSelect,
    );
  }
}
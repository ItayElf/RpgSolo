// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Goods {
  final String name;
  final String price;
  final String? description;
  Goods({
    required this.name,
    required this.price,
    this.description,
  });

  Goods copyWith({
    String? name,
    String? price,
    String? description,
  }) {
    return Goods(
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'description': description,
    };
  }

  factory Goods.fromMap(Map<String, dynamic> map) {
    return Goods(
      name: map['name'] as String,
      price: map['price'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Goods.fromJson(String source) =>
      Goods.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Goods(name: $name, price: $price, description: $description)';

  @override
  bool operator ==(covariant Goods other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.description == description;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ description.hashCode;
}

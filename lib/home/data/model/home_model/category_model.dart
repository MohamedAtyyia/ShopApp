import 'package:equatable/equatable.dart';

class AllCategoriesModel extends Equatable {
	final int? id;
	final String? name;
	final String? image;

	const AllCategoriesModel({this.id, this.name, this.image});

	factory AllCategoriesModel.fromJson(Map<String, dynamic> json) => AllCategoriesModel(
				id: json['id'] as int?,
				name: json['name'] as String?,
				image: json['image'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'image': image,
			};

	@override
	List<Object?> get props => [id, name, image];
}

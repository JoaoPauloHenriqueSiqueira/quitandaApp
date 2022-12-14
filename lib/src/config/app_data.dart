import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  "Frutas",
  "Legumes",
  "Lacticineos",
  "Verduras",
  "Carnes",
  "Cereais"
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 1),
  CartItemModel(item: mango, quantity: 1),
  CartItemModel(item: grape, quantity: 4),
];

UserModel user = UserModel(
    name: "João Paulo",
    email: "joao.jp@gmail.com",
    phone: "14996350585",
    cpf: "39228071828",
    password: "");

List<OrderModel> orders = [
  OrderModel(
      id: "asdas1231s",
      cretedDateTime: DateTime.parse("2022-12-08 10:00:10.548"),
      overdueDateTime: DateTime.parse("2022-12-08 10:00:10.548"),
      items: [CartItemModel(item: apple, quantity: 2),CartItemModel(item: mango, quantity: 3)],
      status: 'pending_payment',
      copyAndPaste: "q1w2awe231rw",
      total: 11.0),
  OrderModel(
      id: "hg21rtgber23",
      cretedDateTime: DateTime.parse("2022-12-08 10:00:10.548"),
      overdueDateTime: DateTime.parse("2022-12-08 10:00:10.548"),
      items: [CartItemModel(item: mango, quantity: 4)],
      status: "shipping",
      copyAndPaste: "asd1wd1w123",
      total: 121.0)
];

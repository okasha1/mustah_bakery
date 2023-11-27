class Product {
  final String? name;
  final String? image;
  final String? description;
  final int? price1;
  final int? price2;
  final int? quantity;
  const Product(
      {required this.name,
      required this.image,
      this.description,
      this.price1,
      this.price2,
      this.quantity});
  static const List<Product> popularProducts = [
    Product(
      name: 'Cake',
      image: 'pinkCake.jpg',
      description:
          "Celebrate the birthday of your favorite app with a custom-made cake! We can create a cake in any shape, size, and flavor you choose, and decorate it with the app's logo, colors, and characters.",
      price1: 180,
      price2: 300,
      quantity: 3,
    ),
    Product(
        name: 'Pizza',
        image: 'slice.jpg',
        description:
            "A delicious and versatile food that can be enjoyed by people of all ages,made with fresh, high-quality ingredients and cooked to perfection. \n Order your pizza today!",
        price1: 80,
        price2: 120),
    Product(
        name: 'Jollof Rice',
        image: 'jollof.jpg',
        description:
            "A delicious and savory West African rice dish made with long-grain rice, tomatoes, peppers, onions, spices, and sometimes other vegetables and/or meat. Jollof rice is a popular dish in many West African countries and is often served for parties and gatherings. Order your jollof rice today and enjoy.",
        price1: 40,
        price2: 70),
    Product(
        name: "Cup Cake",
        image: 'cupcake.jpg',
        description:
            "Delicious and moist cakes baked in small, individual molds and decorated with frosting, icing, sprinkles, and other toppings. Cupcakes are a perfect treat for any occasion!",
        price1: 10,
        price2: 13),
    Product(
        name: 'Spring Rolls',
        image: 'springroll.jpg',
        description:
            "Crispy and delicious spring rolls made with a thin pastry sheet wrapped around a savory filling and deep-fried or baked. Spring rolls are a perfect appetizer or snack for any occasion!Order your spring rolls today and enjoy.",
        price1: 15,
        price2: 35),
  ];
  static const List<Product> recommendedProducts = [
    Product(
        name: 'Salad',
        image: 'salad.jpg',
        description:
            "A delicious and healthy dish made with mixed raw or cooked vegetables, fruits, nuts, seeds, grains, meat, poultry, or seafood. Salads are a perfect meal option for any occasion. Order your salad today and enjoy a taste of freshness!",
        price1: 40,
        price2: 75),
    Product(
        name: 'Fried Chips',
        image: 'friedchips.jpg',
        description:
            "Crispy and delicious fried chips made with thinly sliced potatoes and fried in hot oil until golden brown. Fried chips are a perfect snack or side dish for any occasion! Order your fried chips today and enjoy a classic treat!",
        price1: 20,
        price2: 35),
    Product(
        name: 'Pie',
        image: 'pie.jpg',
        description:
            "A delicious and flaky pastry crust filled with a variety of sweet or savory ingredients, baked to perfection. Pies are a classic dessert that can be enjoyed by people of all ages. Order your pie today and indulge in a sweet or savory treat!",
        price1: 20,
        price2: 30),
    Product(
        name: 'Vanilla Cup Cake',
        image: 'cupcake.jpg',
        description:
            "A moist and fluffy vanilla cake topped with sweet and creamy vanilla frosting. A classic dessert that is perfect for any occasion.",
        price1: 15,
        price2: 25)
  ];
  static List<Product> allProducts = popularProducts + recommendedProducts;
}

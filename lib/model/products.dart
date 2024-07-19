class Products {
  final int productId;
  final String image, name, typeproduct, productdescription;
  final int price;

  Products({
    required this.productId,
    required this.image,
    required this.name,
    required this.typeproduct,
    required this.productdescription,
    required this.price,
  });
}

List<Products> products = [
  Products(
    productId: 1,
    image: "assets/images/burger.jpg",
    name: "Cheese Burger",
    typeproduct: "Burger",
    productdescription: "A delicious cheese burger with fresh ingredients. "
        "Perfectly melted cheese, juicy beef patty, fresh lettuce, and tomatoes. "
        "Served with a side of crispy fries.",
    price: 499,
  ),
  Products(
    productId: 2,
    image: "assets/images/burger.jpg",
    name: "Classic Burger",
    typeproduct: "Burger",
    productdescription: "A classic burger with all the traditional toppings. "
        "Juicy beef patty, fresh lettuce, tomatoes, and onions. "
        "Served with a side of crispy fries.",
    price: 499,
  ),
  Products(
    productId: 3,
    image: "assets/images/burgerwithtoma.jpg",
    name: "Shami Burger",
    typeproduct: "Burger",
    productdescription: "A flavorful Shami burger with a blend of spices. "
        "Made with spiced ground beef, fresh lettuce, and tomatoes. "
        "Served with a side of crispy fries.",
    price: 499,
  ),
  Products(
    productId: 4,
    image: "assets/images/burger.jpg",
    name: "Thunder Burger",
    typeproduct: "Burger",
    productdescription: "A massive burger with extra toppings and flavors. "
        "Double beef patties, cheese, bacon, lettuce, and tomatoes. "
        "Served with a side of crispy fries.",
    price: 1050,
  ),
  Products(
    productId: 5,
    image: "assets/images/pizza_chicken.jpg",
    name: "Pepperoni Pizza",
    typeproduct: "Pizza",
    productdescription: "A classic pepperoni pizza with a crispy crust. "
        "Generously topped with pepperoni slices and mozzarella cheese. "
        "Baked to perfection in a wood-fired oven.",
    price: 1050,
  ),
  Products(
    productId: 6,
    image: "assets/images/pizzacheese.jpg",
    name: "Margherita Pizza",
    typeproduct: "Pizza",
    productdescription: "A simple yet delicious Margherita pizza with fresh basil. "
        "Topped with fresh tomatoes, mozzarella cheese, and basil leaves. "
        "Baked to perfection in a wood-fired oven.",
    price: 1050,
  ),
  Products(
    productId: 7,
    image: "assets/images/mixpizzawithtomato.jpg",
    name: "Tandoori Pizza",
    typeproduct: "Pizza",
    productdescription: "A spicy Tandoori pizza with tender chicken and veggies. "
        "Topped with spiced chicken, bell peppers, onions, and mozzarella cheese. "
        "Baked to perfection in a wood-fired oven.",
    price: 1050,
  ),
  Products(
    productId: 8,
    image: "assets/images/pizzacheese.jpg",
    name: "BBQ Chicken Pizza",
    typeproduct: "Pizza",
    productdescription: "A savory BBQ chicken pizza with a tangy sauce. "
        "Topped with BBQ chicken, onions, and mozzarella cheese. "
        "Baked to perfection in a wood-fired oven.",
    price: 1050,
  ),
  Products(
    productId: 9,
    image: "assets/images/shawarma__friedpotatoes.jpg",
    name: "BBQ Chicken Sandwich",
    typeproduct: "Sandwich",
    productdescription: "A savory BBQ chicken sandwich with a tangy sauce. "
        "Topped with BBQ chicken, onions, and mozzarella cheese. "
        "Served with a side of crispy fries.",
    price: 650,
  ),
  Products(
    productId: 10,
    image: "assets/images/delicious_sandwich.jpg",
    name: "Grilled Chicken Sandwich",
    typeproduct: "Sandwich",
    productdescription: "A delicious grilled chicken sandwich with fresh ingredients. "
        "Topped with lettuce, tomatoes, and a special sauce. "
        "Served with a side of crispy fries.",
    price: 650,
  ),
  Products(
    productId: 11,
    image: "assets/images/sideview_sandwich.jpg",
    name: "Club Sandwich",
    typeproduct: "Sandwich",
    productdescription: "A classic club sandwich with layers of turkey, bacon, lettuce, and tomatoes. "
        "Served with a side of crispy fries.",
    price: 750,
  ),
  Products(
    productId: 12,
    image: "assets/images/shawarma__friedpotatoes.jpg",
    name: "Shawarma Sandwich",
    typeproduct: "Sandwich",
    productdescription: "A flavorful shawarma sandwich with marinated chicken, fresh vegetables, and a special sauce. "
        "Served with a side of crispy fries.",
    price: 700,
  ),
  Products(
    productId: 13,
    image: "assets/images/triangle_sandwiches.jpg",
    name: "Veggie Sandwich",
    typeproduct: "Sandwich",
    productdescription: "A healthy veggie sandwich with fresh ingredients. "
        "Topped with lettuce, tomatoes, cucumbers, and a special sauce. "
        "Served with a side of crispy fries.",
    price: 550,
  ),
  Products(
    productId: 14,
    image: "assets/images/clubsandwich_potatoes.jpg",
    name: "Club Sandwich Deluxe",
    typeproduct: "Sandwich",
    productdescription: "A deluxe version of the classic club sandwich with extra toppings and flavors. "
        "Layers of turkey, bacon, lettuce, tomatoes, and a special sauce. "
        "Served with a side of crispy fries.",
    price: 800,
  ),
];

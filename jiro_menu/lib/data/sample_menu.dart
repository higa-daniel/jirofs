import '../models/menu_item.dart';

const List<MenuCategory> sampleCategories = [
  MenuCategory(id: 'entradas', name: 'Entradas'),
  MenuCategory(id: 'pratos', name: 'Sandoburgers'),
  MenuCategory(id: 'sobremesas', name: 'Sobremesas'),
  MenuCategory(id: 'bebidas', name: 'Bebidas'),
];

const List<MenuItem> sampleMenuItems = [
  // Entradas
  MenuItem(
    id: '1',
    name: 'Nori Fries',
    description: 'Batata crocante com pó de alga e sal marinho.',
    price: 30.0,
    categoryId: 'entradas',
  ),
  MenuItem(
    id: '2',
    name: 'Long Fries',
    description: 'Batatas longas no estilo japonês.',
    price: 35.0,
    categoryId: 'entradas',
  ),
  MenuItem(
    id: '3',
    name: 'Berinjela Fries',
    description: 'Berinjela empanada crocante.',
    price: 35.0,
    categoryId: 'entradas',
  ),
  MenuItem(
    id: '4',
    name: 'Quiabo com manteiga de missô',
    description: 'Quiabo tostado com manteiga de missô.',
    price: 30.0,
    categoryId: 'entradas',
  ),
  MenuItem(
    id: '5',
    name: 'Karaage',
    description: 'Frango marinado tradicional japonês.',
    price: 45.0,
    categoryId: 'entradas',
  ),
  MenuItem(
    id: '6',
    name: 'KFC',
    description: 'Frango crocante estilo rua de Seul, molho KFC e picles.',
    price: 45.0,
    categoryId: 'entradas',
  ),
  MenuItem(
    id: '7',
    name: 'Pancetoki',
    description: 'Panceta crocante servida com molho apimentado coreano à parte.',
    price: 50.0,
    categoryId: 'entradas',
  ),
  MenuItem(
    id: '8',
    name: 'Korokke de milho e queijo',
    description: 'Croquete japonês dourado e crocante por fora, cremoso por dentro.',
    price: 30.0,
    categoryId: 'entradas',
  ),
  MenuItem(
    id: '9',
    name: 'Korokke de gyutan',
    description: 'Croquete crocante recheado com gyutan (língua bovina) macia e bem temperada.',
    price: 30.0,
    categoryId: 'entradas',
  ),
  MenuItem(
    id: '10',
    name: 'Takoyaki',
    description:
        'Bolinhas quentes de massa leve com polvo macio no centro. Finalizadas com molho adocicado, maionese japonesa e flocos dançando no vapor.',
    price: 60.0,
    categoryId: 'entradas',
  ),

  // Sandoburgers (pratos)
  MenuItem(
    id: '11',
    name: 'Katsu Sando',
    description: 'Carne suína empanada crocante, picles, molho tonkatsu e pão shokupan tostado.',
    price: 40.0,
    categoryId: 'pratos',
  ),
  MenuItem(
    id: '12',
    name: 'Gyu Katsu Sando',
    description: 'Bife empanado ao ponto, maionese com chimi de nirá e pão shokupan tostado.',
    price: 50.0,
    categoryId: 'pratos',
  ),
  MenuItem(
    id: '13',
    name: 'Tori Katsu Sando',
    description: 'Frango empanado crocante, alface americana, maionese oki e pão shokupan tostado.',
    price: 35.0,
    categoryId: 'pratos',
  ),
  MenuItem(
    id: '14',
    name: 'Bulgergui',
    description:
        '2 burgers angus de 80g, molho bulgogi, alface americana, picles de pepino e pão shokubun com gergelim.',
    price: 40.0,
    categoryId: 'pratos',
  ),
  MenuItem(
    id: '15',
    name: 'Baconzilla',
    description:
        'Duplo burger angus de 100g, bacon crocante, requeijão de corte Fazenda Atalaia, maionese oki e pão shokubun.',
    price: 50.0,
    categoryId: 'pratos',
  ),
  MenuItem(
    id: '16',
    name: 'KFC',
    description: 'Frango crocante no estilo coreano, alface americana, maionese oki e pão shokubun.',
    price: 50.0,
    categoryId: 'pratos',
  ),
  MenuItem(
    id: '17',
    name: 'Oki Salad',
    description:
        'Burger angus, queijo prato artesanal, alface, cebola roxa, picles baby e molho teriyaki da casa no pão shokubun.',
    price: 40.0,
    categoryId: 'pratos',
  ),
  MenuItem(
    id: '18',
    name: 'Pão com ovo',
    description:
        'Ovos cremosos, cebolinha fresca, queijo cheddar inglês, cebolas caramelizadas e maionese de sriracha no pão shokubun quentinho.',
    price: 30.0,
    categoryId: 'pratos',
  ),

  // Sobremesas
  MenuItem(
    id: '19',
    name: 'Choux Cream',
    description: 'Carolina japonesa de casquinha leve e delicada, recheada com creme de baunilha.',
    price: 18.0,
    categoryId: 'sobremesas',
  ),
  MenuItem(
    id: '20',
    name: 'Chocolate pie',
    description: 'Torta japonesa com chocolate meio amargo e intenso.',
    price: 25.0,
    categoryId: 'sobremesas',
  ),

  // Bebidas
  MenuItem(
    id: '21',
    name: 'Brahma claro caldereta',
    description: 'Chopp gelado.',
    price: 12.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '22',
    name: 'Heineken 330ml',
    description: 'Cerveja puro malte premium com sabor equilibrado e leve amargor.',
    price: 10.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '23',
    name: 'Heineken zero 330ml',
    description: 'Versão sem álcool da Heineken, mantendo o sabor característico.',
    price: 12.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '24',
    name: 'Corona 330ml',
    description: 'Cerveja lager mexicana leve e refrescante, ideal com limão.',
    price: 10.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '25',
    name: 'Budweiser 330ml',
    description: 'American lager leve, suave e refrescante.',
    price: 10.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '26',
    name: 'Lagunitas IPA 355ml',
    description: 'India Pale Ale encorpada com notas cítricas e amargor marcante.',
    price: 16.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '27',
    name: 'Água com gás garrafa 500ml',
    description: 'Água Cristal.',
    price: 7.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '28',
    name: 'Água sem gás garrafa 500ml',
    description: 'Água Cristal.',
    price: 7.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '29',
    name: 'Água tônica Schweppes lata 350ml',
    description: 'Água tônica gaseificada com leve amargor cítrico.',
    price: 8.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '30',
    name: 'Coca lata 350ml',
    description: 'Refrigerante cola tradicional lata 350ml.',
    price: 8.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '31',
    name: 'Coca zero lata 350ml',
    description: 'Refrigerante cola zero açúcar lata 350ml.',
    price: 7.9,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '32',
    name: 'Guaraná Antarctica lata 350ml',
    description: 'Refrigerante de guaraná tradicional brasileiro lata 350ml.',
    price: 7.9,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '33',
    name: 'Guaraná Antarctica zero lata 350ml',
    description: 'Refrigerante de guaraná zero açúcar lata 350ml.',
    price: 7.9,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '34',
    name: 'Sprite lata 350ml',
    description: 'Refrigerante sabor limão gaseificado lata 350ml.',
    price: 8.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '35',
    name: 'Fanta lata 350ml',
    description: 'Refrigerante sabor laranja gaseificado lata 350ml.',
    price: 8.0,
    categoryId: 'bebidas',
  ),
  MenuItem(
    id: '36',
    name: 'Suco natural de laranja 350ml',
    description: 'Suco de laranja natural feito na hora, 350ml.',
    price: 15.0,
    categoryId: 'bebidas',
  ),
];

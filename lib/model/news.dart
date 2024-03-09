class News {
  String image;
  String title;
  String description;
  String date;
  int index;
  News({
    required this.image,
    required this.title,
    required this.description,
    required this.date,
    required this.index,
  });
}

List<News> news = [
  News(
    image: 'assets/images/news1.png',
    title: 'Rising NFT Trends: The Latest \nBuzz',
    description:
        'Lorem ipsum dolor sit amet consectetur. Ornare viverra iaculis quam adipiscing vestibulum feugiat. Lobortis odio nisl eu vestibulum.',
    date: 'Nov. 28, 2023',
    index: 1,
  ),
  News(
      image: 'assets/images/news2.png',
      title: 'Blockchain Boosts Supply Chain \nEfficiency',
      description:
          'Lorem ipsum dolor sit amet consectetur. Ornare viverra iaculis quam adipiscing vestibulum feugiat. Lobortis odio nisl eu vestibulum.',
      date: 'Nov. 28, 2023',
      index: 2),
  News(
    image: 'assets/images/news3.png',
    title: 'Rising NFT Trends: The Latest \nBuzz',
    description:
        'Lorem ipsum dolor sit amet consectetur. Ornare viverra iaculis quam adipiscing vestibulum feugiat. Lobortis odio nisl eu vestibulum.',
    date: 'Nov. 28, 2023',
    index: 3,
  ),
  News(
    image: 'assets/images/news4.png',
    title: 'Rising NFT Trends: The Latest \nBuzz',
    description:
        'Lorem ipsum dolor sit amet consectetur. Ornare viverra iaculis quam adipiscing vestibulum feugiat. Lobortis odio nisl eu vestibulum.',
    date: 'Nov. 28, 2023',
    index: 4,
  ),
  News(
    image: 'assets/images/news5.png',
    title: 'Rising NFT Trends: The Latest \nBuzz',
    description:
        'Lorem ipsum dolor sit amet consectetur. Ornare viverra iaculis quam adipiscing vestibulum feugiat. Lobortis odio nisl eu vestibulum.',
    date: 'Nov. 28, 2023',
    index: 5,
  )
];

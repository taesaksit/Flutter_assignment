import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Menu'),
      ),
      body: ListView(
        children: [
          // Pizza Item
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(
                  'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pizza',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$12.99',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Action when the button is pressed
                        },
                        child: Text('Add to Cart'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Cake Item
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(
                  'https://cdn.pixabay.com/photo/2023/09/04/20/39/cake-8233676_1280.jpg',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cake',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$7.99',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Action when the button is pressed
                        },
                        child: Text('Add to Cart'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Coffee Item
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(
                  'https://cdn.pixabay.com/photo/2019/08/06/11/09/coffee-4388065_640.jpg',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Coffee',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$3.50',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Action when the button is pressed
                        },
                        child: Text('Add to Cart'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Ice Cream Item
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(
                  'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375_640.jpg',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ice Cream',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$4.99',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Action when the button is pressed
                        },
                        child: Text('Add to Cart'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

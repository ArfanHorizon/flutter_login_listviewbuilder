import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sopiii',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/list_barang': (context) => ListDataPage(),
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sopiii'),
        backgroundColor: Colors.orange[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange, Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcPXcrdMMvHq1DiEioRardXCZQ7P5yI0MLBg&usqp=CAU',
                      height: 100.0,
                      width: 180.0,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_usernameController.text == 'admin' &&
                            _passwordController.text == 'password') {
                          Navigator.pushNamed(context, '/list_barang');
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Login Failed'),
                                content: Text(
                                    'Invalid username or password. Please try again.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(237, 255, 149, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListDataPage extends StatefulWidget {
  @override
  _ListDataPageState createState() => _ListDataPageState();
}

class _ListDataPageState extends State<ListDataPage> {
  final List<Map<String, String>> films = [
    {
      'title': 'monitor',
      'harga': '4.8',
      'imageUrl': 'https://example.com/inception.jpg',
      'description': 'A mind-bending action film.',
    },
    {
      'title': 'VGA',
      'harga': '4.9',
      'imageUrl': 'https://example.com/shawshank_redemption.jpg',
      'description': 'A tale of hope and redemption.',
    },
    {
      'title': 'Keyboard',
      'harga': '4.8',
      'imageUrl': 'https://example.com/inception.jpg',
      'description': 'A mind-bending action film.',
    },
    {
      'title': 'Gamepad',
      'harga': '4.9',
      'imageUrl': 'https://example.com/shawshank_redemption.jpg',
      'description': 'A tale of hope and redemption.',
    },
    {
      'title': 'LCD',
      'harga': '4.8',
      'imageUrl': 'https://example.com/inception.jpg',
      'description': 'A mind-bending action film.',
    },
    {
      'title': 'Mouse',
      'harga': '4.9',
      'imageUrl': 'https://example.com/shawshank_redemption.jpg',
      'description': 'A tale of hope and redemption.',
    },
    {
      'title': 'Memory',
      'harga': '4.8',
      'imageUrl': 'https://example.com/inception.jpg',
      'description': 'A mind-bending action film.',
    },
    {
      'title': 'headset',
      'harga': '4.9',
      'imageUrl': 'https://example.com/shawshank_redemption.jpg',
      'description': 'A tale of hope and redemption.',
    },
    {
      'title': 'charger',
      'harga': '4.8',
      'imageUrl': 'https://example.com/inception.jpg',
      'description': 'A mind-bending action film.',
    },
    {
      'title': 'Printer',
      'harga': '4.9',
      'imageUrl': 'https://example.com/shawshank_redemption.jpg',
      'description': 'A tale of hope and redemption.',
    },

    // Add more films as needed
  ];

  // Function to show a delete confirmation dialog
  Future<void> showDeleteConfirmationDialog(int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Product'),
          content: Text('Are you sure you want to delete this Product?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Perform the delete operation
                setState(() {
                  films.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcPXcrdMMvHq1DiEioRardXCZQ7P5yI0MLBg&usqp=CAU',
              height: 30.0, // Sesuaikan tinggi logo
            ),
            SizedBox(width: 8.0), // Berikan sedikit ruang antara logo dan teks
            Text(
              'Product List',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(237, 255, 149, 0),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Tambahkan logika pencarian di sini
              // Misalnya, munculkan dialog pencarian atau navigasi ke halaman pencarian
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Search'),
                    content: TextField(
                      // Tambahkan controller atau logika pencarian
                      decoration: InputDecoration(
                        hintText: 'Search...',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Logika pencarian
                          Navigator.of(context).pop();
                        },
                        child: Text('Search'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(237, 255, 149, 0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcPXcrdMMvHq1DiEioRardXCZQ7P5yI0MLBg&usqp=CAU',
                    height: 60.0, // Sesuaikan tinggi logo
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Sopiii',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Product List'),
              onTap: () {
                Navigator.pop(context);
                // Ganti sesuai kebutuhan, misalnya: Navigator.pushNamed(context, '/list_barang');
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: films.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              title: Text(
                '${index + 1}. ${films[index]['title']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Price: \$${films[index]['harga']}'),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  showDeleteConfirmationDialog(index);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailFilmPage(
                      filmTitle: films[index]['title']!,
                      imageUrl: films[index]['imageUrl']!,
                      description: films[index]['description']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFilmPage(),
            ),
          );

          // Check if a new film was added
          if (result != null && result is Map<String, String>) {
            setState(() {
              films.add(result);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(237, 255, 149, 0),
      ),
    );
  }
}

class AddFilmPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: const Color.fromARGB(237, 255, 149, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'title'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _ratingController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Validate and save the new film data
                if (_titleController.text.isNotEmpty &&
                    _ratingController.text.isNotEmpty &&
                    _imageUrlController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    {
                      'title': _titleController.text,
                      'harga': _ratingController
                          .text, // Use 'harga' instead of 'Price'
                      'imageUrl': _imageUrlController.text,
                      'description': _descriptionController.text,
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please fill in all fields.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailFilmPage extends StatelessWidget {
  final String filmTitle;
  final String imageUrl;
  final String description; // Tambahkan variabel description

  DetailFilmPage({
    required this.filmTitle,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
        backgroundColor: const Color.fromARGB(237, 255, 149, 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Product Name: $filmTitle',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.network(
              imageUrl,
              width: 500,
              height: 400,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  );
                }
              },
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Text('Failed to load image');
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Deskripsi: $description', // Tampilkan deskripsi di sini
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

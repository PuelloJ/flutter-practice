class Constants {

  Constants._(); // Constrcutor privado para evitar instancias de esta clase

  static const String path = "assets/images/";
  static const List<Map<String, dynamic>> localImageData = [
    {
      'imageUrl': "${path}ilustration.jpg",
      'name': 'Sunset Over Mountains',
      'favorite': true,
      'author': 'John Doe',
      'source': 'Freepik',
      'description':
          'A beautiful sunset casting a golden hue over the majestic mountains, creating a serene and picturesque landscape.',
      'date': '2023-01-01',
      'location': 'Rocky Mountains, USA',
      'camera': 'Canon EOS 5D Mark IV',
    },
    {
      'imageUrl': "${path}ilustration1.jpg",
      'name': 'Serene Forest',
      'favorite': false,
      'author': 'Jane Smith',
      'source': 'Freepik',
      'description':
          'A tranquil forest with towering trees and a peaceful ambiance, perfect for a quiet retreat into nature.',
      'date': '2023-02-15',
      'location': 'Black Forest, Germany',
      'camera': 'Nikon D850',
    },
    {
      'imageUrl': "${path}ilustration2.jpg",
      'name': 'Snowy Mountain',
      'favorite': true,
      'author': 'Mike Johnson',
      'source': 'Freepik',
      'description':
          'A majestic mountain covered in pristine snow, standing tall and proud against the clear blue sky.',
      'date': '2023-03-10',
      'location': 'Alps, Switzerland',
      'camera': 'Sony Alpha 7R IV',
    },
    {
      'imageUrl': "${path}ilustration3.jpg",
      'name': 'Vast Ocean',
      'favorite': true,
      'author': 'Emily Davis',
      'source': 'Freepik',
      'description':
          'A vast ocean with crystal clear blue water, stretching out to the horizon and inviting a sense of calm and wonder.',
      'date': '2023-04-05',
      'location': 'Pacific Ocean',
      'camera': 'Fujifilm X-T4',
    },
    {
      'imageUrl': "${path}ilustration4.jpg",
      'name': 'City Skyline',
      'favorite': true,
      'author': 'Chris Brown',
      'source': 'Freepik',
      'description':
          'A bustling city skyline illuminated by the lights of skyscrapers, capturing the vibrant energy of urban life at night.',
      'date': '2023-05-20',
      'location': 'New York City, USA',
      'camera': 'Canon EOS R5',
    },
    {
      'imageUrl': "${path}ilustration5.jpg",
      'name': 'Desert Dunes',
      'favorite': false,
      'author': 'Anna White',
      'source': 'Freepik',
      'description':
          'A vast desert with rolling sand dunes, creating a mesmerizing and ever-changing landscape under the scorching sun.',
      'date': '2023-06-15',
      'location': 'Sahara Desert, Africa',
      'camera': 'Nikon Z7 II',
    },
    {
      'imageUrl': "${path}ilustration6.jpg",
      'name': 'Calm River',
      'favorite': true,
      'author': 'David Wilson',
      'source': 'Freepik',
      'description':
          'A calm river flowing gently through a dense forest, offering a peaceful and serene escape into nature.',
      'date': '2023-07-10',
      'location': 'Amazon River, Brazil',
      'camera': 'Sony A7 III',
    },
    {
      'imageUrl': "${path}ilustration7.jpg",
      'name': 'Clear Sky',
      'favorite': false,
      'author': 'Laura Moore',
      'source': 'Freepik',
      'description':
          'A clear sky with a few fluffy clouds, providing a perfect backdrop for a sunny day in the great outdoors.',
      'date': '2023-08-05',
      'location': 'Great Plains, USA',
      'camera': 'Canon EOS 90D',
    },
    {
      'imageUrl': "${path}ilustration8.jpg",
      'name': 'Sunny Beach',
      'favorite': true,
      'author': 'Robert Taylor',
      'source': 'Freepik',
      'description':
          'A sunny beach with golden sand and gentle waves, inviting visitors to relax and soak up the sun.',
      'date': '2023-09-01',
      'location': 'Maldives',
      'camera': 'Nikon D750',
    },
    {
      'imageUrl': "${path}ilustration9.jpg",
      'name': 'Tropical Waterfall',
      'favorite': true,
      'author': 'Sophia Martinez',
      'source': 'Freepik',
      'description':
          'A stunning waterfall cascading down into a lush tropical forest, creating a breathtaking and serene scene.',
      'date': '2023-10-01',
      'location': 'Iguazu Falls, Argentina',
      'camera': 'Canon EOS 6D Mark II',
    },
    {
      'imageUrl': "${path}ilustration10.jpg",
      'name': 'Red Rock Canyon',
      'favorite': false,
      'author': 'James Anderson',
      'source': 'Freepik',
      'description':
          'A deep canyon with striking red rock formations, showcasing the raw beauty and grandeur of nature.',
      'date': '2023-11-15',
      'location': 'Grand Canyon, USA',
      'camera': 'Nikon D5600',
    },
    {
      'imageUrl': "${path}ilustration11.jpg",
      'name': 'Tranquil Lake',
      'favorite': true,
      'author': 'Olivia Brown',
      'source': 'Freepik',
      'description':
          'A tranquil lake surrounded by towering mountains, offering a peaceful and picturesque retreat into nature.',
      'date': '2023-12-10',
      'location': 'Lake Tahoe, USA',
      'camera': 'Sony A6400',
    },
    {
      'imageUrl': "${path}ilustration12.jpg",
      'name': 'Lush Valley',
      'favorite': false,
      'author': 'Liam Wilson',
      'source': 'Freepik',
      'description':
          'A lush valley with a river running through it, creating a vibrant and fertile landscape teeming with life.',
      'date': '2024-01-05',
      'location': 'Yosemite Valley, USA',
      'camera': 'Fujifilm X100V',
    },
    {
      'imageUrl': "${path}ilustration13.jpg",
      'name': 'Blue Ice Glacier',
      'favorite': true,
      'author': 'Emma Johnson',
      'source': 'Freepik',
      'description':
          'A massive glacier with stunning blue ice, showcasing the raw power and beauty of nature in its frozen form.',
      'date': '2024-02-20',
      'location': 'Vatnajökull, Iceland',
      'camera': 'Canon EOS M50',
    },
    {
      'imageUrl': "${path}ilustration14.jpg",
      'name': 'Active Volcano',
      'favorite': true,
      'author': 'Noah Davis',
      'source': 'Freepik',
      'description':
          'An active volcano spewing lava and ash, creating a dramatic and awe-inspiring display of nature\'s power.',
      'date': '2024-03-15',
      'location': 'Mount Etna, Italy',
      'camera': 'Nikon D7200',
    }
  ];
}

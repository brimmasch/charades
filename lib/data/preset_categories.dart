import '../models/category.dart';

final List<Category> presetCategories = [
  Category(
    id: 'preset_kids',
    name: 'Just For Kids',
    isPreset: true,
    words: [
      // Animals
      'Cat', 'Dog', 'Lion', 'Bear', 'Rabbit', 'Fish', 'Bird', 'Horse', 'Cow', 'Pig',
      'Duck', 'Frog', 'Snake', 'Mouse', 'Monkey', 'Zebra', 'Hippo', 'Turtle', 'Butterfly',
      'Bee', 'Spider', 'Chicken', 'Sheep', 'Goat', 'Elephant', 'Giraffe', 'Tiger', 'Wolf',
      'Fox', 'Deer', 'Squirrel', 'Whale', 'Dolphin', 'Penguin', 'Parrot', 'Owl',
      'Crab', 'Lobster', 'Snail', 'Worm', 'Ladybug', 'Caterpillar', 'Dragonfly',
      'Hamster', 'Goldfish', 'Puppy', 'Kitten', 'Lamb', 'Chick', 'Pony',
      'Kangaroo', 'Koala', 'Panda', 'Gorilla', 'Crocodile', 'Flamingo', 'Peacock',
      // Vehicles
      'Car', 'Train', 'Airplane', 'Bicycle', 'Bus', 'Boat', 'Helicopter', 'Rocket',
      'Fire Truck', 'Police Car', 'Ambulance', 'Tractor', 'Skateboard', 'Scooter',
      'Submarine', 'Sailboat', 'Hot Air Balloon', 'Motorcycle', 'Dump Truck',
      'Bulldozer', 'Crane', 'Forklift', 'Snowplow', 'Ice Cream Truck',
      // Household / places
      'House', 'Door', 'Window', 'Chair', 'Table', 'Bed', 'Ball', 'Book', 'Clock',
      'Key', 'Stairs', 'TV', 'Phone', 'Balloon', 'Kite', 'Slide', 'Swing', 'Tent',
      'Bathtub', 'Toilet', 'Sink', 'Sofa', 'Lamp', 'Mirror', 'Pillow', 'Blanket',
      'Toothbrush', 'Comb', 'Soap', 'Towel', 'Mailbox', 'Fence', 'Trampoline',
      // Food
      'Apple', 'Banana', 'Pizza', 'Ice Cream', 'Cookie', 'Cake', 'Sandwich',
      'Milk', 'Juice', 'Fruit Fuice', 'Carrot', 'Strawberry', 'Popcorn', 'Lollipop', 'Cupcake',
      'Watermelon', 'Grapes', 'Orange', 'Pineapple', 'Corn', 'Pumpkin',
      'Spaghetti', 'Hot Dog', 'Hamburger', 'Pancake', 'Waffle', 'Donut',
      'Candy', 'Chocolate', 'Gummy Bear', 'Marshmallow', 'Pretzel',
      // People / characters
      'Clown', 'Robot', 'Princess', 'Dragon', 'Witch', 'Ghost', 'Santa Claus',
      'Superhero', 'Pirate', 'Cowboy', 'Astronaut', 'Mermaid', 'Fairy', 'Ninja',
      'Knight', 'Wizard', 'Vampire', 'Zombie', 'Monster', 'Alien', 'Firefighter',
      'Doctor', 'Teacher', 'Chef', 'Police Officer', 'King', 'Queen', 'Prince',
      // Nature
      'Rain', 'Sun', 'Snow', 'Moon', 'Star', 'Tree', 'Flower', 'Cloud', 'Rainbow',
      'Mountain', 'Ocean', 'River', 'Volcano', 'Island',
      'Tornado', 'Lightning', 'Snowflake', 'Leaf', 'Acorn', 'Puddle', 'Mud',
      'Sand Castle', 'Seashell', 'Mushroom', 'Cactus', 'Waterfall', 'Cave',
      // Actions (easy)
      'Running', 'Jumping', 'Swimming', 'Flying', 'Sleeping', 'Eating', 'Dancing',
      'Singing', 'Crying', 'Laughing', 'Clapping', 'Waving', 'Crawling', 'Hopping',
      'Skipping', 'Spinning', 'Rolling', 'Stretching', 'Yawning', 'Sneezing',
      'Blowing Bubbles', 'Swinging', 'Climbing', 'Hiding', 'Tip-Toeing',
      // Toys / games
      'Teddy Bear', 'Puzzle', 'Lego', 'Yo-Yo', 'Frisbee', 'Drum', 'Trumpet',
      'Paintbrush', 'Crayon', 'Blocks', 'Jump Rope', 'Hula Hoop',
      'Rocking Horse', 'Puppet', 'Jack-in-the-Box', 'Slinky', 'Top',
      'Kite', 'Bubble Wand', 'Water Pistol', 'Boomerang', 'Marbles',
      // Clothes
      'Hat', 'Shoes', 'Boots', 'Scarf', 'Gloves', 'Sunglasses', 'Backpack', 'Umbrella',
      'Cape', 'Crown', 'Tutu', 'Pajamas', 'Raincoat', 'Flip Flops', 'Mittens',
    ],
  ),

  Category(
    id: 'preset_fairy_tales',
    name: 'Fairy Tales & Stories',
    isPreset: true,
    words: [
      // Classic characters
      'Cinderella', 'Snow White', 'Sleeping Beauty', 'Rapunzel', 'Little Red Riding Hood',
      'Goldilocks', 'Hansel and Gretel', 'The Little Mermaid', 'Beauty and the Beast',
      'Pinocchio', 'Thumbelina', 'The Ugly Duckling', 'Jack and the Beanstalk',
      'The Three Little Pigs', 'Puss in Boots', 'Rumpelstiltskin', 'Tom Thumb',
      'The Pied Piper', 'Ali Baba', 'Aladdin', 'Sinbad',
      // Characters / creatures
      'Prince Charming', 'Evil Queen', 'Wicked Witch', 'Fairy Godmother', 'Evil Stepmother',
      'Big Bad Wolf', 'Giant', 'Dragon', 'Troll', 'Gnome', 'Elf', 'Goblin', 'Ogre',
      'Mermaid', 'Unicorn', 'Phoenix', 'Genie', 'Witch', 'Wizard', 'Knight', 'Princess',
      'Prince', 'King', 'Queen', 'Dwarf', 'Fairy', 'Pixie', 'Leprechaun',
      // Objects / places
      'Glass Slipper', 'Magic Mirror', 'Spinning Wheel', 'Poisoned Apple', 'Magic Wand',
      'Enchanted Castle', 'Beanstalk', 'Golden Egg', 'Magic Lamp', 'Treasure Chest',
      'Fairy Tale Book', 'Pumpkin Carriage', 'Crystal Ball', 'Magic Carpet', 'Cauldron',
      'Crown', 'Sword', 'Shield', 'Wishing Well', 'Enchanted Forest',
      // Nursery rhyme characters
      'Humpty Dumpty', 'Jack Sprat', 'Old Mother Hubbard', 'Little Miss Muffet',
      'Bo Peep', 'Jack Horner', 'Simple Simon', 'Old MacDonald',
      // Fables / other stories
      'The Tortoise and the Hare', 'The Boy Who Cried Wolf', 'The Ant and the Grasshopper',
      'The Lion and the Mouse', 'The Fox and the Grapes', 'Brer Rabbit',
      'Peter Rabbit', 'The Very Hungry Caterpillar', 'Curious George', 'Paddington Bear',
      'Winnie the Pooh', 'Tigger', 'Eeyore', 'Piglet', 'Alice in Wonderland',
      'Mad Hatter', 'Cheshire Cat', 'White Rabbit', 'Queen of Hearts',
      'Peter Pan', 'Tinker Bell', 'Captain Hook', 'Wendy', 'Neverland',
    ],
  ),

  Category(
    id: 'preset_dinosaurs',
    name: 'Dinosaurs',
    isPreset: true,
    words: [
      // Famous dinosaurs
      'T-Rex', 'Triceratops', 'Stegosaurus', 'Brachiosaurus', 'Velociraptor',
      'Pterodactyl', 'Ankylosaurus', 'Diplodocus', 'Spinosaurus', 'Allosaurus',
      'Iguanodon', 'Parasaurolophus', 'Pachycephalosaurus', 'Protoceratops',
      'Gallimimus', 'Baryonyx', 'Carnotaurus', 'Ceratosaurus', 'Corythosaurus',
      'Deinonychus', 'Dilophosaurus', 'Edmontosaurus', 'Giganotosaurus',
      'Hadrosaurus', 'Kentrosaurus', 'Maiasaura', 'Megalosaurus', 'Mosasaurus',
      'Oviraptor', 'Plesiosaur', 'Sarcosuchus', 'Suchomimus', 'Therizinosaurus',
      'Troodon', 'Tylosaurus', 'Utahraptor', 'Vulcanodon', 'Yangchuanosaurus',
      // Sea / flying creatures
      'Pteranodon', 'Quetzalcoatlus', 'Rhamphorhynchus', 'Elasmosaurus',
      'Ichthyosaurus', 'Liopleurodon', 'Kronosaurus',
      // Prehistoric mammals / other
      'Mammoth', 'Saber-Tooth Tiger', 'Megalodon', 'Giant Sloth', 'Dodo',
      'Woolly Rhino', 'Mastodon', 'Dire Wolf',
      // Concepts / related words
      'Fossil', 'Bones', 'Skeleton', 'Claw', 'Scales', 'Egg', 'Nest',
      'Meteor', 'Volcano', 'Jungle', 'Swamp', 'Tar Pit',
      'Paleontologist', 'Excavation', 'Museum', 'Herbivore', 'Carnivore',
      'Jurassic', 'Cretaceous', 'Triassic',
    ],
  ),

  Category(
    id: 'preset_superheroes',
    name: 'Superheroes',
    isPreset: true,
    words: [
      // Marvel
      'Spider-Man', 'Iron Man', 'Captain America', 'Thor', 'Hulk', 'Black Widow',
      'Hawkeye', 'Black Panther', 'Doctor Strange', 'Ant-Man', 'Wasp', 'Vision',
      'Scarlet Witch', 'Captain Marvel', 'Falcon', 'Winter Soldier', 'Deadpool',
      'Wolverine', 'Cyclops', 'Storm', 'Jean Grey', 'Magneto', 'Professor X',
      'Nightcrawler', 'Beast', 'Gambit', 'Rogue', 'Mystique', 'Colossus',
      'Daredevil', 'Luke Cage', 'Jessica Jones', 'Iron Fist', 'Punisher',
      'Groot', 'Rocket', 'Star-Lord', 'Gamora', 'Drax', 'Nebula', 'Mantis',
      'She-Hulk', 'Silver Surfer', 'Mister Fantastic', 'Invisible Woman',
      'Human Torch', 'The Thing',
      // DC
      'Superman', 'Batman', 'Wonder Woman', 'The Flash', 'Green Lantern',
      'Aquaman', 'Cyborg', 'Green Arrow', 'Nightwing', 'Robin', 'Batgirl',
      'Supergirl', 'Power Girl', 'Shazam', 'Hawkman', 'The Atom', 'Martian Manhunter',
      'Zatanna', 'Constantine', 'Blue Beetle', 'Booster Gold',
      // Villains (also fun to act out)
      'Joker', 'Thanos', 'Loki', 'Lex Luthor', 'Green Goblin', 'Doctor Doom',
      'Venom', 'Ultron', 'Red Skull', 'Darkseid', 'Galactus', 'Kingpin',
      // Other / general
      'Ninja Turtle', 'Power Ranger', 'He-Man', 'She-Ra', 'Mighty Mouse',
      'The Incredibles', 'Frozone', 'Elastigirl', 'Violet', 'Dash',
      'Megamind', 'Underdog', 'Inspector Gadget',
    ],
  ),

  Category(
    id: 'preset_cartoon_characters',
    name: 'Cartoon Characters',
    isPreset: true,
    words: [
      // Classic cartoons
      'Mickey Mouse', 'Minnie Mouse', 'Donald Duck', 'Goofy', 'Pluto',
      'Bugs Bunny', 'Daffy Duck', 'Tweety Bird', 'Sylvester', 'Porky Pig',
      'Elmer Fudd', 'Road Runner', 'Wile E. Coyote', 'Speedy Gonzales',
      'Tom', 'Jerry', 'Scooby-Doo', 'Shaggy', 'Fred Flintstone', 'Barney Rubble',
      'Yogi Bear', 'Boo-Boo', 'Quick Draw McGraw', 'Top Cat',
      'Huckleberry Hound', 'Snagglepuss',
      // Modern cartoons
      'SpongeBob', 'Patrick Star', 'Squidward', 'Sandy Cheeks', 'Mr. Krabs',
      'Dora the Explorer', 'Diego', 'Boots the Monkey',
      'Peppa Pig', 'George Pig',
      'Bluey', 'Bingo',
      'Paw Patrol', 'Ryder', 'Chase', 'Skye', 'Marshall',
      'Bluey', 'Clifford', 'Arthur', 'Caillou', 'Rugrats',
      'Hey Arnold', 'Rugrats', 'Angelica', 'Tommy Pickles',
      'Dexter', 'Johnny Bravo', 'Cow and Chicken',
      'Powerpuff Girls', 'Blossom', 'Bubbles', 'Buttercup',
      'Ben 10', 'Kim Possible', 'Danny Phantom',
      // Pixar / Disney animated
      'Simba', 'Nemo', 'Dory', 'Woody', 'Buzz Lightyear', 'Jessie',
      'Elsa', 'Anna', 'Olaf', 'Moana', 'Maui', 'Mirabel', 'Luisa',
      'Wall-E', 'Eve', 'Remy', 'Linguini',
      // Anime
      'Pikachu', 'Ash', 'Misty', 'Charmander', 'Bulbasaur', 'Squirtle',
      'Naruto', 'Goku', 'Vegeta', 'Doraemon', 'Totoro', 'Spirited Away',
    ],
  ),

  Category(
    id: 'preset_movies',
    name: 'Movies',
    isPreset: true,
    words: [
      // Action / adventure
      'Titanic', 'Jaws', 'Inception', 'Avatar', 'Gladiator', 'Braveheart',
      'Die Hard', 'Speed', 'Mad Max', 'John Wick', 'The Matrix',
      'Mission Impossible', 'James Bond', 'Indiana Jones', 'Jurassic Park',
      'King Kong', 'Godzilla', 'Terminator', 'Predator', 'Alien', 'RoboCop',
      'Top Gun', 'Maverick', 'The Dark Knight', 'Iron Man', 'Avengers',
      'Black Panther', 'Thor', 'Captain America', 'Wonder Woman',
      'Spider-Man', 'Guardians of the Galaxy', 'Doctor Strange',
      // Drama / classics
      'Grease', 'Gone with the Wind', 'Casablanca', 'The Godfather',
      'Schindler\'s List', 'Forrest Gump', 'Cast Away', 'The Shawshank Redemption',
      'A Beautiful Mind', 'Good Will Hunting', 'Rain Man', 'Philadelphia',
      'American Beauty', 'Silence of the Lambs', 'Joker', 'Interstellar',
      // Sci-fi
      'Star Wars', 'ET', 'Back to the Future', 'The Fifth Element',
      'Blade Runner', 'Total Recall', 'Contact', 'Gravity', 'The Martian',
      'Arrival', 'Edge of Tomorrow', 'Ready Player One', 'Dune',
      // Horror
      'The Shining', 'Halloween', 'Psycho', 'Nightmare on Elm Street',
      'Friday the 13th', 'The Exorcist', 'Get Out', 'A Quiet Place',
      'Bird Box', 'It', 'Hereditary', 'Us', 'Scream',
      // Comedy / rom-com
      'Home Alone', 'Elf', 'The Hangover', 'Bridesmaids', 'Clueless',
      'Pretty Woman', 'Notting Hill', 'When Harry Met Sally', 'Hitch',
      'Groundhog Day', 'Big', 'Liar Liar', 'Mrs. Doubtfire',
      'The Mask', 'Ace Ventura', 'Dumb and Dumber', 'Anchorman',
      'Superbad', 'Mean Girls', 'Legally Blonde', 'Pitch Perfect',
      // Animated
      'Frozen', 'The Lion King', 'Toy Story', 'Finding Nemo', 'Up',
      'Moana', 'Encanto', 'Coco', 'Shrek', 'Madagascar', 'Zootopia',
      'Inside Out', 'Brave', 'Tangled', 'Ratatouille', 'Wall-E',
      'The Incredibles', 'Minions', 'Despicable Me',
      // Musicals
      'Grease', 'Mamma Mia', 'La La Land', 'The Greatest Showman',
      'Chicago', 'Les Misérables', 'Bohemian Rhapsody', 'Rocket Man',
      // Thrillers
      'The Sixth Sense', 'Gone Girl', 'Knives Out', 'The Prestige',
      'Memento', 'Se7en', 'Fight Club', 'Pulp Fiction', 'Parasite',
    ],
  ),

  Category(
    id: 'preset_animals',
    name: 'Animals',
    isPreset: true,
    words: [
      // Mammals - big
      'Lion', 'Tiger', 'Elephant', 'Giraffe', 'Hippo', 'Rhino', 'Buffalo', 'Bison',
      'Bear', 'Polar Bear', 'Grizzly Bear', 'Panda', 'Red Panda', 'Gorilla',
      'Chimpanzee', 'Orangutan', 'Baboon', 'Gibbon', 'Zebra', 'Wildebeest',
      'Moose', 'Elk', 'Deer', 'Reindeer', 'Yak', 'Camel', 'Llama', 'Alpaca',
      // Mammals - medium
      'Wolf', 'Fox', 'Coyote', 'Hyena', 'Cheetah', 'Leopard', 'Jaguar',
      'Cougar', 'Lynx', 'Bobcat', 'Ocelot', 'Meerkat', 'Mongoose', 'Warthog',
      'Kangaroo', 'Koala', 'Wombat', 'Platypus', 'Echidna', 'Otter',
      'Beaver', 'Seal', 'Sea Lion', 'Walrus', 'Manatee', 'Narwhal',
      // Mammals - small
      'Rabbit', 'Squirrel', 'Chipmunk', 'Prairie Dog', 'Groundhog', 'Marmot',
      'Porcupine', 'Hedgehog', 'Skunk', 'Raccoon', 'Opossum', 'Armadillo',
      'Anteater', 'Sloth', 'Bat', 'Rat', 'Mouse', 'Hamster', 'Gerbil',
      // Ocean / water mammals
      'Dolphin', 'Whale', 'Orca', 'Blue Whale', 'Humpback Whale', 'Sperm Whale',
      // Birds
      'Eagle', 'Hawk', 'Falcon', 'Owl', 'Parrot', 'Macaw', 'Toucan',
      'Flamingo', 'Peacock', 'Ostrich', 'Emu', 'Penguin', 'Pelican',
      'Swan', 'Goose', 'Duck', 'Heron', 'Stork', 'Crane', 'Seagull',
      'Albatross', 'Puffin', 'Cardinal', 'Robin', 'Blue Jay', 'Crow',
      'Raven', 'Woodpecker', 'Hummingbird', 'Roadrunner', 'Turkey',
      'Pheasant', 'Quail', 'Pigeon', 'Dove',
      // Reptiles
      'Crocodile', 'Alligator', 'Iguana', 'Komodo Dragon', 'Gecko',
      'Chameleon', 'Turtle', 'Tortoise', 'Cobra', 'Python', 'Boa Constrictor',
      'Rattlesnake', 'King Cobra', 'Mamba', 'Anaconda',
      // Sea creatures
      'Shark', 'Great White Shark', 'Hammerhead Shark', 'Whale Shark',
      'Clownfish', 'Pufferfish', 'Swordfish', 'Piranha', 'Jellyfish',
      'Octopus', 'Squid', 'Crab', 'Lobster', 'Seahorse', 'Stingray',
      'Manta Ray', 'Starfish', 'Sea Urchin',
      // Insects / bugs
      'Butterfly', 'Dragonfly', 'Grasshopper', 'Cricket', 'Firefly',
      'Ladybug', 'Beetle', 'Ant', 'Bee', 'Wasp', 'Scorpion', 'Tarantula',
      // Amphibians
      'Frog', 'Toad', 'Salamander', 'Axolotl',
    ],
  ),

  Category(
    id: 'preset_sports',
    name: 'Sports',
    isPreset: true,
    words: [
      // Team sports
      'Soccer', 'Basketball', 'Baseball', 'American Football', 'Ice Hockey',
      'Volleyball', 'Rugby', 'Cricket', 'Lacrosse', 'Water Polo',
      'Field Hockey', 'Handball', 'Softball', 'Netball', 'Polo',
      // Individual sports
      'Tennis', 'Golf', 'Swimming', 'Cycling', 'Wrestling', 'Boxing',
      'Judo', 'Karate', 'Taekwondo', 'Gymnastics', 'Weightlifting',
      'Archery', 'Fencing', 'Running', 'Marathon', 'Sprinting',
      'Long Jump', 'High Jump', 'Pole Vault', 'Shot Put', 'Discus',
      'Javelin', 'Hammer Throw', 'Decathlon', 'Triathlon', 'Heptathlon',
      // Water sports
      'Surfing', 'Sailing', 'Rowing', 'Kayaking', 'Canoeing',
      'Water Skiing', 'Wakeboarding', 'Cliff Diving', 'Snorkeling',
      'Synchronized Swimming', 'Water Polo',
      // Winter sports
      'Skiing', 'Snowboarding', 'Ice Skating', 'Figure Skating', 'Speed Skating',
      'Bobsled', 'Luge', 'Skeleton', 'Curling', 'Biathlon',
      'Cross-Country Skiing', 'Ski Jumping', 'Freestyle Skiing',
      // Racket sports
      'Badminton', 'Squash', 'Racquetball', 'Table Tennis', 'Ping Pong',
      // Extreme sports
      'Skydiving', 'Rock Climbing', 'Bungee Jumping', 'Motocross',
      'Skateboarding', 'BMX', 'Paragliding', 'Hang Gliding', 'Base Jumping',
      // Other sports
      'Bowling', 'Billiards', 'Darts', 'Horse Racing', 'Equestrian',
      'Sumo Wrestling', 'Kickboxing', 'MMA', 'Fencing', 'Shooting',
      'Rifle Shooting', 'Diving', 'Trampoline', 'Cheerleading', 'Rodeo',
      'Car Racing', 'Formula One', 'NASCAR', 'Bobsled', 'Yachting',
    ],
  ),

  Category(
    id: 'preset_food',
    name: 'Food',
    isPreset: true,
    words: [
      // Main dishes
      'Pizza', 'Burger', 'Hot Dog', 'Sandwich', 'Salad', 'Soup', 'Stew',
      'Curry', 'Stir Fry', 'Fried Rice', 'Spaghetti', 'Lasagna', 'Pasta',
      'Macaroni', 'Ramen', 'Pho', 'Pad Thai', 'Sushi', 'Taco', 'Burrito',
      'Falafel', 'Hummus', 'Paella', 'Risotto', 'Gumbo', 'Chili',
      'BBQ Ribs', 'Roast Chicken', 'Steak', 'Fish and Chips', 'Gyro',
      'Shawarma', 'Dumplings', 'Spring Rolls', 'Samosa', 'Empanada',
      'Pierogi', 'Croissant', 'Quiche', 'Fondue', 'Raclette',
      // Desserts
      'Ice Cream', 'Cake', 'Pie', 'Brownie', 'Cookie', 'Donut', 'Cupcake',
      'Waffle', 'Pancake', 'Crepe', 'Tiramisu', 'Cheesecake', 'Mousse',
      'Pudding', 'Flan', 'Gelato', 'Sorbet', 'Creme Brulee', 'Éclair',
      'Macaron', 'Baklava', 'Churros', 'Beignet', 'Profiterole', 'Mochi',
      // Snacks / fast food
      'French Fries', 'Chips', 'Popcorn', 'Pretzels', 'Nachos',
      'Guacamole', 'Chicken Wings', 'Onion Rings', 'Corn Dog',
      // Fruits
      'Apple', 'Banana', 'Orange', 'Grape', 'Strawberry', 'Blueberry',
      'Raspberry', 'Watermelon', 'Pineapple', 'Mango', 'Peach', 'Cherry',
      'Pear', 'Plum', 'Kiwi', 'Coconut', 'Lemon', 'Pomegranate',
      'Avocado', 'Dragon Fruit', 'Durian', 'Jackfruit', 'Papaya',
      // Vegetables
      'Carrot', 'Broccoli', 'Spinach', 'Tomato', 'Cucumber', 'Potato',
      'Corn', 'Peas', 'Mushroom', 'Asparagus', 'Artichoke', 'Eggplant',
      'Pumpkin', 'Squash', 'Celery', 'Beets', 'Onion',
      // Breakfast
      'Cereal', 'Oatmeal', 'Toast', 'Bagel', 'Muffin', 'Omelet',
      'French Toast', 'Bacon', 'Sausage', 'Hash Browns',
      // Drinks
      'Coffee', 'Tea', 'Lemonade', 'Smoothie', 'Milkshake', 'Hot Chocolate',
      'Orange Juice', 'Coconut Water',
      // Sauces / misc
      'Ketchup', 'Mustard', 'Hot Sauce', 'Soy Sauce', 'Barbecue Sauce',
      'Maple Syrup', 'Honey', 'Peanut Butter', 'Nutella',
    ],
  ),

  Category(
    id: 'preset_celebrities',
    name: 'Celebrities',
    isPreset: true,
    words: [
      // Music
      'Taylor Swift', 'Beyonce', 'Elvis Presley', 'Michael Jackson', 'Madonna',
      'Lady Gaga', 'Adele', 'Rihanna', 'Billie Eilish', 'Ariana Grande',
      'Bruno Mars', 'Justin Bieber', 'Ed Sheeran', 'Harry Styles', 'Drake',
      'Eminem', 'Kanye West', 'Jay-Z', 'Cardi B', 'Nicki Minaj',
      'The Weeknd', 'Post Malone', 'Kendrick Lamar', 'Lizzo', 'Dua Lipa',
      'Shakira', 'Jennifer Lopez', 'Mariah Carey', 'Whitney Houston',
      'Dolly Parton', 'Johnny Cash', 'Bob Dylan', 'Bruce Springsteen',
      'Mick Jagger', 'Freddie Mercury', 'David Bowie', 'Prince',
      'Elton John', 'Paul McCartney', 'John Lennon', 'Bob Marley',
      // Movies / TV
      'Tom Hanks', 'Meryl Streep', 'Leonardo DiCaprio', 'Brad Pitt',
      'Angelina Jolie', 'Oprah Winfrey', 'Will Smith', 'Denzel Washington',
      'Samuel L. Jackson', 'Morgan Freeman', 'Robert Downey Jr.',
      'Johnny Depp', 'Tom Cruise', 'Arnold Schwarzenegger', 'Sylvester Stallone',
      'Bruce Willis', 'Jackie Chan', 'Dwayne Johnson', 'Kevin Hart',
      'Ryan Reynolds', 'Chris Hemsworth', 'Chris Evans', 'Chris Pratt',
      'Jennifer Lawrence', 'Emma Stone', 'Scarlett Johansson',
      'Cate Blanchett', 'Natalie Portman', 'Julia Roberts', 'Sandra Bullock',
      // Historical / famous figures
      'Albert Einstein', 'Stephen Hawking', 'Isaac Newton', 'Marie Curie',
      'Nikola Tesla', 'Thomas Edison', 'Cleopatra', 'Julius Caesar',
      'Napoleon Bonaparte', 'William Shakespeare', 'Leonardo da Vinci',
      'Michelangelo', 'Mozart', 'Beethoven', 'Abraham Lincoln',
      'Martin Luther King Jr.', 'Mahatma Gandhi', 'Nelson Mandela',
      'Winston Churchill', 'Charles Darwin',
      // Sports
      'Serena Williams', 'Roger Federer', 'Rafael Nadal', 'Novak Djokovic',
      'Lionel Messi', 'Cristiano Ronaldo', 'LeBron James', 'Michael Jordan',
      'Muhammad Ali', 'Tiger Woods', 'Usain Bolt', 'Simone Biles',
    ],
  ),

  Category(
    id: 'preset_things',
    name: 'Things',
    isPreset: true,
    words: [
      // Vehicles
      'Bicycle', 'Motorcycle', 'Skateboard', 'Scooter', 'Rollerblades',
      'Surfboard', 'Kayak', 'Canoe', 'Jet Ski', 'Hot Air Balloon',
      'Parachute', 'Hang Glider', 'Rocket Ship', 'Space Shuttle',
      // Instruments
      'Guitar', 'Piano', 'Violin', 'Trumpet', 'Saxophone', 'Drums',
      'Flute', 'Clarinet', 'Harp', 'Banjo', 'Ukulele', 'Accordion',
      'Tuba', 'French Horn', 'Cello', 'Bass Guitar', 'Bagpipes',
      'Harmonica', 'Xylophone', 'Maracas', 'Tambourine',
      // Tech / gadgets
      'Smartphone', 'Laptop', 'Tablet', 'Camera', 'Drone', 'Robot',
      'Headphones', 'Speaker', 'Printer', 'Remote Control', 'Game Controller',
      'Virtual Reality Headset', 'Smart Watch', '3D Printer', 'Telescope',
      // Tools / equipment
      'Hammer', 'Screwdriver', 'Wrench', 'Saw', 'Drill', 'Axe',
      'Shovel', 'Rake', 'Paintbrush', 'Scissors', 'Magnifying Glass',
      // Household
      'Blender', 'Microwave', 'Toaster', 'Vacuum', 'Washing Machine',
      'Refrigerator', 'Dishwasher', 'Lawn Mower', 'Ironing Board',
      'Rocking Chair', 'Chandelier', 'Grandfather Clock',
      // Outdoor / adventure
      'Tent', 'Hammock', 'Compass', 'Map', 'Lantern', 'Trampoline',
      'Boomerang', 'Frisbee', 'Jump Rope', 'Hula Hoop', 'Stilts',
      // Entertainment
      'Carnival Ride', 'Ferris Wheel', 'Rollercoaster', 'Carousel',
      'Pinball Machine', 'Foosball Table', 'Pool Table', 'Dartboard',
      'Bowling Pins', 'Punching Bag',
      // Clothes / accessories
      'Umbrella', 'Suitcase', 'Backpack', 'Briefcase', 'Top Hat',
      'Cowboy Hat', 'Scarf', 'Cape', 'Tutu', 'Tuxedo',
      // Misc objects
      'Submarine', 'Periscope', 'Anchor', 'Life Preserver', 'Trophy',
      'Crown', 'Scepter', 'Magic Wand', 'Crystal Ball', 'Hourglass',
      'Safe', 'Padlock', 'Compass', 'Treasure Map', 'Lasso',
    ],
  ),

  Category(
    id: 'preset_actions',
    name: 'Actions',
    isPreset: true,
    words: [
      // Basic movements
      'Running', 'Jumping', 'Hopping', 'Skipping', 'Crawling', 'Rolling',
      'Spinning', 'Sliding', 'Climbing', 'Hanging', 'Swinging', 'Rocking',
      'Balancing', 'Falling', 'Tripping', 'Somersault', 'Cartwheel',
      'Backflip', 'Handstand', 'Tiptoe', 'Marching', 'Waddling',
      // Body gestures
      'Clapping', 'Waving', 'Pointing', 'Nodding', 'Shaking Head',
      'Shrugging', 'Bowing', 'Curtseying', 'Saluting', 'Stretching',
      'Yawning', 'Sneezing', 'Coughing', 'Hiccupping', 'Laughing',
      'Crying', 'Screaming', 'Whispering', 'Snoring', 'Blowing',
      'Winking', 'Squinting', 'Rolling Eyes', 'Scratching', 'Itching',
      // Sports / games
      'Throwing', 'Catching', 'Kicking', 'Hitting', 'Bouncing', 'Surfing',
      'Skiing', 'Bowling', 'Golfing', 'Fencing', 'Boxing', 'Wrestling',
      'Swimming', 'Diving', 'Ice Skating', 'Skateboarding', 'Rock Climbing',
      // Everyday activities
      'Cooking', 'Eating', 'Drinking', 'Sleeping', 'Waking Up',
      'Brushing Teeth', 'Combing Hair', 'Getting Dressed', 'Tying Shoes',
      'Reading', 'Writing', 'Drawing', 'Painting', 'Taking Photos',
      'Typing', 'Texting', 'Driving', 'Parking', 'Pumping Gas',
      // Playing instruments
      'Playing Guitar', 'Playing Piano', 'Playing Drums', 'Playing Violin',
      'Playing Trumpet', 'Conducting Orchestra', 'Singing', 'Juggling',
      'Magic Tricks', 'Telling Jokes', 'Acting', 'Directing',
      // Emotions / expressions
      'Celebrating', 'Sulking', 'Daydreaming', 'Panicking', 'Meditating',
      'Concentrating', 'Thinking', 'Confused', 'Excited', 'Bored',
      // Work / chores
      'Sweeping', 'Mopping', 'Vacuuming', 'Washing Dishes', 'Mowing Lawn',
      'Raking Leaves', 'Shoveling Snow', 'Gardening', 'Watering Plants',
      'Hammering', 'Painting Wall', 'Fixing Sink',
      // Misc
      'Whistling', 'Juggling', 'Tightrope Walking', 'Mime', 'Puppeteering',
    ],
  ),

  Category(
    id: 'preset_jobs',
    name: 'Jobs & Careers',
    isPreset: true,
    words: [
      // Healthcare
      'Doctor', 'Nurse', 'Surgeon', 'Dentist', 'Pharmacist', 'Paramedic',
      'Firefighter', 'Police Officer', 'Lifeguard', 'Veterinarian',
      'Optometrist', 'Therapist', 'Psychiatrist', 'Midwife', 'Radiologist',
      // Science / tech
      'Scientist', 'Astronaut', 'Engineer', 'Programmer', 'Data Analyst',
      'Chemist', 'Biologist', 'Geologist', 'Archaeologist', 'Marine Biologist',
      'Physicist', 'Mathematician', 'Inventor', 'Robotics Engineer',
      // Arts / entertainment
      'Actor', 'Actress', 'Singer', 'Dancer', 'Musician', 'Comedian',
      'Director', 'Photographer', 'Painter', 'Sculptor', 'Graphic Designer',
      'Animator', 'Journalist', 'Author', 'Poet', 'Screenwriter',
      'Film Editor', 'Sound Engineer', 'Makeup Artist', 'Fashion Designer',
      // Trades / services
      'Carpenter', 'Plumber', 'Electrician', 'Mechanic', 'Welder',
      'Blacksmith', 'Mason', 'Roofer', 'Landscaper', 'Exterminator',
      'Chef', 'Baker', 'Barber', 'Hairdresser', 'Tailor', 'Cobbler',
      // Education / government
      'Teacher', 'Professor', 'Principal', 'Librarian', 'Judge', 'Lawyer',
      'Politician', 'Diplomat', 'Soldier', 'Spy', 'Detective',
      'Air Traffic Controller', 'Customs Officer', 'Mayor',
      // Transport / logistics
      'Pilot', 'Flight Attendant', 'Sea Captain', 'Truck Driver', 'Train Driver',
      'Bus Driver', 'Taxi Driver', 'Delivery Driver', 'Postman',
      // Other
      'Farmer', 'Fisherman', 'Miner', 'Lumberjack', 'Zookeeper',
      'Circus Performer', 'Stuntman', 'Magician', 'Clown', 'Puppeteer',
      'Tour Guide', 'Museum Curator', 'Auctioneer', 'Real Estate Agent',
      'Insurance Agent', 'Accountant',
    ],
  ),

  Category(
    id: 'preset_places',
    name: 'Places & Landmarks',
    isPreset: true,
    words: [
      // Wonders / famous landmarks
      'Eiffel Tower', 'Statue of Liberty', 'Big Ben', 'Colosseum',
      'Great Wall of China', 'Pyramids of Giza', 'Machu Picchu',
      'Taj Mahal', 'Stonehenge', 'Niagara Falls', 'Grand Canyon',
      'Mount Everest', 'Amazon Rainforest', 'Sahara Desert', 'Great Barrier Reef',
      'Angkor Wat', 'Chichen Itza', 'Petra', 'Easter Island', 'Sydney Opera House',
      'Golden Gate Bridge', 'Leaning Tower of Pisa', 'Acropolis',
      'Vatican', 'Louvre', 'Vatican City',
      // Cities
      'New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Dubai', 'Rome',
      'Barcelona', 'Amsterdam', 'Venice', 'Prague', 'Vienna', 'Athens',
      'Cairo', 'Istanbul', 'Moscow', 'Beijing', 'Shanghai', 'Mumbai',
      'Rio de Janeiro', 'Buenos Aires', 'Mexico City', 'Los Angeles',
      'Chicago', 'Las Vegas', 'Miami', 'San Francisco', 'Seattle',
      'Toronto', 'Vancouver', 'Cape Town', 'Nairobi', 'Singapore',
      'Bangkok', 'Bali', 'Marrakech', 'Havana', 'Reykjavik',
      // General places
      'Hospital', 'Airport', 'Beach', 'Desert', 'Jungle', 'Forest',
      'Mountain', 'Volcano', 'Canyon', 'Cave', 'Waterfall', 'Lake',
      'Island', 'Lighthouse', 'Castle', 'Palace', 'Cathedral', 'Mosque',
      'Temple', 'Synagogue', 'Museum', 'Library', 'Stadium', 'Circus',
      'Theme Park', 'Zoo', 'Aquarium', 'Market', 'Harbor', 'Train Station',
    ],
  ),

  Category(
    id: 'preset_tv_shows',
    name: 'TV Shows',
    isPreset: true,
    words: [
      // Drama
      'Game of Thrones', 'Breaking Bad', 'The Crown', 'Succession',
      'The Wire', 'Sopranos', 'Ozark', 'Yellowstone', 'Peaky Blinders',
      'Downton Abbey', 'Mad Men', 'Suits', 'Grey\'s Anatomy', 'ER',
      'House', 'Dexter', 'Narcos', 'Better Call Saul',
      'Stranger Things', 'Lost', 'Prison Break', 'The Walking Dead',
      '24', 'Homeland', 'Westworld', 'Black Mirror',
      // Comedy
      'Friends', 'Seinfeld', 'The Office', 'Parks and Recreation',
      'Brooklyn Nine-Nine', 'Modern Family', 'Big Bang Theory',
      'How I Met Your Mother', 'It\'s Always Sunny in Philadelphia',
      'Arrested Development', 'Community', 'New Girl', 'Schitt\'s Creek',
      'Curb Your Enthusiasm', 'Frasier', 'Cheers', 'Everybody Loves Raymond',
      'Two and a Half Men', 'The Simpsons', 'Futurama', 'Family Guy',
      'South Park', 'Rick and Morty', 'Archer',
      // Reality / competition
      'Survivor', 'The Amazing Race', 'Big Brother', 'American Idol',
      'The Voice', 'Dancing with the Stars', 'America\'s Got Talent',
      'The Bachelor', 'Keeping Up with the Kardashians', 'Jersey Shore',
      'MasterChef', 'Top Chef', 'Hell\'s Kitchen', 'Chopped',
      'Project Runway', 'Shark Tank', 'The Apprentice', 'Jeopardy',
      // Sci-fi / fantasy
      'Star Trek', 'Doctor Who', 'The Mandalorian', 'The Witcher',
      'Loki', 'WandaVision', 'Squid Game', 'Dark', 'Altered Carbon',
      // Kids / family
      'SpongeBob', 'Avatar', 'Teen Titans', 'Gravity Falls', 'Bluey',
      'Peppa Pig', 'Paw Patrol', 'Sesame Street',
    ],
  ),

  Category(
    id: 'preset_music',
    name: 'Music',
    isPreset: true,
    words: [
      // Bands
      'The Beatles', 'The Rolling Stones', 'Led Zeppelin', 'Pink Floyd',
      'Queen', 'AC/DC', 'Metallica', 'Nirvana', 'Pearl Jam', 'Radiohead',
      'U2', 'The Who', 'Fleetwood Mac', 'Eagles', 'ABBA', 'Coldplay',
      'Maroon 5', 'Imagine Dragons', 'Twenty One Pilots', 'Arctic Monkeys',
      'One Direction', 'BTS', 'Blackpink', 'Foo Fighters',
      // Solo artists
      'Elvis Presley', 'Michael Jackson', 'Madonna', 'Prince', 'David Bowie',
      'Freddie Mercury', 'Bob Dylan', 'Elton John', 'Stevie Wonder',
      'Frank Sinatra', 'Ella Fitzgerald', 'Louis Armstrong', 'Aretha Franklin',
      'James Brown', 'Tina Turner', 'Whitney Houston', 'Mariah Carey',
      'Celine Dion', 'Dolly Parton', 'Johnny Cash', 'Bob Marley',
      'Bruce Springsteen', 'Billy Joel', 'Eric Clapton',
      // Famous songs
      'Bohemian Rhapsody', 'Thriller', 'Imagine', 'Hotel California',
      'Stairway to Heaven', 'Smells Like Teen Spirit', 'Purple Rain',
      'Like a Prayer', 'Rolling in the Deep', 'Shape of You',
      'Despacito', 'Gangnam Style', 'We Are the World', 'Billie Jean',
      // Genres
      'Rock', 'Pop', 'Hip-Hop', 'Jazz', 'Classical', 'Country',
      'Blues', 'Reggae', 'Electronic', 'Disco', 'Punk', 'Metal',
      'R&B', 'Soul', 'Gospel', 'Opera', 'Folk', 'Rap',
      // Instruments / music terms
      'Guitar Solo', 'Piano Recital', 'Orchestra', 'Symphony', 'Choir',
      'Mosh Pit', 'Music Festival', 'World Tour', 'Record Label',
      'Grammy Award', 'Music Video', 'Karaoke',
    ],
  ),

  Category(
    id: 'preset_halloween',
    name: 'Halloween & Spooky',
    isPreset: true,
    words: [
      // Classic monsters
      'Vampire', 'Werewolf', 'Zombie', 'Witch', 'Ghost', 'Skeleton',
      'Frankenstein', 'Mummy', 'Dracula', 'The Invisible Man',
      'Creature from the Black Lagoon', 'Wolfman', 'Banshee',
      'Poltergeist', 'Demon', 'Devil', 'Grim Reaper', 'Jack-o-Lantern',
      // Scary characters
      'Freddy Krueger', 'Jason Voorhees', 'Michael Myers', 'Pennywise',
      'Chucky', 'The Nun', 'Annabelle', 'Slender Man', 'Ghostface',
      'Leatherface', 'Hannibal Lecter', 'Norman Bates', 'Jigsaw',
      // Spooky places
      'Haunted House', 'Cemetery', 'Graveyard', 'Crypt', 'Dungeon',
      'Abandoned Castle', 'Dark Forest', 'Swamp', 'Fog', 'Maze',
      // Halloween items
      'Cauldron', 'Broomstick', 'Black Cat', 'Bat', 'Spider Web',
      'Coffin', 'Tombstone', 'Candle', 'Full Moon', 'Owl',
      'Magic Potion', 'Spell Book', 'Crystal Ball', 'Ouija Board',
      'Candy Corn', 'Trick or Treat', 'Costume', 'Mask',
      // Mythical / supernatural
      'Bigfoot', 'Loch Ness Monster', 'Yeti', 'Chupacabra', 'Kraken',
      'Medusa', 'Minotaur', 'Cyclops', 'Cerberus', 'Hydra',
      'Phoenix', 'Sphinx', 'Chimera', 'Basilisk',
      // Spooky concepts
      'Haunting', 'Possession', 'Curse', 'Hex', 'Séance', 'Exorcism',
      'Black Magic', 'Voodoo', 'Prophecy', 'Omen',
    ],
  ),

  Category(
    id: 'preset_nature',
    name: 'Nature & Weather',
    isPreset: true,
    words: [
      // Weather / sky
      'Tornado', 'Hurricane', 'Blizzard', 'Thunderstorm', 'Lightning',
      'Thunder', 'Rainbow', 'Hail', 'Fog', 'Drought', 'Flood',
      'Avalanche', 'Wildfire', 'Earthquake', 'Tsunami', 'Sandstorm',
      'Aurora', 'Solar Eclipse', 'Meteor Shower', 'Shooting Star',
      // Landscapes
      'Volcano', 'Glacier', 'Canyon', 'Cliff', 'Cave', 'Waterfall',
      'Hot Spring', 'Geyser', 'Coral Reef', 'Tide Pool', 'Mangrove',
      'Tundra', 'Savanna', 'Prairie', 'Wetland', 'Delta', 'Fjord',
      // Water
      'Ocean', 'Lake', 'River', 'Stream', 'Pond', 'Swamp', 'Marsh',
      'Estuary', 'Lagoon', 'Waterfall', 'Rapids', 'Whirlpool',
      // Plants / trees
      'Oak Tree', 'Palm Tree', 'Cactus', 'Bamboo', 'Sequoia',
      'Sunflower', 'Rosebush', 'Ivy', 'Fern', 'Mushroom', 'Lily Pad',
      'Venus Flytrap', 'Seaweed', 'Mangrove', 'Bonsai',
      // Sky / space
      'Sun', 'Moon', 'Star', 'Comet', 'Asteroid', 'Black Hole',
      'Nebula', 'Galaxy', 'Milky Way', 'Satellite', 'Space Station',
      // Natural phenomena
      'Tide', 'Wave', 'Whirlpool', 'Mirage', 'Quicksand', 'Sinkhole',
      'Lava', 'Geyser', 'Stalactite', 'Stalagmite', 'Fossil',
      // Seasons / cycles
      'Spring Bloom', 'Summer Heat', 'Autumn Leaves', 'Winter Snow',
      'Migration', 'Hibernation', 'Pollination', 'Photosynthesis',
    ],
  ),
];

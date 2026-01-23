import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/restaurant.dart';
import '../../providers/restaurant_provider.dart';

class ManageRestaurantsScreen extends StatefulWidget {
  const ManageRestaurantsScreen({super.key});

  @override
  State<ManageRestaurantsScreen> createState() => _ManageRestaurantsScreenState();
}

class _ManageRestaurantsScreenState extends State<ManageRestaurantsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _sortBy = 'name';
  bool _isAscending = true;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Restaurants'),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _refreshRestaurants(context),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and Filter Bar
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[50],
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search restaurants...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.toLowerCase();
                    });
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Sort by: ', style: TextStyle(fontWeight: FontWeight.w500)),
                    DropdownButton<String>(
                      value: _sortBy,
                      items: const [
                        DropdownMenuItem(value: 'name', child: Text('Name')),
                        DropdownMenuItem(value: 'score', child: Text('Score')),
                        DropdownMenuItem(value: 'date', child: Text('Date Added')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _sortBy = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: Icon(_isAscending ? Icons.arrow_upward : Icons.arrow_downward),
                      onPressed: () {
                        setState(() {
                          _isAscending = !_isAscending;
                        });
                      },
                      tooltip: _isAscending ? 'Sort Ascending' : 'Sort Descending',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Restaurant List
          Expanded(
            child: _buildRestaurantList(restaurantProvider),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddRestaurantDialog(context),
        icon: const Icon(Icons.add_business),
        label: const Text('Add Restaurant'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  Widget _buildRestaurantList(RestaurantProvider restaurantProvider) {
    final filteredRestaurants = _getFilteredAndSortedRestaurants(restaurantProvider.restaurants);

    if (filteredRestaurants.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isEmpty ? 'No restaurants found' : 'No restaurants match your search',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _refreshRestaurants(context),
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: filteredRestaurants.length,
        itemBuilder: (context, index) {
          final restaurant = filteredRestaurants[index];
          return RestaurantListTile(restaurant: restaurant);
        },
      ),
    );
  }

  List<Restaurant> _getFilteredAndSortedRestaurants(List<Restaurant> restaurants) {
    // Filter by search query
    var filtered = restaurants.where((restaurant) {
      return restaurant.name.toLowerCase().contains(_searchQuery) ||
             restaurant.address.toLowerCase().contains(_searchQuery) ||
             restaurant.phone.contains(_searchQuery);
    }).toList();

    // Sort
    filtered.sort((a, b) {
      int comparison = 0;
      switch (_sortBy) {
        case 'name':
          comparison = a.name.compareTo(b.name);
          break;
        case 'score':
          final aScore = a.lastInspectionScore ?? 0;
          final bScore = b.lastInspectionScore ?? 0;
          comparison = aScore.compareTo(bScore);
          break;
        case 'date':
          comparison = a.createdAt.compareTo(b.createdAt);
          break;
      }
      return _isAscending ? comparison : -comparison;
    });

    return filtered;
  }

  Future<void> _refreshRestaurants(BuildContext context) async {
    // In a real app, this would fetch from API
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Restaurants refreshed')),
    );
  }

  void _showAddRestaurantDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController licenseController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Restaurant'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Restaurant Name *',
                  hintText: 'Enter restaurant name',
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address *',
                  hintText: 'Enter full address',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: '+91 XXXXX XXXXX',
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: licenseController,
                decoration: const InputDecoration(
                  labelText: 'License Number *',
                  hintText: 'FSSAI license number',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty ||
                  addressController.text.trim().isEmpty ||
                  licenseController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill in all required fields'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              final newRestaurant = Restaurant(
                id: 'rest_${DateTime.now().millisecondsSinceEpoch}',
                name: nameController.text.trim(),
                address: addressController.text.trim(),
                phone: phoneController.text.trim(),
                licenseNumber: licenseController.text.trim(),
                createdAt: DateTime.now(),
                lastInspectionDate: null,
                lastInspectionScore: null,
                isActive: true,
              );

              Provider.of<RestaurantProvider>(context, listen: false)
                  .addRestaurant(newRestaurant);

              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${newRestaurant.name} added successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Add Restaurant'),
          ),
        ],
      ),
    );
  }
}

class RestaurantListTile extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantListTile({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final score = restaurant.lastInspectionScore ?? 0;
    final scoreColor = _getScoreColor(score);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: scoreColor.withOpacity(0.2),
          child: Text(
            restaurant.name.substring(0, 1),
            style: TextStyle(
              color: scoreColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          restaurant.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(restaurant.address),
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: scoreColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: scoreColor),
                  ),
                  child: Text(
                    'Score: ${score > 0 ? score : "N/A"}',
                    style: TextStyle(
                      color: scoreColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (restaurant.phone.isNotEmpty)
                  Text(
                    restaurant.phone,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 20),
                  SizedBox(width: 8),
                  Text('Edit'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red, size: 20),
                  SizedBox(width: 8),
                  Text('Delete', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 'edit') {
              _showEditDialog(context, restaurant);
            } else if (value == 'delete') {
              _showDeleteDialog(context, restaurant);
            }
          },
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, Restaurant restaurant) {
    final TextEditingController nameController = TextEditingController(text: restaurant.name);
    final TextEditingController addressController = TextEditingController(text: restaurant.address);
    final TextEditingController phoneController = TextEditingController(text: restaurant.phone);
    final TextEditingController licenseController = TextEditingController(text: restaurant.licenseNumber);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Restaurant'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Restaurant Name'),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: licenseController,
                decoration: const InputDecoration(labelText: 'License Number'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final updatedRestaurant = restaurant.copyWith(
                name: nameController.text,
                address: addressController.text,
                phone: phoneController.text,
                licenseNumber: licenseController.text,
              );
              Provider.of<RestaurantProvider>(context, listen: false)
                  .updateRestaurant(updatedRestaurant);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, Restaurant restaurant) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Restaurant'),
        content: Text('Are you sure you want to delete ${restaurant.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<RestaurantProvider>(context, listen: false)
                  .deleteRestaurant(restaurant.id);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Color _getScoreColor(int score) {
    if (score >= 90) return Colors.green;
    if (score >= 70) return Colors.lightGreen;
    if (score >= 50) return Colors.orange;
    return Colors.red;
  }
}
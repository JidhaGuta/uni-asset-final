import 'package:flutter/material.dart';

class ViewDevicesScreen extends StatelessWidget {
  const ViewDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data (later replace with real backend data)
    final List<Map<String, dynamic>> mockDevices = [
      {
        'category': 'Laptop',
        'model': 'HP Pavilion 15',
        'serial': 'SN123456789',
        'color': 'Silver',
        'registeredDate': '2024-01-15',
        'status': 'Active',
        'images': [
          'assets/images/devices/laptop_front.jpg',
          'assets/images/devices/laptop_back.jpg',
          'assets/images/devices/laptop_side.jpg',
        ],
      },
      {
        'category': 'Phone',
        'model': 'Samsung Galaxy S22',
        'serial': 'SN987654321',
        'color': 'Phantom Black',
        'registeredDate': '2024-01-10',
        'status': 'Active',
        'images': [
          'assets/images/devices/laptop_front.jpg', // reusing placeholder
          'assets/images/devices/laptop_back.jpg',
          'assets/images/devices/laptop_side.jpg',
        ],
      },
      {
        'category': 'Tablet',
        'model': 'iPad Air 5th Gen',
        'serial': 'SN456123789',
        'color': 'Space Gray',
        'registeredDate': '2024-01-05',
        'status': 'Inactive',
        'images': [
          'assets/images/devices/laptop_front.jpg',
          'assets/images/devices/laptop_back.jpg',
          'assets/images/devices/laptop_side.jpg',
        ],
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'My Devices',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
        actions: [
          IconButton(
            onPressed: () {
              // Add filter functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Filter options coming soon'),
                  backgroundColor: Colors.blue.shade600,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: Icon(Icons.filter_list_rounded, color: Colors.grey.shade700),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header stats
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade50, Colors.purple.shade50],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem(
                    'Total Devices',
                    mockDevices.length.toString(),
                    Icons.devices_rounded,
                    Colors.blue.shade700,
                  ),
                  _buildStatItem(
                    'Active',
                    mockDevices
                        .where((d) => d['status'] == 'Active')
                        .length
                        .toString(),
                    Icons.check_circle_rounded,
                    Colors.green.shade700,
                  ),
                  _buildStatItem(
                    'Categories',
                    mockDevices
                        .map((d) => d['category'])
                        .toSet()
                        .length
                        .toString(),
                    Icons.category_rounded,
                    Colors.purple.shade700,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Devices list header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Registered Devices (${mockDevices.length})',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Swipe for actions',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Devices list
            Expanded(
              child: ListView.builder(
                itemCount: mockDevices.length,
                itemBuilder: (context, index) {
                  final device = mockDevices[index];
                  return _buildDeviceCard(context, device, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildDeviceCard(
    BuildContext context,
    Map<String, dynamic> device,
    int index,
  ) {
    final isActive = device['status'] == 'Active';

    return Dismissible(
      key: Key(device['serial']),
      background: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: Icon(Icons.edit_rounded, color: Colors.green.shade600, size: 24),
      ),
      secondaryBackground: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(Icons.delete_rounded, color: Colors.red.shade600, size: 24),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return await _showDeleteDialog(context, device);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Edit ${device['model']}'),
              backgroundColor: Colors.blue.shade600,
              behavior: SnackBarBehavior.floating,
            ),
          );
          return false;
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: _getCategoryColor(
                            device['category'],
                          ).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _getCategoryIcon(device['category']),
                          color: _getCategoryColor(device['category']),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            device['category'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            device['model'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isActive
                              ? Colors.green.shade50
                              : Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isActive ? Icons.check_circle : Icons.pause_circle,
                          size: 12,
                          color:
                              isActive
                                  ? Colors.green.shade600
                                  : Colors.orange.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          device['status'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color:
                                isActive
                                    ? Colors.green.shade600
                                    : Colors.orange.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Device details
              _buildDetailRow('Serial Number', device['serial']),
              _buildDetailRow('Color', device['color']),
              _buildDetailRow('Registered', device['registeredDate']),
              const SizedBox(height: 16),

              // Images section
              Text(
                'Device Images',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: device['images'].length,
                  itemBuilder: (context, imgIndex) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          device['images'][imgIndex],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () => _showDeviceDetails(context, device),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue.shade600,
                    ),
                    icon: const Icon(Icons.visibility_outlined, size: 16),
                    label: const Text('View Details'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: () => _generateQRCode(context, device),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.green.shade600,
                      side: BorderSide(color: Colors.green.shade300),
                    ),
                    icon: const Icon(Icons.qr_code_2_outlined, size: 16),
                    label: const Text('QR Code'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Laptop':
        return Icons.laptop_mac_rounded;
      case 'Phone':
        return Icons.phone_iphone_rounded;
      case 'Tablet':
        return Icons.tablet_mac_rounded;
      case 'Wearable':
        return Icons.watch_rounded;
      default:
        return Icons.devices_other_rounded;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Laptop':
        return Colors.blue.shade600;
      case 'Phone':
        return Colors.purple.shade600;
      case 'Tablet':
        return Colors.orange.shade600;
      case 'Wearable':
        return Colors.green.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  Future<bool> _showDeleteDialog(
    BuildContext context,
    Map<String, dynamic> device,
  ) async {
    return await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Delete Device?'),
                content: Text(
                  'Are you sure you want to delete ${device['model']}? This action cannot be undone.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red.shade600,
                    ),
                    child: const Text('Delete'),
                  ),
                ],
              ),
        ) ??
        false;
  }

  void _showDeviceDetails(BuildContext context, Map<String, dynamic> device) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing details for ${device['model']}'),
        backgroundColor: Colors.blue.shade600,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _generateQRCode(BuildContext context, Map<String, dynamic> device) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Generating QR code for ${device['model']}'),
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

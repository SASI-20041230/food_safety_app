import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/restaurant_provider.dart';
import '../../providers/report_provider.dart';

class ReportScreen extends StatefulWidget {
  final String? restaurantId;
  
  const ReportScreen({super.key, this.restaurantId});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  String? _selectedRestaurantId;
  String _selectedIssueType = 'hygiene';
  List<File> _selectedImages = [];
  bool _isAnalyzing = false;
  double? _aiHygieneScore;
  double? _aiConfidence;
  List<String> _aiIssues = [];
  List<String> _aiSuggestions = [];

  final List<String> _issueTypes = [
    'hygiene',
    'food_quality',
    'safety',
    'other'
  ];

  final Map<String, String> _issueTypeLabels = {
    'hygiene': 'Hygiene Issue',
    'food_quality': 'Food Quality',
    'safety': 'Safety Concern',
    'other': 'Other',
  };

  @override
  void initState() {
    super.initState();
    _selectedRestaurantId = widget.restaurantId;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
      
      // Auto-analyze the image
      await _analyzeImage(File(pickedFile.path));
    }
  }

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
      
      // Auto-analyze the image
      await _analyzeImage(File(pickedFile.path));
    }
  }

  Future<void> _analyzeImage(File image) async {
    setState(() {
      _isAnalyzing = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    // Mock AI analysis
    final randomScore = 60 + (DateTime.now().millisecond % 40).toDouble();
    final randomConfidence = 0.7 + (DateTime.now().second % 30) / 100;
    
    List<String> issues = [];
    List<String> suggestions = [];
    
    if (randomScore < 70) {
      issues = [
        'Food debris detected (${(70 + DateTime.now().millisecond % 25)}%)',
        'Surface cleanliness needs improvement (${(60 + DateTime.now().millisecond % 30)}%)',
      ];
      suggestions = [
        'Clean all food contact surfaces thoroughly',
        'Implement regular cleaning schedule',
        'Train staff on proper hygiene practices',
      ];
    } else {
      suggestions = [
        'Maintain current hygiene standards',
        'Continue regular inspections',
      ];
    }

    setState(() {
      _aiHygieneScore = randomScore;
      _aiConfidence = randomConfidence;
      _aiIssues = issues;
      _aiSuggestions = suggestions;
      _isAnalyzing = false;
    });
  }

  Future<void> _submitReport() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedRestaurantId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a restaurant'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final reportProvider = Provider.of<ReportProvider>(context, listen: false);

    try {
      final imagePaths = _selectedImages.map((image) => image.path).toList();
      
      await reportProvider.createReport(
        restaurantId: _selectedRestaurantId!,
        reporterId: authProvider.user!['id'],
        title: _titleController.text,
        description: _descriptionController.text,
        type: _selectedIssueType,
        imageUrls: imagePaths,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Report submitted successfully!', style: TextStyle(fontWeight: FontWeight.bold)),
              if (_aiHygieneScore != null)
                Text('AI Hygiene Score: ${_aiHygieneScore!.toStringAsFixed(1)}'),
            ],
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
        ),
      );

      // Clear form
      _formKey.currentState!.reset();
      setState(() {
        _selectedImages.clear();
        _selectedRestaurantId = widget.restaurantId;
        _aiHygieneScore = null;
        _aiConfidence = null;
        _aiIssues.clear();
        _aiSuggestions.clear();
      });

      // Navigate back after delay
      await Future.delayed(const Duration(seconds: 2));
      if (context.mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit report: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final restaurants = restaurantProvider.restaurants;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Hygiene Issue'),
        actions: [
          if (_selectedImages.isNotEmpty && _aiHygieneScore != null)
            Chip(
              label: Text('Score: ${_aiHygieneScore!.toStringAsFixed(1)}'),
              backgroundColor: _aiHygieneScore! >= 70 ? Colors.green : 
                            _aiHygieneScore! >= 50 ? Colors.orange : Colors.red,
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restaurant Selection
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select Restaurant',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: _selectedRestaurantId,
                        decoration: const InputDecoration(
                          labelText: 'Restaurant',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.restaurant),
                        ),
                        items: restaurants.map((restaurant) {
                          return DropdownMenuItem(
                            value: restaurant.id,
                            child: Text(restaurant.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedRestaurantId = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a restaurant';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Issue Details
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Issue Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      // Issue Type
                      DropdownButtonFormField<String>(
                        value: _selectedIssueType,
                        decoration: const InputDecoration(
                          labelText: 'Issue Type',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.warning),
                        ),
                        items: _issueTypes.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(_issueTypeLabels[type] ?? type),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedIssueType = value!;
                          });
                        },
                      ),

                      const SizedBox(height: 16),

                      // Title
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.title),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Description
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                          prefixIcon: Icon(Icons.description),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          if (value.length < 10) {
                            return 'Description should be at least 10 characters';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Image Upload Section
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Upload Evidence',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Upload photos for AI-powered hygiene analysis',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 16),

                      // Image Preview Grid
                      if (_selectedImages.isNotEmpty)
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: _selectedImages.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: FileImage(_selectedImages[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedImages.removeAt(index);
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),

                      const SizedBox(height: 16),

                      // Upload Buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _pickImage,
                              icon: const Icon(Icons.photo_library),
                              label: const Text('Gallery'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _takePhoto,
                              icon: const Icon(Icons.camera_alt),
                              label: const Text('Camera'),
                            ),
                          ),
                        ],
                      ),

                      // AI Analysis Results
                      if (_isAnalyzing)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 8),
                              Text('Analyzing image for hygiene issues...'),
                            ],
                          ),
                        ),

                      if (_aiHygieneScore != null && !_isAnalyzing)
                        _buildAIAnalysisResults(),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _submitReport,
                  icon: const Icon(Icons.send, size: 20),
                  label: const Text(
                    'Submit Report',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAIAnalysisResults() {
    Color getScoreColor(double score) {
      if (score >= 80) return Colors.green;
      if (score >= 60) return Colors.orange;
      return Colors.red;
    }

    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: getScoreColor(_aiHygieneScore!).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: getScoreColor(_aiHygieneScore!)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AI Analysis Results',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: getScoreColor(_aiHygieneScore!),
                ),
              ),
              Chip(
                label: Text('${_aiHygieneScore!.toStringAsFixed(1)}/100'),
                backgroundColor: getScoreColor(_aiHygieneScore!),
                labelStyle: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Confidence: ${(_aiConfidence! * 100).toStringAsFixed(1)}%',
            style: const TextStyle(color: Colors.grey),
          ),
          
          if (_aiIssues.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Text(
              'Detected Issues:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            ..._aiIssues.map((issue) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.warning, size: 16, color: Colors.orange),
                  const SizedBox(width: 8),
                  Expanded(child: Text(issue)),
                ],
              ),
            )).toList(),
          ],
          
          if (_aiSuggestions.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Text(
              'Suggestions:',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
            ),
            const SizedBox(height: 4),
            ..._aiSuggestions.map((suggestion) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, size: 16, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(child: Text(suggestion)),
                ],
              ),
            )).toList(),
          ],
        ],
      ),
    );
  }
}
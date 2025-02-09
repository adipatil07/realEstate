import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/enquiry/bloc/enquiry_bloc.dart';
import 'package:homescout/features/enquiry/ui/enquiry_detail_page.dart';

class EnquiryPage extends StatelessWidget {
  const EnquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EnquiryBloc()..add(LoadEnquiries()),
      child: EnquiryPageView(),
    );
  }
}

class EnquiryPageView extends StatefulWidget {
  const EnquiryPageView({super.key});

  @override
  _EnquiryPageViewState createState() => _EnquiryPageViewState();
}

class _EnquiryPageViewState extends State<EnquiryPageView> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<EnquiryBloc>().add(LoadEnquiries());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enquiries', style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.background,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog();
            },
          ),
        ],
      ),
      body: Container(
        color: AppColors.background,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search enquiries...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                // Implement search functionality
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<EnquiryBloc, EnquiryState>(
                builder: (context, state) {
                  if (state is EnquiryLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is EnquiryLoaded) {
                    if (state.enquiries.isEmpty) {
                      return Center(
                          child: Text('No enquiries found',
                              style: AppTextStyles.body));
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<EnquiryBloc>().add(LoadEnquiries());
                      },
                      child: ListView.builder(
                        itemCount: state.enquiries.length,
                        itemBuilder: (context, index) {
                          final enquiry = state.enquiries[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            color: AppColors.lightBackground,
                            child: ListTile(
                              leading: Icon(Icons.question_answer,
                                  color: AppColors.primary),
                              title: Text(enquiry.title,
                                  style: AppTextStyles.heading),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(enquiry.description,
                                      style: AppTextStyles.body),
                                  Text('Status: ${enquiry.status}',
                                      style: AppTextStyles.small),
                                  Text('Date: ${enquiry.timestamp}',
                                      style: AppTextStyles.small),
                                ],
                              ),
                              trailing: Icon(Icons.arrow_forward,
                                  color: AppColors.primary),
                              onTap: () {
                                // Navigate to detailed view
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return EnquiryDetailPage(enquiry: enquiry);
                                  },
                                ));
                              },
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is EnquiryError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Failed to load enquiries',
                              style: AppTextStyles.error),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<EnquiryBloc>().add(LoadEnquiries());
                            },
                            child: Text('Retry', style: AppTextStyles.button),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                        child:
                            Text('Unknown state', style: AppTextStyles.error));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filter Enquiries'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('All'),
                leading: Radio(
                  value: 'All',
                  groupValue: _selectedFilter,
                  onChanged: (value) {
                    setState(() {
                      _selectedFilter = value.toString();
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
              ListTile(
                title: Text('Pending'),
                leading: Radio(
                  value: 'Pending',
                  groupValue: _selectedFilter,
                  onChanged: (value) {
                    setState(() {
                      _selectedFilter = value.toString();
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
              ListTile(
                title: Text('Responded'),
                leading: Radio(
                  value: 'Responded',
                  groupValue: _selectedFilter,
                  onChanged: (value) {
                    setState(() {
                      _selectedFilter = value.toString();
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
              ListTile(
                title: Text('Closed'),
                leading: Radio(
                  value: 'Closed',
                  groupValue: _selectedFilter,
                  onChanged: (value) {
                    setState(() {
                      _selectedFilter = value.toString();
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

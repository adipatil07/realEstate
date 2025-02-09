import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homescout/core/theme/app_colors.dart';
import 'package:homescout/core/theme/app_text_styles.dart';
import 'package:homescout/features/profile/bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc()..add(LoadProfile()), // Dispatch event here
      child: ProfilePageView(),
    );
  }
}

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.background,
      ),
      body: Container(
        color: AppColors.background,
        padding: EdgeInsets.all(16.0),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/login.png'),
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Text(
                        state.user.name,
                        style: AppTextStyles.heading,
                      ),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Text(
                        state.user.email,
                        style: AppTextStyles.subHeading,
                      ),
                    ),
                    SizedBox(height: 16),
                    Divider(color: AppColors.disabled),
                    SizedBox(height: 16),
                    Text(
                      'Account Information',
                      style: AppTextStyles.subtitle,
                    ),
                    SizedBox(height: 8),
                    _buildProfileDetail(
                        Icons.person, 'Username', state.user.username),
                    _buildProfileDetail(Icons.phone, 'Phone', state.user.phone),
                    _buildProfileDetail(
                        Icons.location_on, 'Address', state.user.address),
                    _buildProfileDetail(Icons.home, 'Properties Listed',
                        '${state.user.propertiesListed}'),
                    _buildProfileDetail(
                        Icons.favorite, 'Favorites', '${state.user.favorites}'),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Add logout functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.error,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                        ),
                        child: Text('Logout', style: AppTextStyles.button),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Text('Failed to load profile'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildProfileDetail(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: AppTextStyles.body),
      subtitle: Text(value, style: AppTextStyles.small),
    );
  }
}

import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header orange
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFE8572A),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/Logo_2.png',
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ayocuci Laundry',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, color: Colors.white70, size: 12),
                                    Text(
                                      'Jakarta, Indonesia',
                                      style: TextStyle(color: Colors.white70, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Icon(Icons.notifications_outlined, color: Colors.white, size: 28),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'Pendapatan Hari Ini',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'IDR 10.000.000',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Center(
                      child: Text(
                        'senin, 17 november 2025 | 10:45',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Stats row
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _StatItem(label: 'Penjualan', value: 'IDR 10.000.000', icon: Icons.favorite_border),
                          _StatItem(label: 'Pengeluaran', value: 'IDR 5.000.000', icon: Icons.receipt_long),
                          _StatItem(label: 'Transaksi', value: '250', icon: Icons.swap_horiz),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Menu grid
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: const [
                    _MenuItem(label: 'Layanan', icon: 'assets/icons/Icon_layanan.png'),
                    _MenuItem(label: 'Pelanggan', icon: 'assets/icons/Icon_pelanggan.png'),
                    _MenuItem(label: 'Karyawan', icon: 'assets/icons/Icon_karyawan.png'),
                    _MenuItem(label: 'Pengeluaran', icon: 'assets/icons/Icon_pengeluaran.png'),
                    _MenuItem(label: 'Laporan', icon: 'assets/icons/Icon_laporan.png'),
                    _MenuItem(label: 'Manage Outlet', icon: 'assets/icons/Icon_manageoutlet.png'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Promo section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.person, color: AppColors.primaryColor, size: 16),
                          const SizedBox(width: 4),
                          Text('Promo', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _PromoCard(image: 'assets/images/Promo_oNE.png'),
                          const SizedBox(width: 8),
                          _PromoCard(image: 'assets/images/Promo_tWO.png'),
                          const SizedBox(width: 8),
                          _PromoCard(image: 'assets/images/Promo_three.png'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.person, color: AppColors.primaryColor, size: 16),
                          const SizedBox(width: 4),
                          Text('Informasi', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _PromoCard(image: 'assets/images/Promo_oNE.png'),
                          const SizedBox(width: 8),
                          _PromoCard(image: 'assets/images/Promo_tWO.png'),
                          const SizedBox(width: 8),
                          _PromoCard(image: 'assets/images/Promo_three.png'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Status'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 40), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Laporan'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatItem({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 16),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String label;
  final String icon;

  const _MenuItem({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 56, height: 56),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
      ],
    );
  }
}

class _PromoCard extends StatelessWidget {
  final String image;

  const _PromoCard({required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        image,
        width: 160,
        height: 120,
        fit: BoxFit.cover,
      ),
    );
  }
}
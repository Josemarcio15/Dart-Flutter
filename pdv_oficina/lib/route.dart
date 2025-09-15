// import 'package:flutter/material.dart';

// // importe as páginas
// import 'pages/login.dart';
// // import 'pages/dashboard.dart';
// import 'pages/customers.dart';
// import 'pages/inventory.dart';
// // import 'pages/reports.dart';
// import 'pages/sales.dart';
// // import 'pages/settings.dart';
// // import 'pages/suppliers.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Meu App Flutter',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         scaffoldBackgroundColor: Colors.grey[100],
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.green,
//           foregroundColor: Colors.white,
//         ),
//       ),
//       initialRoute: '/login',
//       routes: {
//         '/login': (context) => const LoginPage(),
//         // '/dashboard': (context) => const SidebarWrapper(child: Dashboard()),
//         '/sales': (context) => const SidebarWrapper(child: SalesPage()),
//         // '/inventory': (context) => const SidebarWrapper(child: InventoryPage()),
//         // '/reports': (context) => const SidebarWrapper(child: ReportsPage()),
//         '/customers': (context) => const SidebarWrapper(child: CustomersPage()),
//         // '/suppliers': (context) => const SidebarWrapper(child: SuppliersPage()),
//         // '/settings': (context) => const SidebarWrapper(child: SettingsPage()),
//       },
//     );
//   }
// }

// // Widget que envolve a página com sidebar
// class SidebarWrapper extends StatefulWidget {
//   final Widget child;
//   const SidebarWrapper({super.key, required this.child});

//   @override
//   _SidebarWrapperState createState() => _SidebarWrapperState();
// }

// class _SidebarWrapperState extends State<SidebarWrapper> {
//   bool isSidebarOpen = true;

//   void toggleSidebar() {
//     setState(() => isSidebarOpen = !isSidebarOpen);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           // Sidebar
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             width: isSidebarOpen ? 220 : 70,
//             color: Colors.white,
//             child: Column(
//               children: [
//                 Container(
//                   height: 60,
//                   color: Colors.green[100],
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   child: Row(
//                     mainAxisAlignment: isSidebarOpen
//                         ? MainAxisAlignment.spaceBetween
//                         : MainAxisAlignment.center,
//                     children: [
//                       if (isSidebarOpen)
//                         const Text(
//                           "VendaSys",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),
//                         ),
//                       IconButton(
//                         icon: const Icon(Icons.menu),
//                         onPressed: toggleSidebar,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 // Menu
//                 _SidebarButton(
//                   icon: Icons.dashboard,
//                   label: "Dashboard",
//                   route: '/dashboard',
//                   isOpen: isSidebarOpen,
//                 ),
//                 _SidebarButton(
//                   icon: Icons.shopping_cart,
//                   label: "Vendas",
//                   route: '/sales',
//                   isOpen: isSidebarOpen,
//                 ),
//                 _SidebarButton(
//                   icon: Icons.inventory,
//                   label: "Estoque",
//                   route: '/inventory',
//                   isOpen: isSidebarOpen,
//                 ),
//                 _SidebarButton(
//                   icon: Icons.bar_chart,
//                   label: "Relatórios",
//                   route: '/reports',
//                   isOpen: isSidebarOpen,
//                 ),
//                 _SidebarButton(
//                   icon: Icons.people,
//                   label: "Clientes",
//                   route: '/customers',
//                   isOpen: isSidebarOpen,
//                 ),
//                 _SidebarButton(
//                   icon: Icons.local_shipping,
//                   label: "Fornecedores",
//                   route: '/suppliers',
//                   isOpen: isSidebarOpen,
//                 ),
//                 _SidebarButton(
//                   icon: Icons.settings,
//                   label: "Configurações",
//                   route: '/settings',
//                   isOpen: isSidebarOpen,
//                 ),
//                 const Spacer(),
//                 Divider(),
//                 // Logout
//                 _SidebarButton(
//                   icon: Icons.logout,
//                   label: "Sair",
//                   route: '/login',
//                   isOpen: isSidebarOpen,
//                   onTap: () {
//                     // limpar token ou SharedPreferences aqui
//                     Navigator.pushReplacementNamed(context, '/login');
//                   },
//                 ),
//                 const SizedBox(height: 12),
//               ],
//             ),
//           ),

//           // Conteúdo principal
//           Expanded(child: widget.child),
//         ],
//       ),
//     );
//   }
// }

// class _SidebarButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String route;
//   final bool isOpen;
//   final VoidCallback? onTap;

//   const _SidebarButton({
//     required this.icon,
//     required this.label,
//     required this.route,
//     required this.isOpen,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap:
//             onTap ??
//             () {
//               Navigator.pushReplacementNamed(context, route);
//             },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//           child: Row(
//             children: [
//               Icon(icon, color: Colors.green[700]),
//               if (isOpen) ...[
//                 const SizedBox(width: 12),
//                 Text(label, style: const TextStyle(fontSize: 16)),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

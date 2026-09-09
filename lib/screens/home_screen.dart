import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Green App Bar
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black12,
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        '\$2,548.75',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const Icon(
                    Icons.account_balance_wallet,
                    size: 50,
                    color: Colors.green,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Income & Expense
            Row(
              children: [

                Expanded(
                  child: _summaryCard(
                    title: 'Income',
                    amount: '\$4,750.00',
                    icon: Icons.arrow_upward,
                    iconColor: Colors.green,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _summaryCard(
                    title: 'Expense',
                    amount: '\$2,201.25',
                    icon: Icons.arrow_downward,
                    iconColor: Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [

                Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            _transaction(
              icon: Icons.restaurant,
              title: 'Food & Drinks',
              date: 'Today',
              amount: '-\$25.60',
              color: Colors.orange,
            ),

            _transaction(
              icon: Icons.directions_car,
              title: 'Transport',
              date: 'Today',
              amount: '-\$15.00',
              color: Colors.blue,
            ),

            _transaction(
              icon: Icons.account_balance_wallet,
              title: 'Salary',
              date: 'Yesterday',
              amount: '+\$3,200.00',
              color: Colors.green,
            ),

            _transaction(
              icon: Icons.shopping_bag,
              title: 'Shopping',
              date: 'Yesterday',
              amount: '-\$60.50',
              color: Colors.purple,
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        selectedItemColor: Colors.green,

        type: BottomNavigationBarType.fixed,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Summary Card
  static Widget _summaryCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black12,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),

              Icon(
                icon,
                color: iconColor,
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            amount,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Transaction
  static Widget _transaction({
    required IconData icon,
    required String title,
    required String date,
    required String amount,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      child: ListTile(
        contentPadding: EdgeInsets.zero,

        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(date),

        trailing: Text(
          amount,
          style: TextStyle(
            color: amount.startsWith('+')
                ? Colors.green
                : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
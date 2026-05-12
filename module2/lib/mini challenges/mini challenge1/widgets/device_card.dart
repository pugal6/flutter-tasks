import 'package:flutter/material.dart';

class DeviceCard extends StatefulWidget {
  final String deviceName;
  final String roomName;
  final IconData icon;
  final bool initialStatus;

  const DeviceCard({
    super.key,
    required this.deviceName,
    required this.roomName,
    required this.icon,
    required this.initialStatus,
  });

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isOn ? Colors.blueAccent : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor:
                isOn ? Colors.white.withOpacity(0.2) : Colors.grey.shade200,
            child: Icon(
              widget.icon,
              size: 30,
              color: isOn ? Colors.white : Colors.black87,
            ),
          ),

          const Spacer(),

          Text(
            widget.deviceName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isOn ? Colors.white : Colors.black,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            widget.roomName,
            style: TextStyle(
              fontSize: 14,
              color: isOn ? Colors.white70 : Colors.grey,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isOn ? "ON" : "OFF",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isOn ? Colors.white : Colors.black87,
                ),
              ),
              Switch(
                value: isOn,
                onChanged: (value) {
                  setState(() {
                    isOn = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
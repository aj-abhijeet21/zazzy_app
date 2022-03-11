import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zazzy_app/services/utils.dart';

class RoomsCard extends StatefulWidget {
  IconData icon;
  String roomName;
  bool isSwitchedOn;
  String description1;
  String? description2;
  VoidCallback? onSwitched;

  RoomsCard({
    required this.description1,
    this.description2,
    required this.icon,
    required this.isSwitchedOn,
    required this.roomName,
    this.onSwitched,
  });

  @override
  State<RoomsCard> createState() => _RoomsCardState();
}

class _RoomsCardState extends State<RoomsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(
              widget.icon,
              color: darkOrange,
            ),
            backgroundColor: Colors.orange.shade50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.roomName,
                // 'Bedroom',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              CupertinoSwitch(
                value: widget.isSwitchedOn,
                activeColor: darkOrange,
                onChanged: (value) {
                  setState(() {
                    widget.isSwitchedOn = !widget.isSwitchedOn;
                  });
                  String status = widget.isSwitchedOn ? 'ON' : 'OFF';
                  Utils.showSnackBar(
                      'Appliance in ${widget.roomName} are switched $status');
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.description1,
            // 'Consuming 10 kWh \nwhich costs \$12',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.description2 ?? '',
            // '4 Active Devices',
            style: TextStyle(
              color: darkOrange,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

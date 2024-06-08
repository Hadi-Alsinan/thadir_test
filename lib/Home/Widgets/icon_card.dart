import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTitleNumberCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final Future<int> numberFuture;
  final Color backgroundColor;
  final Color edgeColor;

  const IconTitleNumberCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.numberFuture,
    required this.backgroundColor,
    required this.edgeColor,
  }) : super(key: key);

  @override
  _IconTitleNumberCardState createState() => _IconTitleNumberCardState();
}

class _IconTitleNumberCardState extends State<IconTitleNumberCard> {
  int _displayedNumber = 0;
  bool _isLoading = true;
  String? _error;

  final double _titleFontSize = 24.sp;
  final double _numberFontSize = 18.sp;
  final double _errorFontSize = 16.sp;

  @override
  void initState() {
    super.initState();
    _fetchNumber();
  }

  Future<void> _fetchNumber() async {
    try {
      int number = await widget.numberFuture;
      setState(() {
        _isLoading = false;
      });
      _incrementNumber(number);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = "Error retrieving number";
      });
    }
  }

  void _incrementNumber(int number) {
    for (int i = 0; i <= number; i++) {
      Future.delayed(Duration(milliseconds: 20 * i), () {
        if (mounted) {
          setState(() {
            _displayedNumber = i;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.40,
      child: Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          side: BorderSide(color: widget.edgeColor, width: 3),
        ),
        color: widget.backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, color: widget.edgeColor, size: 36),
            Text(
              widget.title,
              style: TextStyle(
                color: widget.edgeColor,
                fontSize: _titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            _isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(widget.edgeColor),
                  )
                : _error != null
                    ? Text(
                        _error!,
                        style: TextStyle(
                            color: widget.edgeColor,
                            fontSize: _errorFontSize,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        '$_displayedNumber',
                        style: TextStyle(
                            color: widget.edgeColor,
                            fontSize: _numberFontSize,
                            fontWeight: FontWeight.bold),
                      ),
          ],
        ),
      ),
    );
  }
}

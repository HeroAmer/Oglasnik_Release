import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class LogoContainer extends StatefulWidget {
  const LogoContainer({
    Key key,
  }) : super(key: key);

  @override
  _LogoContainerState createState() => _LogoContainerState();
}

class _LogoContainerState extends State<LogoContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.fill,
          ),
        ),
        width: 80,
        height: 77,
      ),
    );
  }
}

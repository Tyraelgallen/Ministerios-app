import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String route;
  final String img;
  final String labelname;
  final bool visible;

  const CustomCard({
    Key? key,
    required this.img,
    required this.route,
    required this.labelname,
    required this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return visible == true
        ? Container(
            //color: Colors.green,
            width: MediaQuery.of(context).size.width * 0.42,
            height: 260,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, route),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage(img),
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                      width: 160,
                      height: 230,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  labelname,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          )
        : const SizedBox(
            height: 0,
            width: 0,
          );
  }
}

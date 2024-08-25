import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListCategoriesComponent extends StatelessWidget {
  final String desc, price;
  final String image;
  final void Function()? onPressed, onIconPressed;
  final Widget icon;

  const ListCategoriesComponent({
    super.key,
    required this.desc,
    required this.image,
    required this.price,
    this.onPressed,
    this.onIconPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150.w,
        height: 100.h,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.network(
                    image,
                    errorBuilder: (context, error, stackTrace) => const Image(
                        fit: BoxFit.cover,
                        width: 50,
                        image: AssetImage('assets/images/place_holder.png')),
                    width: 120.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: onIconPressed, icon: icon),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              desc,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis),
            ),
            Text(
              price,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis),
            ),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff01ca0a),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                onPressed == null ? "out of stock".tr : "add to cart".tr,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ListWishlistComponent extends StatelessWidget {
//   final String desc, price;
//   final String image;
//   final void Function()? onPressed;
//
//   const ListWishlistComponent({
//     super.key,
//     required this.desc,
//     required this.image,
//     required this.price,
//     this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         width: 150.w,
//         height: 100.h,
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: Image.network(
//                 image,
//                 errorBuilder: (context, error, stackTrace) => Image(
//                     fit: BoxFit.cover,
//                     height: 120.h,
//                     width: 120.w,
//                     image:
//                         const NetworkImage('https://via.placeholder.com/150')),
//                 width: 120.w,
//                 height: 120.h,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Text(
//               overflow: TextOverflow.ellipsis,
//               desc,
//               style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   overflow: TextOverflow.ellipsis),
//             ),
//             Text(
//               price,
//               style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   overflow: TextOverflow.ellipsis),
//             ),
//             ElevatedButton(
//               onPressed: onPressed,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xff01ca0a),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.r),
//                 ),
//               ),
//               child: Text(
//                 onPressed == null ? "out of stock".tr : "add to cart".tr,
//                 style: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w400,
//                     overflow: TextOverflow.ellipsis),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ListWishlistComponent extends StatelessWidget {
//   final String desc, price;
//   final String image;
//   final void Function()? onPressed;
//
//   const ListWishlistComponent({
//     super.key,
//     required this.desc,
//     required this.image,
//     required this.price,
//     this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         width: 150.w,
//         height: 200.h,
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Icon(
//                   Icons.favorite,
//                   color: Colors.red,
//                 )
//               ],
//             ),
//             Expanded(
//               child: Image.network(
//                 image,
//                 errorBuilder: (context, error, stackTrace) => Image.network(
//                   'https://via.placeholder.com/150',
//                   fit: BoxFit.cover,
//                   width: 120.w,
//                   height: 120.h,
//                 ),
//                 width: 120.w,
//                 height: 120.h,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Text(
//               desc,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             Text(
//               price,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: onPressed,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: onPressed == null
//                     ? Colors.grey // Out of stock button color
//                     : const Color(0xff01ca0a), // Add to cart button color
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.r),
//                 ),
//               ),
//               child: Text(
//                 onPressed == null ? "out of stock".tr : "add to cart".tr,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

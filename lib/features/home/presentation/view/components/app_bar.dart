import 'package:bookly/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: !isSearch ? 110 : double.infinity,
      leading: !isSearch
          ? Hero(
              tag: 'logo',
              child: SvgPicture.asset(
                SvgUtils.logo,
                fit: BoxFit.scaleDown,
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(right: 50, left: 12, top: 6),
              child: TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                autofocus: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  hintText: 'Search ...',
                  hintStyle: TextStyle(color: Colors.grey[300]),
                ),
              ),
            ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              isSearch = !isSearch;
            });
          },
          icon: Icon(!isSearch ? Icons.search : Icons.close),
        )
      ],
    );
  }
}

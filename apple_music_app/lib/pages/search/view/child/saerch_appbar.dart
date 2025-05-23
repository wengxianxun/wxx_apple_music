// Copyright (c) 2017, Spencer. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:apple_music_app/config/huuua_theme.dart';
import 'package:apple_music_app/pages/search/music_search_controller.dart';
import 'package:apple_music_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

typedef AppBar AppBarCallback(BuildContext context);
typedef void TextFieldSubmitCallback(String value);
typedef void TextFieldChangeCallback(String value);
typedef void SetStateCallback(void fn());

class SearchAppBar {
  /// Whether the search should take place "in the existing search bar", meaning whether it has the same background or a flipped one. Defaults to true.
  final bool inBar;

  /// Whether or not the search bar should close on submit. Defaults to true.
  final bool closeOnSubmit;

  /// Whether the text field should be cleared when it is submitted
  final bool clearOnSubmit;

  /// A callback which should return an AppBar that is displayed until search is started. One of the actions in this AppBar should be a search button which you obtain from SearchBar.getSearchAction(). This will be called every time search is ended, etc. (like a build method on a widget)
  final AppBarCallback buildDefaultAppBar;

  /// A void callback which takes a string as an argument, this is fired every time the search is submitted. Do what you want with the result.
  final TextFieldSubmitCallback onSubmitted;

  /// A void callback which gets fired on close button press.
  final VoidCallback onClosed;

  /// A callback which is fired when clear button is pressed.
  final VoidCallback onCleared;

  /// Since this should be inside of a State class, just pass setState to this.
  final SetStateCallback setState;

  /// Whether or not the search bar should add a clear input button, defaults to true.
  final bool showClearButton;

  /// What the hintText on the search bar should be. Defaults to 'Search'.
  final String hintText;

  /// Whether search is currently active.
  final ValueNotifier<bool> isSearching = ValueNotifier(false);

  /// A callback which is invoked each time the text field's value changes
  final TextFieldChangeCallback onChanged;

  /// The controller to be used in the textField.
  TextEditingController? controller;

  /// Whether the clear button should be active (fully colored) or inactive (greyed out)
  bool _clearActive = false;

  MusicSearchController searchController;

  /// The last built default AppBar used for colors and such.
  AppBar _defaultAppBar = AppBar();
  final FocusNode _contentFocusNode = FocusNode();
  SearchAppBar({
    required this.setState,
    required this.searchController,
    required this.buildDefaultAppBar,
    required this.onSubmitted,
    this.controller,
    this.hintText = 'Search',
    this.inBar = true,
    this.closeOnSubmit = true,
    this.clearOnSubmit = true,
    this.showClearButton = true,
    required this.onChanged,
    required this.onClosed,
    required this.onCleared,
  }) {
    controller ??= TextEditingController();

    // Don't waste resources on listeners for the text controller if the dev
    // doesn't want a clear button anyways in the search bar
    if (!showClearButton) {
      return;
    }

    controller!.addListener(() {
      if (controller!.text.isEmpty) {
        // If clear is already disabled, don't disable it
        if (_clearActive) {
          _clearActive = false;
          onChanged.call('');
        }

        return;
      }

      // If clear is already enabled, don't enable it
      if (!_clearActive) {
        _clearActive = true;
        onChanged.call(controller!.text);
      }
    });
  }

  /// Initializes the search bar.
  ///
  /// This adds a route that listens for onRemove (and stops the search when that happens), and then calls [setState] to rebuild and start the search.
  void beginSearch(context) {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: () {
          setState(() {
            isSearching.value = false;
          });
        },
      ),
    );

    setState(() {
      isSearching.value = true;
    });
  }

  /// Builds, saves and returns the default app bar.
  ///
  /// This calls the [buildDefaultAppBar] provided in the constructor, and saves it to [_defaultAppBar].
  AppBar buildAppBar(BuildContext context) {
    _defaultAppBar = buildDefaultAppBar(context);

    return _defaultAppBar;
  }

  /// Builds the search bar!
  ///
  /// The leading will always be a back button.
  /// backgroundColor is determined by the value of inBar
  /// title is always a [TextField] with the key 'SearchBarTextField', and various text stylings based on [inBar]. This is also where [onSubmitted] has its listener registered.
  ///
  AppBar buildSearchBar(BuildContext context) {
    return AppBar(
      // leading: AppbarButton(
      //   icon: Icons.arrow_back_ios_rounded,
      //   onItemTap: () {
      //     onClosed.call();
      //     controller!.clear();
      //     Get.back();
      //   },
      // ),
      leadingWidth: 58,
      elevation: 0,
      backgroundColor: GetTheme(HuuuaColorEnum.backgroundColor),
      titleSpacing: 0,
      title: Directionality(
        textDirection: Directionality.of(context),
        child: Obx(() {
          return searchWidget();
        }),
      ),
      // actions: !showClearButton ? null : <Widget>[],
    );
  }

  Widget searchWidget() {
    return Container(
      height: 36.h,
      child: Row(children: [Expanded(child: searchTextField()), searchBtn()]),
    );
  }

  Widget searchBtn() {
    return Container(
      child: Center(
        child: InkWell(
          onTap: () {
            _contentFocusNode.unfocus();
            onSubmitted.call(controller!.text);
          },
          child: Container(
            margin: EdgeInsets.only(left: 12.w, right: 12.w),
            width: 70.w,
            height: 36.h,
            decoration: BoxDecoration(
              color:
                  searchController.searchText.value.isNotEmpty
                      ? GetTheme(HuuuaColorEnum.color_FFD600)
                      : GetTheme(HuuuaColorEnum.cardColor),
              borderRadius: BorderRadius.all(Radius.circular(18.r)),
            ),
            alignment: Alignment.center,
            child: Text(
              "search".tr,
              style: TextStyle(
                fontSize: 15.sp,
                color:
                    searchController.searchText.value.isNotEmpty
                        ? GetTheme(HuuuaColorEnum.color_000000)
                        : GetTheme(HuuuaColorEnum.color_AAAAAA),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget searchTextField() {
    return Container(
      height: 36.h,
      decoration: BoxDecoration(
        color: GetTheme(HuuuaColorEnum.cardColor), //const Color(0xfff1f1f1),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: TextField(
        autofocus: false,
        focusNode: _contentFocusNode,
        controller: controller,
        cursorColor: Get.isDarkMode ? Colors.white : Colors.black54,
        cursorHeight: 16,
        cursorRadius: const Radius.circular(1),
        textAlign: TextAlign.start,
        textInputAction: TextInputAction.search,
        style: TextStyle(
          fontSize: 13,
          textBaseline: TextBaseline.alphabetic,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 14,
            right: 14,
            top: 0,
            bottom: 0,
          ),
          fillColor: const Color(0x00cccccc),
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00FF0000)),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),

          hintText: ' ${'input_keyword'.tr}',
          hintStyle: TextStyle(
            fontSize: 14.sp,
            height: 1.5,
            color: GetTheme(HuuuaColorEnum.color_AAAAAA),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00000000)),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          prefixIcon: Image.asset(
            Util.assetImage('search.png'),
            width: 18.w,
            height: 18.w,
          ), //添加内部左边图标
          prefixIconConstraints: const BoxConstraints(),
          prefix: SizedBox(width: 8.w, height: 13),
          suffixIcon:
              _clearActive
                  ? InkWell(
                    onTap: () {
                      controller!.text = '';

                      setState(() {});
                      onCleared();
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        color: GetTheme(HuuuaColorEnum.color_FFD600),
                        border: Border.all(
                          color: GetTheme(HuuuaColorEnum.color_000000),
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        weight: 5,
                        color: GetTheme(HuuuaColorEnum.color_000000),
                        size: 10,
                      ),
                    ),
                  )
                  : null,
          suffixIconConstraints: const BoxConstraints(),
          // prefixIconConstraints: BoxConstraints(
          //     //添加内部图标之后，图标和文字会有间距，实现这个方法，不用写任何参数即可解决
          //
          // ),
        ),
        onSubmitted: (value) {
          print(value);
          _contentFocusNode.unfocus();
          onSubmitted.call(value);
        },
      ),
    );
  }

  /// Returns an [IconButton] suitable for an Action
  ///
  /// Put this inside your [buildDefaultAppBar] method!
  IconButton getSearchAction(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        beginSearch(context);
      },
    );
  }

  /// Returns an AppBar based on the value of [isSearching]
  AppBar build(BuildContext context) {
    return buildSearchBar(context);
    // return isSearching.value ? buildSearchBar(context) : buildAppBar(context);
  }
}

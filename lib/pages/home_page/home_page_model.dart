import '/component/footer/footer_widget.dart';
import '/component/header_up/header_up_widget.dart';
import '/component/headerdown/headerdown_widget.dart';
import '/component/headerdown1/headerdown1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // Model for headerUp component.
  late HeaderUpModel headerUpModel1;
  // Model for headerdown component.
  late HeaderdownModel headerdownModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 1;

  // Model for headerUp component.
  late HeaderUpModel headerUpModel2;
  // Model for headerdown1 component.
  late Headerdown1Model headerdown1Model;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered5 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered6 = false;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController3;
  int carouselCurrentIndex3 = 1;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController4;
  int carouselCurrentIndex4 = 1;

  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerUpModel1 = createModel(context, () => HeaderUpModel());
    headerdownModel = createModel(context, () => HeaderdownModel());
    headerUpModel2 = createModel(context, () => HeaderUpModel());
    headerdown1Model = createModel(context, () => Headerdown1Model());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerUpModel1.dispose();
    headerdownModel.dispose();
    headerUpModel2.dispose();
    headerdown1Model.dispose();
    footerModel.dispose();
  }
}

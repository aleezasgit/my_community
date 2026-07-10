part of 'configs.dart';

abstract class UIProps {
  // Animations
  static Duration duration0 = const Duration(milliseconds: 150);
  static Duration duration = const Duration(milliseconds: 280);
  static Duration duration2 = const Duration(milliseconds: 400);

  // Paddings
  static EdgeInsets? btnPadMed;
  static EdgeInsets? btnPadSm;

  // Radius
  static double radius = 15;
  static BorderRadius? tabRadius;
  static BorderRadius? buttonRadius;
  static BorderRadius? radiusS;
  static BorderRadius? radiusM;
  static BorderRadius? radiusL;
  static BorderRadius? radiusXL;
  static BoxDecoration? borderButton;
  static BorderRadius? topBoth15;
  static BorderRadius? topBoth20;

  // Shadows
  static List<BoxShadow>? cardShadow;
  static List<BoxShadow>? buttonShadow;
  static List<BoxShadow>? redShadow;

  // BoxDecoration
  static BoxDecoration? boxCard;
  static BoxDecoration? popupCard;
  static Gradient? primaryGradient;
  static Gradient? secondaryGradient;

  static void init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    initRadius(context);
    initButtons(context);
    initShadows();
    initBoxDecorations(context);
    initGradient(context);
  }

  static void initRadius(BuildContext context) {
    tabRadius = BorderRadius.circular(radius * 2);
    buttonRadius = BorderRadius.circular(ScreenUtil().radius(16));
    radiusS = BorderRadius.circular(ScreenUtil().radius(8));
    radiusM = BorderRadius.circular(ScreenUtil().radius(16));
    radiusL = BorderRadius.circular(ScreenUtil().radius(24));
    radiusXL = BorderRadius.circular(ScreenUtil().radius(45));
    topBoth15 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(15)),
      topRight: Radius.circular(ScreenUtil().radius(15)),
    );
    topBoth20 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(20)),
      topRight: Radius.circular(ScreenUtil().radius(20)),
    );
  }

  static void initButtons(BuildContext context) {
    borderButton = BoxDecoration(
      borderRadius: UIProps.buttonRadius,
      border: Border.all(
        width: 1.4,
        color: AppTheme.of(context).text.shade800!,
      ),
    );
    btnPadSm = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 2,
      vertical: AppDimensions.padding! * 1.0,
    );
    btnPadMed = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 3,
      vertical: AppDimensions.padding! * 1.5,
    );
  }

  static void initShadows() {
    cardShadow = [
      BoxShadow(color: Color(0x0F0D0D12), blurRadius: 2, offset: Offset(0, 1)),
    ];
    buttonShadow = [
      BoxShadow(
        color: Color(0x0F0D0D12),
        blurRadius: 2,
        offset: const Offset(0, 1),
      ),
    ];
    redShadow = [
      BoxShadow(
        color: Color(0x8FF65555),
        blurRadius: 20.7,
        offset: Offset(0, 0),
      ),
    ];
  }

  static void initBoxDecorations(BuildContext context) {
    boxCard = BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      color: AppTheme.of(context).white,
      border: Border.all(
        color: AppTheme.of(context).lightGrey.main!,
        width: 1.w,
      ),
    );
  }

  static void initGradient(BuildContext context) {
    //   primaryGradient = LinearGradient(
    //     colors: [
    //       Color.lerp(
    //         AppTheme.of(context).primaryGradient.startColor,
    //         const Color(0xFF6B53DD),
    //         0.5,
    //       )!,
    //       Color.lerp(
    //         AppTheme.c.primaryGradient.startColor,
    //         AppTheme.c.primaryGradient.endColor,
    //         0.5,
    //       )!,
    //       Color.lerp(
    //         AppTheme.c.primaryGradient.startColor,
    //         AppTheme.c.primaryGradient.endColor,
    //         0.75,
    //       )!,
    //       AppTheme.c.primaryGradient.endColor,
    //       AppTheme.c.primaryGradient.endColor,
    //     ],
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     stops: const [0, 0.15, 0.3, 0.6, 1.0],
    //     transform: GradientRotation(-0.1),
    //   );
    //   secondaryGradient = LinearGradient(
    //     begin: Alignment.topCenter,
    //     end: Alignment.bottomCenter,
    //     colors: [
    //       AppTheme.c.primary.shade300!.withValues(alpha: 0.9),
    //       AppTheme.c.white!,
    //       AppTheme.c.white!,
    //     ],
    //     stops: [0.3, 0.6, 0.1],
    //     transform: GradientRotation(-3 / 8),
    //   );
  }
}

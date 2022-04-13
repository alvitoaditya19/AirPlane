import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: 300,
              height: 211,
              padding: EdgeInsets.all(
                defaultMargin,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_card.png'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        margin: EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icon_plane.png'))),
                      ),
                      Text(
                        'Pay',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 41,
                  ),
                  Text(
                    'Balance',
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: light),
                  ),
                  Text(
                    'IDR 280.000.000',
                    style: whiteTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: 80,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            Text(
              'Big Bonus 🎉',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 32,
              ),
            )
          ],
        ),
      );
    }

    Widget subtitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            Text(
              'We give you early credit so that\nyou can buy a flight ticket',
              style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    Widget buttonStart() {
      return CustomButton(
        title: 'Start Fly Now',
        width: 220,
        margin: EdgeInsets.only(
          top: 50,
        ),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            title(),
            subtitle(),
            buttonStart(),
          ],
        ),
      ),
    );
  }
}

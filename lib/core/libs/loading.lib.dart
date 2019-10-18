import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/loading.bloc.dart';

class LoadingWidget extends StatelessWidget {
  final bool blockPopScopeWhileLoading;
  // TODO: ver isso depois
  // final Widget child;
  LoadingWidget({this.blockPopScopeWhileLoading = false});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: LoadingBloc.loadingStream,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data) {
            // TODO: Refatorar loading
            // return WillPopScope(
            //   onWillPop: () async {
            //     if (snapshot.data) {
            //       return blockPopScopeWhileLoading ? false : true;
            //     } else {
            //       return true;
            //     }
            //   },
            //   child:
            return Stack(
              children: [
                Opacity(
                  opacity: 0.3,
                  child: ModalBarrier(dismissible: false, color: Colors.grey),
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
            // );
          } else {
            return Center();
          }
        }
        return Center();
      },
    );
  }
}

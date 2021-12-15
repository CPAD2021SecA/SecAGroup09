/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */

import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_firebase_vote/models/vote.dart";
import "package:flutter_firebase_vote/state/vote.dart";

class VoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VoteState>(builder: (context, voteState, child) {
      Vote activeVote = voteState.activeVote;
      List<String> options = List<String>();

      for (Map<String, int> option in activeVote.options) {
        option.forEach((title, value) {
          options.add(title);
        });
      }

      return Column(
        children: <Widget>[
          Card(
            child: Container(
              color:Colors.blueGrey,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Text(
                activeVote.voteTitle,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          for (String option in options)
            Card(
              child: InkWell(
                onTap: () {
                  voteState.selectedOptionInActiveVote = option;
                },
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(minHeight: 60),
                        width: 8,
                        color: Colors.teal,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          alignment: Alignment.center,
                          child: Text(
                            option,
                            maxLines: 5,
                            style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
                          ),
                          color: voteState.selectedOptionInActiveVote == option
                              ? Colors.teal
                              : Colors.black12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}

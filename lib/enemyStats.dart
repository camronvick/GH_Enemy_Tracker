import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EnemyStats extends StatefulWidget {
  var scenarioLevel;
  var enemyJson;
  var enemyStats;
  var updateEnemyStats;
  var enemyName;

  EnemyStats(
      scenarioLevel, enemyJson, enemyName, enemyStats, updateEnemyStats) {
    this.scenarioLevel = scenarioLevel;
    this.enemyJson = enemyJson;
    this.enemyStats = enemyStats;
    this.updateEnemyStats = updateEnemyStats;
    this.enemyName = enemyName;
  }

  @override
  _EnemyStatsState createState() => _EnemyStatsState(
      scenarioLevel, enemyJson, enemyName, enemyStats, updateEnemyStats);
}

class _EnemyStatsState extends State<EnemyStats> {
  var scenarioLevel;
  var enemyJson;
  var enemyStats;
  var updateEnemyStats;
  var enemyName;
  var maxEnemies;
  String normalAttributeString = '';
  String eliteAttributeString = '';

  _EnemyStatsState(
      scenarioLevel, enemyJson, enemyName, enemyStats, updateEnemyStats) {
    this.scenarioLevel = scenarioLevel;
    this.enemyJson = enemyJson;
    this.enemyStats = enemyStats;
    this.updateEnemyStats = updateEnemyStats;
    this.enemyName = enemyName;
  }

  void setAttributes() {
    // parses attributes for normal and elite then sets the variables
    for (var attribute in enemyJson['level'][scenarioLevel]['normal']
        ['attributes']) {
      normalAttributeString += '\n' + attribute;
    }

    for (var attribute in enemyJson['level'][scenarioLevel]['elite']
        ['attributes']) {
      eliteAttributeString += '\n' + attribute;
    }
  }

  void createEmptyEnemies() {
    // Creates maxNumber null objects in a list that will become enemy stats objects when their corresponding square is selected
    enemyStats[enemyName] = [];
    int i = 0;
    while (i < maxEnemies) {
      enemyStats[i] = null;
      i++;
    }
  }

  @override
  void initState() {
    super.initState();
    print('OG ENEMY STATS');
    print(enemyStats);
    maxEnemies = enemyJson['maxEnemies'];
    setAttributes();
    if (enemyStats[enemyName] == null) {
      // If this is the first time you select this enemy, initialize all the enemies to null
      createEmptyEnemies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                // top stats section
                color: Color.fromRGBO(50, 50, 50, 1),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          // enemy name and back button
                          children: [
                            Expanded(child: Container() // Back button
                                ),
                            Expanded(
                                flex: 5,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  // color: Colors.purple,
                                  child: Text(
                                    enemyName,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                )),
                            Expanded(
                                child:
                                    Container()), // empty, used to center the text
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        // List the enemy's stats
                        // margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              // normal stats
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 10,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                // padding: EdgeInsets.only(left: 20),
                                                // margin: EdgeInsets.only(right: 20),
                                                height: 20,
                                                width: 20,
                                                child: Center(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                        fit: BoxFit.fitWidth,
                                                        alignment:
                                                            FractionalOffset
                                                                .center,
                                                        image: AssetImage(
                                                            'assets/icons/gh_health_white.png'),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                // enemyJson[scenarioLevel],
                                                '${enemyJson['level'][scenarioLevel]['normal']['health']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                // padding: EdgeInsets.only(left: 20),
                                                // margin: EdgeInsets.only(right: 20),
                                                height: 20,
                                                width: 20,
                                                child: Center(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                        fit: BoxFit.fitWidth,
                                                        alignment:
                                                            FractionalOffset
                                                                .center,
                                                        image: AssetImage(
                                                            'assets/icons/gh_range_white.png'),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${enemyJson['level'][scenarioLevel]['normal']['range']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                // padding: EdgeInsets.only(left: 20),
                                                // margin: EdgeInsets.only(right: 20),
                                                height: 20,
                                                width: 20,
                                                child: Center(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                        fit: BoxFit.fitWidth,
                                                        alignment:
                                                            FractionalOffset
                                                                .center,
                                                        image: AssetImage(
                                                            'assets/icons/gh_movement_white.png'),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${enemyJson['level'][scenarioLevel]['normal']['move']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                // padding: EdgeInsets.only(left: 20),
                                                // margin: EdgeInsets.only(right: 20),
                                                height: 20,
                                                width: 20,
                                                child: Center(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                        fit: BoxFit.fitWidth,
                                                        alignment:
                                                            FractionalOffset
                                                                .center,
                                                        image: AssetImage(
                                                            'assets/icons/gh_attack_white.png'),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${enemyJson['level'][scenarioLevel]['normal']['attack']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 70,
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      normalAttributeString,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            Expanded(
                                child: Container(
                              // elite stats
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 10,
                                    color: Colors.yellow[600],
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                // padding: EdgeInsets.only(left: 20),
                                                // margin: EdgeInsets.only(right: 20),
                                                height: 20,
                                                width: 20,
                                                child: Center(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                        fit: BoxFit.fitWidth,
                                                        alignment:
                                                            FractionalOffset
                                                                .center,
                                                        image: AssetImage(
                                                            'assets/icons/gh_health_white.png'),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${enemyJson['level'][scenarioLevel]['elite']['health']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                // padding: EdgeInsets.only(left: 20),
                                                // margin: EdgeInsets.only(right: 20),
                                                height: 20,
                                                width: 20,
                                                child: Center(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                        fit: BoxFit.fitWidth,
                                                        alignment:
                                                            FractionalOffset
                                                                .center,
                                                        image: AssetImage(
                                                            'assets/icons/gh_range_white.png'),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${enemyJson['level'][scenarioLevel]['elite']['range']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                // padding: EdgeInsets.only(left: 20),
                                                // margin: EdgeInsets.only(right: 20),
                                                height: 20,
                                                width: 20,
                                                child: Center(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                        fit: BoxFit.fitWidth,
                                                        alignment:
                                                            FractionalOffset
                                                                .center,
                                                        image: AssetImage(
                                                            'assets/icons/gh_movement_white.png'),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${enemyJson['level'][scenarioLevel]['elite']['move']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                // padding: EdgeInsets.only(left: 20),
                                                // margin: EdgeInsets.only(right: 20),
                                                height: 20,
                                                width: 20,
                                                child: Center(
                                                  child: AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                        fit: BoxFit.fitWidth,
                                                        alignment:
                                                            FractionalOffset
                                                                .center,
                                                        image: AssetImage(
                                                            'assets/icons/gh_attack_white.png'),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${enemyJson['level'][scenarioLevel]['elite']['attack']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 70,
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      eliteAttributeString,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ), // row of two columns with the stats for normal and elite
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(child: makeStatBox(1)),
                          (maxEnemies > 2)
                              ? Expanded(child: makeStatBox(3))
                              : SizedBox.shrink(),
                          (maxEnemies > 4)
                              ? Expanded(child: makeStatBox(5))
                              : SizedBox.shrink(),
                          (maxEnemies > 6)
                              ? Expanded(child: makeStatBox(7))
                              : SizedBox.shrink(),
                          (maxEnemies > 8)
                              ? Expanded(child: makeStatBox(9))
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                  (maxEnemies >
                          1) // basically if this isn't a boss then render another column of enemies
                      ? Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                Expanded(child: makeStatBox(2)),
                                (maxEnemies > 3)
                                    ? Expanded(child: makeStatBox(4))
                                    : SizedBox.shrink(),
                                (maxEnemies > 5)
                                    ? Expanded(child: makeStatBox(6))
                                    : SizedBox.shrink(),
                                (maxEnemies > 7)
                                    ? Expanded(child: makeStatBox(8))
                                    : SizedBox.shrink(),
                                (maxEnemies > 9)
                                    ? Expanded(child: makeStatBox(10))
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ), // bottom individual enemy previews section
          ),
        ],
      ),
    );
  }

  Widget makeStatusPicture(effect, size, opacity) {
    return Container(
      height: size,
      width: size,
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fitWidth,
              colorFilter: new ColorFilter.mode(
                  Colors.white.withOpacity(opacity), BlendMode.lighten),
              alignment: FractionalOffset.center,
              image: AssetImage('assets/icons/gh_$effect.png'),
            )),
          ),
        ),
      ),
    );
  }

  Widget makeStatBox(number) {
    return (enemyStats[enemyName][number - 1] == null)
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: Color.fromRGBO(50, 50, 50, 1),
              ),
            ),
            child: Center(
              child: TextButton(
                  onPressed: () => {
                        // ************************************************ Elite or Normal ****************************************************************************
                        print('ENTERING DIALOGUE'),
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return eliteOrNormalDialogue(context, number);
                            }),
                      },
                  child:
                      Text('Spawn', style: Theme.of(context).textTheme.button)),
            ),
          )
        : Container(
            // Each of these will display health and status effects of one enemy
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: Color.fromRGBO(50, 50, 50, 1),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    // top row that will have the enemy number in the top left, health in the middle, kill button top right
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(10),
                            // Top right box with number
                            child: Text(
                              '$number',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return editStatsDialogue(context, number);
                                }),
                          },
                          child: Expanded(
                            child: Container(
                              // top middle box with health
                              child: Column(
                                // need to split it into 2 to center the health in the entire box
                                children: [
                                  Expanded(
                                    child: Container(
                                        // top of middle box used to center the health in the box below it
                                        ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      // conceptually the center box in a grid of 9 boxes
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            // padding: EdgeInsets.only(left: 20),
                                            // margin: EdgeInsets.only(right: 20),
                                            height: 25,
                                            width: 25,
                                            child: Center(
                                              child: AspectRatio(
                                                aspectRatio: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                    fit: BoxFit.fitWidth,
                                                    alignment:
                                                        FractionalOffset.center,
                                                    image: AssetImage(
                                                        'assets/icons/gh_health_maroon.png'),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${enemyStats[enemyName][number - 1]['health']}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Material(
                            color: Colors.white,
                            child: Container(
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.only(top: 5),
                              // Top right box with number
                              child: IconButton(
                                icon: const Icon(Icons.cancel_outlined),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    // bottom row that will have the enemy status effects
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        enemyStats[enemyName][number - 1]['statusEffects']
                                    .length >
                                0
                            ? makeStatusPicture(
                                enemyStats[enemyName][number - 1]
                                    ['statusEffects'][0],
                                20.0,
                                0.0)
                            : SizedBox.shrink(),
                        enemyStats[enemyName][number - 1]['statusEffects']
                                    .length >
                                1
                            ? makeStatusPicture(
                                enemyStats[enemyName][number - 1]
                                    ['statusEffects'][1],
                                20.0,
                                0.0)
                            : SizedBox.shrink(),
                        enemyStats[enemyName][number - 1]['statusEffects']
                                    .length >
                                2
                            ? makeStatusPicture(
                                enemyStats[enemyName][number - 1]
                                    ['statusEffects'][2],
                                20.0,
                                0.0)
                            : SizedBox.shrink(),
                        enemyStats[enemyName][number - 1]['statusEffects']
                                    .length >
                                3
                            ? makeStatusPicture(
                                enemyStats[enemyName][number - 1]
                                    ['statusEffects'][3],
                                20.0,
                                0.0)
                            : SizedBox.shrink(),
                        enemyStats[enemyName][number - 1]['statusEffects']
                                    .length >
                                4
                            ? makeStatusPicture(
                                enemyStats[enemyName][number - 1]
                                    ['statusEffects'][4],
                                20.0,
                                0.0)
                            : SizedBox.shrink(),
                        enemyStats[enemyName][number - 1]['statusEffects']
                                    .length >
                                5
                            ? makeStatusPicture(
                                enemyStats[enemyName][number - 1]
                                    ['statusEffects'][5],
                                20.0,
                                0.0)
                            : SizedBox.shrink(),
                        enemyStats[enemyName][number - 1]['statusEffects']
                                    .length >
                                6
                            ? makeStatusPicture(
                                enemyStats[enemyName][number - 1]
                                    ['statusEffects'][6],
                                20.0,
                                0.0)
                            : SizedBox.shrink(),
                        enemyStats[enemyName][number - 1]['statusEffects']
                                    .length >
                                7
                            ? makeStatusPicture(
                                enemyStats[enemyName][number - 1]
                                    ['statusEffects'][7],
                                20.0,
                                0.0)
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  // This will be the dialogue pop up when an enemy is clicked, let you change health and status effects
  editStatsDialogue(context, enemyNum) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      backgroundColor: Colors.white,
      child: editStatsContent(context, enemyNum),
    );
  }

  editStatsContent(context, enemyNum) {
    return Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              '$enemyName $enemyNum',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Material(
              color: Colors.white,
              child: Container(
                child: Row(
                  // Add and Subtract health
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.remove),
                      onPressed: () {},
                    ),
                    Text('PH 2'),
                    IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                makeStatusPicture('immobilize', 40.0, .8),
                SizedBox(width: 20),
                makeStatusPicture('poison', 40.0, .8),
                SizedBox(width: 20),
                makeStatusPicture('wound', 40.0, .8),
                SizedBox(width: 20),
                makeStatusPicture('stun', 40.0, .8),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                makeStatusPicture('disarm', 40.0, .8),
                SizedBox(width: 20),
                makeStatusPicture('invisible', 40.0, .8),
                SizedBox(width: 20),
                makeStatusPicture('strengthen', 40.0, .8),
              ],
            ),
          ),
          Container(
            child: Row(
              // Add and Subtract health
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => {
                    Navigator.of(context).pop(),
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // This will be the dialogue pop up when an enemy is clicked, let you change health and status effects
  eliteOrNormalDialogue(context, enemyNum) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      backgroundColor: Colors.white,
      child: eliteOrNormalContent(context, enemyNum),
    );
  }

  eliteOrNormalContent(context, enemyNum) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () => {
              super.setState(() {
                enemyStats[enemyName][enemyNum - 1] = {
                  'health': enemyJson['level'][scenarioLevel]['elite']
                      ['health'],
                  'statusEffects': []
                };
                updateEnemyStats(
                    enemyName,
                    enemyStats[
                        enemyName]); // Update the parent widget so we keep the data when we pop this page
              }),
              print(enemyStats),
              Navigator.of(context).pop(),
            },
            child: Text(
              'Elite',
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(218, 165, 32, 1)),
            ),
          ),
          TextButton(
            onPressed: () => {
              super.setState(() {
                enemyStats[enemyName][enemyNum - 1] = {
                  'health': enemyJson['level'][scenarioLevel]['normal']
                      ['health'],
                  'statusEffects': []
                };
                updateEnemyStats(
                    enemyName,
                    enemyStats[
                        enemyName]); // Update the parent widget so we keep the data when we pop this page
              }),
              print(enemyStats),
              Navigator.of(context).pop(),
            },
            child: Text(
              'Normal',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

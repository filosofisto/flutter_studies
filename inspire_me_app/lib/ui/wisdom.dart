import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;

  List quotes = [
    "The Best Way To Get Started Is To Quit Talking And Begin Doing. – Walt Disney",
    "The Pessimist Sees Difficulty In Every Opportunity. The Optimist Sees Opportunity In Every Difficulty. – Winston Churchill",
    "Don’t Let Yesterday Take Up Too Much Of Today. – Will Rogers",
    "You Learn More From Failure Than From Success. Don’t Let It Stop You. Failure Builds Character. – Unknown",
    "It’s Not Whether You Get Knocked Down, It’s Whether You Get Up. – Inspirational Quote By Vince Lombardi",
    "If You Are Working On Something That You Really Care About, You Don’t Have To Be Pushed. The Vision Pulls You. – Steve Jobs",
    "People Who Are Crazy Enough To Think They Can Change The World, Are The Ones Who Do. – Rob Siltanen",
    "Failure Will Never Overtake Me If My Determination To Succeed Is Strong Enough. – Og Mandino",
    "Entrepreneurs Are Great At Dealing With Uncertainty And Also Very Good At Minimizing Risk. That’s The Classic Entrepreneur. – Mohnish Pabrai",
    "We May Encounter Many Defeats But We Must Not Be Defeated. – Maya Angelou",
    "Knowing Is Not Enough; We Must Apply. Wishing Is Not Enough; We Must Do. – Johann Wolfgang Von Goethe",
    "Imagine Your Life Is Perfect In Every Respect; What Would It Look Like? – Brian Tracy",
    "We Generate Fears While We Sit. We Overcome Them By Action. – Dr. Henry Link",
    "Whether You Think You Can Or Think You Can’t, You’re Right. – Quote By Henry Ford",
    "Security Is Mostly A Superstition. Life Is Either A Daring Adventure Or Nothing. – Life Quote By Helen Keller",
    "The Man Who Has Confidence In Himself Gains The Confidence Of Others. – Hasidic Proverb",
    "The Only Limit To Our Realization Of Tomorrow Will Be Our Doubts Of Today. – Motivational Quote By Franklin D. Roosevelt",
    "Creativity Is Intelligence Having Fun. – Albert Einstein"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14.5)),
                    child: Center(
                        child: Text(
                      quotes[_index % quotes.length],
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontStyle: FontStyle.italic,
                          fontSize: 16.5),
                    ))),
              ),
            ),
            Divider(
              thickness: 2.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                  onPressed: _showQuote,
                  color: Colors.greenAccent.shade700,
                  icon: Icon(Icons.wb_sunny),
                  label: Text(
                    "Inspire me!",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index++;
    });
  }
}

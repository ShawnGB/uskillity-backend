# encoding: UTF-8
module TestExamples
  FIRST_NAMES = %w( Adrian Adrina Agnes Albert Alexander Alexandra Alfred Alina Amelie Amy Andre André Andreas Anette Annette Angela
  Angelika Angelica Angelina Anja Anke Ann Anna Anne Annika Antje Anton Antonia Antonius Arnd Arndt Arne Arnold Artur Arthur Astrid
  August Auguste Barbara Bastian Beate Ben Benjamin Berit Bernd Berndt Berta Bertha Bettina Bianka Bianca Birgit Björn Brigitte
  Britta Brunhilde Carlotta Karlotta Caroline Karoline Carolin Celina Celine Charlotte Cheyenne Chiara Christa Krista Christian
  Kristian Christiane Kristiane Christin Kristin Christina Kristina Christine Christoph Christopher Claudia Klaudia Cora Kora
  Corinna Korinna Cornelia Kornelia Daniel Daniela David Denise Dennis Detlef Detlev Diana Dieter Dirk Dominic Dominik Donis Dorit
  Dorothea Edith Elfriede Elias Elisa Elisabeth Elise Elke Elsa Else Emil Emilia Emily Emely Emilie Emma Eric Erik Erika Erica Erna
  Ernst Eva Fabian Felix Finja Finn Fynn Fiona Flavio Flavius Florian Frank Franz Franziska Franziskus Frieda Frida Friedrich Fritz
  Gabriele Galadriel Georg Gerd Gerda Gerhard Gertrud Gisela Greta Gustav Günther Günter Hagen Halina Hanna Hannah Hannes Hanno
  Hans Harald Hartmut Hedwig Heike Heinrich Heinz Helen Helena Helene Helga Hella Helmut Henny Henni Henri Henry Herbert Hermann
  Herta Hertha Hildegard Holger Horst Hugo Ida Ilse Imke Inge Ingeborg Ingrid Irmgard Isabel Isabell Isabelle Ivonne Yvonne
  Jacqueline Jakob Jacob Jan Jana Janin Janine Janina Jannik Yannick Jannis Janis Jaromir Jasmin Yasmin Jason Jennifer Jens Jessica
  Jessika Jesus Jette Joel Johann Johanna Johannes Jonas Jonathan Josephine Josefine Joshua Jule Julia Julian Julius Justin Jutta
  Jörg Jürgen Kai Karin Karl Carl Karsten Carsten Katharina Catharina Katarina Katja Katrin Kathrin Catrin Kerstin Kevin Kilian
  Kim Klara Clara Klaus Claus Knud Knut Kurt Curt Käthe Käte Lara Lars Lasse Laura Laurin Lea Leah Lena Leni Lennard Lennart Leon
  Leonie Liam Lieselotte Liselotte Lilly Lilli Lily Lina Linus Lisa Lisanne Louisa Luisa Luca Luka Lucas Lukas Lucy Lucie Ludwig
  Luis Louis Luise Louise Maik Meik Mike Maike Meike Maja Maya Manfred Manuela Marc Mark Marcel Marco Marko Marcus Markus Mareike
  Margarethe Margarete Maria Marie Mario Marion Marlon Martha Marta Martin Martina Marvin Marwin Matthias Maurice Max Maximilian
  Mechthild Melanie Melina Melissa Mena Merle Meta Mia Michael Michaela Michelle Mika Minna Miriam Mirko Monika Moritz Nadine
  Natalie Nathalie Nele Neele Nevaeh Nevio Nick Nico Nicole Niklas Niclas Nils Niels Nina Noah Olaf Olav Ole Olga Oliver Oskar
  Oscar Otto Pascal Patrick Paul Paula Peter Petra Philipp Pia Rafael Raphael Rainer Reiner Ralf Ralph Ranya Renate René Richard
  Robert Robin Ronald Ronja Rudolf Rudolph Sabine Sabrina Sandra Sara Sarah Sascha Saskia Sebastian Silke Silvia Sylvia Simon
  Simone Sina Sinah Sonja Sophia Sophie Sofie Stefan Stephan Stefanie Stephanie Steffen Susanne Sven Swen Svenja Tanja Teela Thomas
  Tomas Tim Timm Timea Timo Timotheus Tobias Tom Tomme Torsten Thorsten Ulrich Ulrike Ursula Ute Uwe Vanessa Viktoria Victoria
  Vincent Vivien Vievienne Volker Walter Walther Werner Wilhelm Wilhelmine Willi Willy Wolfgang Yannick Yannik Yanik Yannic Yvonne
  Yasmin Yasmine Zoe Zoé )

  NAMES = %w( Müller Schmidt Schneider Fischer Weber Meyer Wagner Becker Schulz Hoffmann Schäfer Koch Bauer Richter Klein Wolf
  Schröder Neumann Schwarz Zimmermann Braun Krüger Hofmann Hartmann Lange Schmitt Werner Schmitz Krause Meier Lehmann SchmidSchulze
  Maier Köhler Herrmann König Walter Mayer Huber Kaiser Fuchs Peters Lang Scholz Möller Weiß Jung Hahn Schubert Vogel Friedrich
  Keller Günther Frank Berger Winkler Roth Beck Lorenz Baumann Franke Albrecht Schuster Simon Ludwig Böhm Winter Kraus Martin
  Schumacher Krämer Vogt Stein Jäger Otto Sommer Groß Seidel Heinrich Brandt Haas Schreiber Graf Schulte Dietrich Ziegler Kuhn
  Kühn Pohl Engel Horn Busch Bergmann Thomas Voigt Sauer Arnold Wolff Pfeiffer )


  STREETS = %w( Adam-Karillon-Straße Alicenplatz Alicenstraße Anna-Seghers-Platz Aspeltstraße Bahnhofsplatz Bahnhofstraße
  Barbarossaring Bismarckplatz Bonifaziusplatz Bonifaziusstraße Boppstraße Colmarstraße Corneliusstraße Emausweg Erthalstraße
  Feldbergplatz Floßhafen Forsterstraße Franz-Liszt-Straße Frauenlobplatz Gabelsbergerstraße Gartenfeldplatz Gaßnerallee
  Georg-Hamm-Straße Goetheplatz Hafenstraße Hattenbergstraße Heinrich-Heine-Straße Hindenburgplatz Hohenstaufenstraße
  Holsteinstraße Illstraße Josefsstraße Kaiserstraße Kaiser-Karl-Ring Kaiser-Wilhelm-Ring Kleine Ingelheimstraße Klemensstraße
  Kreyßigstraße Kurfürstenstraße Lahnstraße Langer Hunikelweg Leibnizstraße Lennigstraße Lessingplatz Lessingstraße Mainstraße Mittelweg
  Moltkestraße Moselstraße Mozartstraße Mühlenstraße Nackstraße Nahestraße Neckarstraße Osteinstraße Pankratiusstraße Parcusstraße
  Peter-Cornelius-Platz Pfitznerstraße Raimundistraße Raupelsweg Rhabanusstraße Rheinallee Richard-Wagner-Straße Scheffelstraße
  Schottstraße Sebastian-Bach-Straße Sömmeringplatz Sömmeringstraße Taunusstraße Uhlandstraße Valenciaplatz Wallaustraße
  Werderstraße Wiesenweg Woynastraße Zwerchallee Aachener Straße Aaröstraße Abenthumstraße Ackermannbogen Ackermannstraße
  Adalbertstraße Adam-Berg-Straße Adele-Hartmann-Straße Adenauerring Adolf-Mathes-Weg, Agnes-Bernauer-Straße Agnes-Pockels-Bogen
  Agricolaplatz Agricolastraße Ainmillerstraße Akademiestraße Alois-Johannes-Lippl-Weg Alpenveilchenstraße Amalienstraße
  Am\ Oberfeld Am\ Oberwiesenfeld Am\ Olympiapark Anton-Barth-Weg Arcisstraße Artilleriestraße Asperstraße Auerhahnweg Baaderplatz
  Baaderstraße Balanstraße Baldeplatz Bally-Prell-Straße Barer-Straße Bazeillesstraße Berta-Hummel-Straße Bildackerstraße Birkerstraße
  Blütenstraße Blutenburgstraße Bothmerstraße Brienner Straße Brundage-Platz Buntspechtweg Calderonweg Camerloherstraße Canalettostraße
  Candidplatz Candidstraße Claude-Lorrain-Straße Connollystraße Coubertinplatz Curt-Mezger-Platz Dachauer Straße De-La-Paz-Straße
  Destouchesstraße Domagkstraße Donnersbergerstraße Drygalski-Allee Dülferstraße Edelweißplatz Effnerplatz Effnerstraße Eisnergutbogen
  Elisabeth-zu-Guttenberg-Straße Elisenstraße Elsässer-Straße El-Thouni-Weg Emin-Pascha-Straße Engasserbogen Erich-Giese-Straße
  Erni-Singerl-Straße Ernst-Curtius-Weg Falkenturmstraße Fallmerayerstraße Fasaneriestraße Feilitzschstraße Felicitas-Füss-Straße
  Felix-Dahn-Straße Feserstraße Flaschenträgerstraße Frobenstraße Frohschammerstraße Gabelsbergerstraße Ganghoferstraße Gänselieslstraße
  Gärtnerplatz Georg-Brauchle-Ring Georg-Thiele-Straße Gondrellplatz Gotthelfstraße Görresstraße Graf-Lehndorff-Straße Gufidauner\ Straße
  Gustav-Rau-Weg Hanns-Braun-Brücke Hans-Mielich-Straße Härtingerstraße Heckenstallerstraße Helene-Mayer-Ring Helmut-Fischer-Platz
  Herzogstraße Heßstraße Hönigschmidplatz Hugo-Weiss-Straße Ichostraße Ida-Schumacher-Weg Ika-Freudenberg-Straße Implerstraße
  Ingeborg-Bachmann-Straße Irmgard-Gylstorff-Straße Isarlandstraße Johann-Clanze-Straße Karlstraße Karpfenstraße Käthe-Kruse-Straße
  Kaufingerstraße Kazmairstraße Keuslinstraße Klara-Ziegler-Bogen Klenzestraße Kolehmainenweg Konrad-Dreher-Straße Kramergaßl
  Krumpenhofweg Kürnbergstraße Kurt-Hasse-Weg Kusocińskidamm Landshuter Allee Lazarettstraße Leibengerstraße Lemgostraße Leonrodstraße
  Leopoldstraße Lillian-Board-Weg Lilly-Reich-Straße Lindwurmstraße Linprunstraße Lovelockweg Ludwigstraße Luisenstraße Luz-Long-Ufer
  Maillingerstraße Malvenweg Margarete-Steiff-Straße Marsplatz MarsstraßeMaximilianstraße Max-Weber-Platz Meiserstraße Melitta-Benz-Straße
  Michael-Beer-Straße Nadistraße Naupliastraße Neureutherstraße Odeonsplatz Ossietzkystraße Otto-Rothe-Straße Papa-Schmid-Straße
  Passauerstraße Paul-Heyse-Straße Paul-Huml-Bogen Paul-Preuß-Straße Pettenkoferstraße Petuelring Pfanzeltplatz Pfarrer-Steiner-Platz
  Platzl Plinganserstraße Poccistraße Poißlweg Prinzregentenstraße Radlsteg Raglovichstraße Ratzingerplatz Richard-Strauss-Straße
  Richard-Wagner-Straße Robert-Stolz-Platz Romanstraße Roopsingh-Bais-Weg Rotkreuzplatz Rudolf-Harbig-Weg Rumfordstraße Saportastraße
  Sapporobogen Scharfreiterplatz Schellingstraße Scherfweg Schinnaglstraße Schleißheimer-Straße Schlossschmidstraße Schnorr-von-Carolsfeld-Straße
  Schongauerstraße Schreberweg Schwanthalerstraße Schwere-Reiter-Straße Seidlstraße Senftenauerstraße Seybothstraße Simmernstraße
  Spiridon-Louis-Ring Steinheilstraße Steinickeweg Straßbergerstraße St.-Jakobs-Platz Stuntzstraße Sustrisstraße Terofalstraße
  Theodor-Kober-Straße Toni-Berger-Straße Toni-Merkens-Weg Trogerstraße Tsingtauer Straße Türkenstraße Utzschneiderstraße
  Vandalenstraße Veit-Stoß-Straße Verdistraße Viktualienmarkt Vilniusstraße Viscardigasse Wallbergstraße Walther-Bathe-Weg
  Wastl-Witt-Straße Wedekindplatz Welzenbachstraße Wendl-Dietrich-Straße Werner-Seelenbinder-Weg Westenriederstraße Widenmayerstraße
  Widmannstraße Wilhelm-Dörpfeld-Weg Willi-Gebhardt-Ufer Willi-Graf-Straße Willy-Brandt-Allee Winfriedstraße Winthirstraße
  Winzererstraße Xaver-Weismor-Straße Yorkstraße Ysenburgstraße Zaberner Straße Zacharias-Werner-Straße Zacherlweg Zänglweg Zahnbrecherweg
  Zamboninistraß Zamilastraße Zanderstraße Zapfweg Zasingerstraße Zauberwaldstraße Zaubzerstraße Zauneidechsenweg Zaunerstraße
  Zaunkönigstraße Zaunweg Zauserweg Zavelsteinstraße Zechstraße Zenettistraße Ziemssenstraße Zuccallistraße Zypressenweg )

  TOWNS = %w( Berlin Hamburg München Köln Frankfurt Stuttgart Dortmund Düsseldorf Essen Bremen Hannover Leipzig Dresden
  Nürnberg Duisburg Bochum Wuppertal Bielefeld Bonn Mannheim Karlsruhe Wiesbaden Münster Augsburg Gelsenkirchen Aachen
  Mönchengladbach Braunschweig Chemnitz Kiel Krefeld Halle Magdeburg Freiburg Oberhausen Lübeck Erfurt Rostock Mainz
  Kassel Hagen Hamm Saarbrücken Mülheim Herne Ludwigshafen Osnabrück Solingen Leverkusen Oldenburg Potsdam Neuss Heidelberg
  Paderborn Darmstadt Regensburg Würzburg Ingolstadt Heilbronn Göttingen Wolfsburg Recklinghausen Pforzheim Bottrop Bremerhaven
  Fürth Remscheid Reutlingen Moers Koblenz Erlangen Trier Salzgitter Siegen Jena Hildesheim Cottbus Gera Witten Kaiserslautern
  Gütersloh Iserlohn Schwerin Zwickau Düren Ratingen Marl Flensburg Dessau-Roßlau Lünen Hanau Ludwigsburg Tübingen Minden
  Konstanz Worms Wilhelmshaven Villingen-Schwenning Marburg Dorsten Neumünster Lüdenscheid Rheine Castrop-Rauxel Gladbeck
  Viersen Arnsberg Gießen Troisdorf Delmenhorst Bocholt Detmold Bayreuth Lüneburg Norderstedt Celle Bamberg Dinslaken
  Aschaffenburg Unna Lippstadt Plauen Aalen Neubrandenburg Weimar Neuwied Herford Kerpen Grevenbroich Fulda Dormagen Herten
  Landshut Bergheim Garbsen Wesel Rosenheim Sindelfingen Rüsselsheim Langenfeld Offenburg )

  COMPANIES = %w( Aftab\ Automobiles GMG\ Airlines United\ Airways Regent\ Airways Bismillah\ Airlines Best\ Air
  Air\ Sylhet AB\ Bank\ Limited Agrani\ Bank BRAC\ Bank Dhaka\ Bank\ Limited IFIC\ Bank\ Limited Janata\ Bank
  Prime\ Bank\ Limited Pubali\ Bank Rupali\ Bank State\ Bank\ of\ India Dutch\ Bangla\ Bank Beximco Orion\ Group
  Transcom\ Group Dragon\ Group Navana\ Group Ananda\ Group Opsonin RAK\ Ceramics BASF\ Bangladesh BOC\ Bangladesh
  Grameen\ Shakti Rahimafrooz Adamjee\ Jute\ Mills ATN\ Bangla Bangla\ Vision Islamic\ TV RTV NTV Daily\ Naya\ Diganta
  Diganta\ Television Prothom\ Alo GrameenPhone Teletalk Pride\ Group BanglaLion Qubee )

end

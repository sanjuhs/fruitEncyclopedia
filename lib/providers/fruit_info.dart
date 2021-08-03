import 'package:flutter/material.dart';
import 'package:myapp8_fruit_encyclopedia/models/fruit.dart';

class FruitsInfo with ChangeNotifier{
  List<Fruit> _fruitList=[
    Fruit(
      id:'p1',
      title:'Apple',
      description:'''An apple is an edible fruit produced by an apple tree (Malus domestica). Apples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists. Apples have religious and mythological significance in many cultures, including Norse, Greek, and European Christian tradition. The word apple, formerly spelled æppel in Old English, is derived from the Proto-Germanic root *ap(a)laz, which could also mean fruit in general.

Worldwide production of apples in 2018 was 86 million tonnes, with China accounting for nearly half of the total.''',
      color1:Colors.red[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_01_apple.webp',
    ),
    Fruit(
      id:'p2',
      title:' Pear',
      description:''' Pears are fruits produced and consumed around the world, growing on a tree and harvested in the Northern Hemisphere in late summer into October. About 3000 known varieties of pears are grown worldwide, which vary in both shape and taste. The fruit is consumed fresh, canned, as juice, or dried.

The word pear is probably from Germanic pera as a loanword of Vulgar Latin pira, the plural of pirum, akin to Greek apios (from Mycenaean ápisos), of Semitic origin (pirâ), meaning ""fruit"". Pear cultivation in cool, temperate climates extends to the remotest antiquity, and evidence exists of its use as a food since prehistoric times.

In 2018, world production of pears was 23.7 million tonnes, led by China with 68% of the total. ''',
      color1:Colors.amber[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_02_pear.webp',
    ),
    Fruit(
      id:'p3',
      title:'Banana',
      description:'''A banana is an elongated, edible fruit. In some countries, bananas used for cooking may be called ""plantains"", distinguishing them from dessert bananas. 

An article on Banana tree cultivation is brought down in Ibn al-'Awwam's 12th-century agricultural work, Book on Agriculture. Bananas were cultivated by Papuans before the arrival of Austronesian-speakers. There is evidence that bananas were also known to the Indus Valley Civilisation from phytoliths recovered from the Kot Diji archaeological site in Pakistan.

In 2017, world production of bananas and plantains combined was 153 million tonnes, led by India and China with a combined total of 27% of global production.
 ''',
      color1:Colors.yellow[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_03_banana.webp',
    ),
    Fruit(
      id:'p4',
      title:'Orange',
      description:'''The orange originated in a region encompassing Southern China, Northeast India, and Myanmar, and the earliest mention of the sweet orange was in Chinese literature in 314 BC. As of 1987, orange trees were found to be the most cultivated fruit tree in the world. The fruit of the orange tree can be eaten fresh, or processed for its juice or fragrant peel.

The word orange derives from the Sanskrit word for ""orange tree"" (nāraṅga), which in turn derives from a Dravidian root word narandam/naranja which refers to Bitter orange in Tamil and Malayalam.

In 2019, 79 million tonnes of oranges were grown worldwide, with Brazil producing 22% of the total, followed by China and India.''',
      color1:Colors.orange[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_04_orange.webp',
    ),
    Fruit(
      id:'p4',
      title:'Lemon',
      description:'''The lemon is a species of small evergreen tree native to South Asia, primarily Northeast India (Assam). The tree's ellipsoidal yellow fruit is used for culinary and non-culinary purposes throughout the world, primarily for its juice, which has both culinary and cleaning uses.

The origin of the lemon is unknown, though lemons are thought to have first grown in Assam (a region in northeast India), northern Burma or China.

In 2018, world production of lemons (combined with limes for reporting) was 19.4 million tonnes. The top producers – India, Mexico, China, Argentina, Brazil, and Turkey – collectively accounted for 65% of global production. ''',
      color1:Colors.yellow[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_05_lemon.webp',
    ),
    Fruit(
      id:'p4',
      title:'Peach',
      description:'''The peach is a deciduous tree native to the region of Northwest China between the Tarim Basin and the north slopes of the Kunlun Mountains, where it was first domesticated and cultivated. It bears edible juicy fruits with various characteristics, most called peaches and others (the glossy-skinned varieties), nectarines.

Genetic studies suggest peaches originated in China. Recent evidence indicates that domestication occurred as early as 6000 BC in Zhejiang Province of China. Peach cultivation reached Greece by 300 BC. Alexander the Great is sometimes said to have introduced them into Greece after conquering Persia, but no historical evidence for this claim has been found.

In 2018, China produced 62% of the world total of peaches and nectarines. ''',
      color1:Colors.pink[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_06_peach.webp',
    ),
    Fruit(
      id:'p4',
      title:'Grapes',
      description:'''Grapes can be eaten fresh, used for making wine, jam, grape juice, jelly, grape seed extract, vinegar, and grape seed oil, or dried as raisins, currants and sultanas. 

The Middle East is generally described as the homeland of grape and the cultivation of this plant began there 6,000–8,000 years ago. Yeast, one of the earliest domesticated microorganisms, occurs naturally on the skins of grapes, leading to the discovery of alcoholic drinks such as wine. The earliest archeological evidence for a dominant position of wine-making in human culture dates from 8,000 years ago in Georgia.

China was the largest producer of grapes, accounting for 16.9% of global production. Italy came second at 10.8%, followed by the United States at 8.7%.''',
      color1:Colors.purple[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_07_grapes.webp',
    ),
    Fruit(
      id:'p4',
      title:'Melon',
      description:'''Melons originated in Africa or in the hot valleys of Southwest Asia, especially Iran and India. Melons are known to have been grown by the ancient Egyptians. Recent discoveries of melon seeds dated between 1350 and 1120 BC in Nuragic sacred wells have shown that melons were first brought to Europe by the Nuragic civilization of Sardinia during the Bronze Age.

The mature winter melon is a cooking vegetable that is widely used in Asia, especially in India. The immature melons are used as a culinary fruit (e.g., to make a distinctive fruit drink).

In 2018, world production of melons was 27 million tonnes, led by China with 46% of the total. Turkey, Iran, and India each produced more than 1 million tonnes. ''',
      color1:Colors.yellow[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_08_melon.webp',
    ),
    Fruit(
      id:'p4',
      title:'Pineapple',
      description:'''Pineapple is a tropical plant with an edible fruit indigenous to South America, where it has been cultivated for many centuries. The wild plant originates from the Paraná–Paraguay River drainages between southern Brazil and Paraguay. Pineapple has been commercially grown in greenhouses and many tropical plantations. Iit is the third most important tropical fruit in world production.

The flesh and juice of the pineapple are used in cuisines around the world. In many tropical countries, pineapple is prepared and sold on roadsides as a snack.

In 2019, world production of pineapples was 28.2 million tonnes, led by Costa Rica, the Philippines, Brazil, and Indonesia as the largest producers. ''',
      color1:Colors.amber[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_09_pineapple.webp',
    ),
    Fruit(
      id:'p4',
      title:'Plum',
      description:'''Plums may have been one of the first fruits domesticated by humans. Three of the most abundantly cultivated species are not found in the wild, only around human settlements in East European, Caucasian mountains and China. Mature plum fruits may have a dusty-white waxy coating that gives them a glaucous appearance. 

The taste of the plum fruit ranges from sweet to tart; the skin itself may be particularly tart. It is juicy and can be eaten fresh or used in jam-making or other recipes. Plum juice can be fermented into plum wine. 

In 2019, global production of plums (data combined with sloes) was 12.6 million tonnes, led by China with 56% of the world total ''',
      color1:Colors.purple[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_10_plum.webp',
    ),
    Fruit(
      id:'p4',
      title:'Kiwi',
      description:'''Kiwifruit is also known as Chinese Gooseberry. Kiwifruit is native to central and eastern China. The first recorded description of the kiwifruit dates to the 12th century during the Song dynasty. Cultivation of kiwifruit spread from China in the early 20th century to New Zealand, where the first commercial plantings occurred.

Kiwifruit may be eaten raw, made into juices, used in baked goods, prepared with meat or used as a garnish. The actinidain found in kiwifruit can be an allergen for some individuals, including children.

In 2018, global production of kiwifruit was 4 million tonnes, led by China with slightly more than half of the world total. Italy, New Zealand, Iran, Greece and Chile were other significant producers.  ''',
      color1:Colors.lightGreenAccent[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_11_kiwi.webp',
    ),
    Fruit(
      id:'p4',
      title:'Watermellon',
      description:'''Watermelon is grown in favorable climates from tropical to temperate regions worldwide for its large edible fruit. The fruit can be eaten raw or pickled, and the rind is edible after cooking. It may also be consumed as a juice or as an ingredient in mixed beverages.

Evidence of the cultivation of watermelon in the Nile Valley has been found from the second millennium BC onward, and seeds of both species have been found at Twelfth Dynasty sites and in the tomb of Pharaoh Tutankhamun. Watermelons were cultivated for their high water content and were stored to be eaten during dry seasons, not only as a food source, but as a method of storing water.

In 2017, global production of watermelons was 118 million tonnes, with China alone accounting for 67% of the total. Secondary producers included Iran, Turkey, and Brazil.  ''',
      color1:Colors.green[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_12_watermellon.webp',
    ),
    Fruit(
      id:'p4',
      title:'Gauava',
      description:'''Guava is a common tropical fruit cultivated in many tropical and subtropical regions. Guavas originated from an area thought to extend from Mexico, Central America or northern South America throughout the Caribbean region. Archaeological sites in Peru yielded evidence of guava cultivation as early as 2500 BC.

In many countries, guava is eaten raw, typically cut into quarters or eaten like an apple; it is also eaten with a pinch of salt and pepper, cayenne powder or a mix of spices (masala). Because of its high level of pectin, guavas are used to make candies, preserves, jellies, jams, and marmalades.

In 2019, world production of guavas was 55 million tonnes, led by India with 45% of the total. Other major producers were China and Thailand.
  ''',
      color1:Colors.pink[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_13_guava.webp',
    ),
    Fruit(
      id:'p4',
      title:'Mango',
      description:'''A mango is an edible stone fruit produced by the tropical tree which is believed to have originated from the region between northwestern Myanmar, Bangladesh, and northeastern India. It has been in cultivation since the ancient times resulting in two distinct types of modern mango cultivars: the ""Indian type"" and the ""Southeast Asian type"". 

Mangoes are generally sweet, although the taste and texture of the flesh varies across cultivars; some, such as Alphonso, have a soft, pulpy, juicy texture similar to an overripe plum, while others, such as Tommy Atkins, are firmer, like a cantaloupe or avocado, with a fibrous texture.

In 2019, global production of mangoes (report includes mangosteens and guavas) was 56 million tonnes, led by India with 46% (26 million tonnes) of the world total ''',
      color1:Colors.orangeAccent[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_14_mango.webp',
    ),
    Fruit(
      id:'p4',
      title:'Apricot',
      description:'''The most commonly cultivated apricot was known in Armenia during ancient times, and has been cultivated there for so long that it was previously thought to have originated there. However, this is not supported by genetic studies, which instead confirm the hypothesis that domestication of apricot occurred in Central Asia and China.

The Chinese associate the apricot with education and medicine. Dried apricots are a type of traditional dried fruit. The world's largest producer of dried apricots is Turkey.

In 2019, world production of apricots was 4.1 million tonnes, led by Turkey with 21% of the world total. Other major producers (in descending order) were Uzbekistan, Iran, Italy, and Algeria.  ''',
      color1:Colors.amberAccent[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_15_apricot.webp',
    ),
    Fruit(
      id:'p4',
      title:'Cherry',
      description:'''The English word cherry derives from Old Northern French or Norman cherise from the Latin cerasum, referring to an ancient Greek region, Kerasous (Κερασοῦς) near Giresun, Turkey, from which cherries were first thought to be exported to Europe. Cherries arrived in North America early in the settlement of Brooklyn, New York (then called ""New Netherland"") when the region was under Dutch sovereignty.

Cherry wood is valued for its rich color and straight grain in manufacturing fine furniture, particularly desks, tables and chairs.

In 2014, world production of sweet cherries was 2.25 million tonnes, with Turkey producing 20% of this total. Other major producers of sweet cherries were the United States and Iran.  ''',
      color1:Colors.redAccent[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_16_cherry.webp',
    ),
    Fruit(
      id:'p4',
      title:'Coconut',
      description:'''Coconuts were first domesticated by the Austronesian peoples in Island Southeast Asia and were spread during the Neolithic via their seaborne migrations as far east as the Pacific Islands, and as far west as Madagascar and the Comoros. They played a critical role in the long sea voyages of Austronesians by providing a portable source of food and water.

The name coconut is derived from the 16th-century Portuguese word coco, meaning 'head' or 'skull' after the three indentations on the coconut shell that resemble facial features. Mature, ripe coconuts can be used as edible seeds, or processed for oil and plant milk from the flesh, charcoal from the hard shell, and coir from the fibrous husk.

In 2019, world production of coconuts was 62 million tonnes, led by Indonesia, the Philippines, and India, with 75% combined of the total
''',
      color1:Colors.brown[200],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_17_coconut.webp',
    ),
    Fruit(
      id:'p4',
      title:'Date',
      description:'''Dates have been a staple food of the Middle East and the Indus Valley for thousands of years. There is archaeological evidence of date cultivation in Arabia from the 6th millennium BCE. 

The exact place of origin of date palm is uncertain because of long cultivation, according to some sources it probably originated from the Fertile Crescent region straddling Egypt and Mesopotamia, while others state that they are native to the Persian Gulf area or even western India. Fossil records show that the date palm has existed for at least 50 million years.

Dates are reported to have good potential in diabetes treatment due to the presence of polyphenols exerting strong antioxidant activities. The total annual world production of dates amounts to 8.5 million metric tons, countries of the Middle East and North Africa being the largest producers. ''',
      color1:Colors.lime[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_18_date.webp',
    ),
    Fruit(
      id:'p4',
      title:'Lychee',
      description:'''Lychee is a tropical tree native to the Guangdong and Fujian provinces of southeastern China, where cultivation is documented from the 11th century. Today, lychees are extensively grown in southern China, Taiwan, Vietnam and the rest of tropical Southeast Asia, the Indian Subcontinent, and in tropical regions of many other countries.

Lychee seeds contain methylene cyclopropyl glycine which can cause hypoglycemia associated with outbreaks of encephalopathy in undernourished Indian and Vietnamese children who had consumed lychee fruit.

China is the main producer of lychees, followed by India, other countries in Southeast Asia, the Indian Subcontinent, Madagascar and South Africa.  ''',
      color1:Colors.deepOrange[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_19_lychee.webp',
    ),
    Fruit(
      id:'p4',
      title:'Green Apple',
      description:'''The Granny Smith, the most common type of green apple is a tip-bearing apple variant which originated in Australia in 1868. It is named after Maria Ann Smith, who propagated the variant. 

Its acidity and strong taste makes it a frequent choice for both baking and for eating as a hand fruit. In 1968, the rock band The Beatles used an image of a Granny Smith apple as the logo for their corporation, Apple Corps Limited. For their record label, Apple Records, one side of vinyl albums featured the exterior of the fruit whilst the other side of the recording featured a cross-section of the apple.  ''',
      color1:Colors.lightGreen[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_20_greenapple.webp',
    ),
    Fruit(
      id:'p4',
      title:'Black Currant',
      description:'''Blackcurrant is native to temperate parts of central and northern Europe and northern Asia, where it prefers damp fertile soils. It is widely cultivated both commercially and domestically.

The blackcurrant is native to northern Europe and Asia. Cultivation in Europe is thought to have started around the last decades of the 17th century. During World War II, most fruits rich in vitamin C, such as oranges, became difficult to obtain in the United Kingdom. Since blackcurrant berries are a rich source of the vitamin, and blackcurrant plants are suitable for growing in the UK climate, the British Government encouraged their cultivation and soon the yield of the nation's crop increased significantly.

The leader in production is Russia (208,000 t), followed by Poland and Germany.  ''',
      color1:Colors.deepPurple[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_21_blackcurrant.webp',
    ),
    Fruit(
      id:'p4',
      title:'Blueberry',
      description:'''Blueberries—both wild (lowbush) and cultivated (highbush)—are all native to North America. The highbush varieties were introduced into Europe during the 1930s.

Blueberries are sold fresh or are processed as individually quick frozen (IQF) fruit, purée, juice, or dried or infused berries. These may then be used in a variety of consumer goods, such as jellies, jams, pies, muffins, snack foods, or as an additive to breakfast cereals.

In 2019, world production of blueberries (lowbush and highbush combined) was 823,328 tonnes, led by the United States with 38% of global production and Canada with 21%. ''',
      color1:Colors.indigo[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_22_blueberry.webp',
    ),
    Fruit(
      id:'p4',
      title:'Cranberry',
      description:'''The name cranberry derives from the German kraanbere (English translation, craneberry), first named as cranberry in English by the missionary John Eliot in 1647. In North America, the Narragansett people of the Algonquian nation in the regions of New England appeared to be using cranberries in pemmican for food and for dye. 

As fresh cranberries are hard, sour, and bitter, about 95% of cranberries are processed and used to make cranberry juice and sauce. They are also sold dried and sweetened. Cranberry juice is usually sweetened or blended with other fruit juices to reduce its natural tartness. 

In 2019, world production of cranberry was 687,534 tonnes, mainly by the United States, Canada, and Chile, which collectively accounted for 97% of the global total. ''',
      color1:Colors.red[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_23_cranberry.webp',
    ),
    Fruit(
      id:'p4',
      title:'Gooseberry',
      description:'''The gooseberry is indigenous to many parts of Europe and western Asia, growing naturally in alpine thickets and rocky woods in the lower country, from France eastward, well into the Himalayas and peninsular India.

Gooseberries are edible and can be eaten raw, or cooked as an ingredient in desserts, such as pies, fools and crumbles. Early pickings are generally sour and more appropriate for culinary use. Gooseberries are also used to flavor beverages such as sodas, flavored waters, or milk, and can be made into fruit wines and teas. Nutritionally, gooseberries are a rich source of vitamin C.

Indonesia is the largest producer of gooseberry, followed by Philippines, India and Brazil.  ''',
      color1:Colors.lime[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_24_gooseberry.webp',
    ),
    Fruit(
      id:'p4',
      title:'Pomegranate',
      description:'''The name pomegranate derives from medieval Latin pōmum ""apple"" and grānātum ""seeded"". Ancient Egyptians regarded the pomegranate as a symbol of prosperity and ambition. The French term for pomegranate, grenade, has given its name to the military grenade.

The pomegranate is native to a region from modern-day Iran to northern India. Pomegranates have been cultivated throughout the Middle East, South Asia, and Mediterranean region for several millennia, and it is also cultivated in the Central Valley of California and in Arizona. Pomegranates may have been domesticated as early as the fifth millennium BC, as they were one of the first fruit trees to be domesticated in the eastern Mediterranean region. 

At the global level, India is the world's largest producer of pomegranates, followed by Iran. ''',
      color1:Colors.redAccent[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_25_pomegranate.webp',
    ),
    Fruit(
      id:'p4',
      title:'Muskmelon',
      description:'''The muskmelon is an annual, trailing herb. It grows well in subtropical or warm, temperate climates. Melons prefer warm, well-fertilized soil with good drainage that is rich in nutrients.

The origin of muskmelons is not known. Research has revealed that seeds and rootstocks were among the goods traded along the caravan routes of the Ancient World. Some botanists consider melons native to the Levant and Egypt, while others place their origin in Iran, India or Central Asia.

China is the largest producer of muskmelon, followed by Turkey, Iran and Egypt.  ''',
      color1:Colors.amber[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_26_muskmelon.webp',
    ),
    Fruit(
      id:'p4',
      title:'Blackberry',
      description:'''One of the earliest known instances of blackberry consumption comes from Denmark approximately 2,500 years ago. Blackberry plants were used for traditional medicine by Greeks, other European peoples, and aboriginal Americans. A 1771 document described brewing blackberry leaves, stem, and bark for stomach ulcers.

Folklore in the United Kingdom and Ireland tells that blackberries should not be picked after Old Michaelmas Day (11 October) as the devil (or a Púca) has made them unfit to eat by stepping, spitting or fouling on them. Blackberry leaves are food for certain caterpillars; some grazing mammals, especially deer, are also very fond of the leaves. ''',
      color1:Colors.deepPurple[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_27_blackberry.webp',
    ),
    Fruit(
      id:'p4',
      title:'Custard Apple',
      description:'''Custard apple vary in shape, heart-shaped, spherical, oblong or irregular. The flesh varies from juicy and very aromatic to hard with an astringent taste. The flavor is sweet and pleasant, akin to the taste of 'traditional' custard. The custard apple is native to the Americas, but has been found on the island of Timor as early as 1000 CE.

Fruits are dark greening brown in colour and marked with depressions giving it a quilted appearance; its pulp is reddish yellow, sweetish, and very soft (hence the common name); the kernels of the seeds are said to be poisonous.

Custard apples common in China, Phillippines, Egypt and Central Africa and India.  ''',
      color1:Colors.amberAccent[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_28_custardapple.webp',
    ),
    Fruit(
      id:'p4',
      title:'Strawberry',
      description:'''Strawberry is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness. It is consumed in large quantities, either fresh or in such prepared foods as jam, juice, pies, ice cream, milkshakes, and chocolates. 

The first garden strawberry was grown in Brittany, France, during the late 18th century. Prior to this, wild strawberries and cultivated selections from wild strawberry species were the common source of the fruit. The strawberry fruit was mentioned in ancient Roman literature in reference to its medicinal use. The French began taking the strawberry from the forest to their gardens for harvest in the 14th century.

In 2019, world production of strawberries was 8.9 million tonnes, led by China with 40% of the total, and the United States and Mexico as other significant producers  ''',
      color1:Colors.pink[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_29_strawberry.webp',
    ),
    Fruit(
      id:'p4',
      title:'Vanilla',
      description:'''The word vanilla, derived from vainilla, the diminutive of the Spanish word vaina (vaina itself meaning a sheath or a pod), is translated simply as ""little pod"". Pre-Columbian Mesoamerican people cultivated the vine of the vanilla orchid, called tlīlxochitl by the Aztecs.

Regarded as the world's most popular aroma and flavor, vanilla is a widely used aroma and flavor compound for foods, beverages and cosmetics, as indicated by its popularity as an ice cream flavor. Although vanilla is a prized flavoring agent on its own, it is also used to enhance the flavor of other substances, to which its own flavor is often complementary, such as chocolate, custard, caramel, coffee, and others. Vanilla is a common ingredient in Western sweet baked goods, such as cookies and cakes

In 2018, world production of vanilla was 7,575 tonnes, led by Madagascar with 41.0% of the total, and Indonesia with 29.8%.''',
      color1:Colors.blueGrey[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_30_vanilla.webp',
    ),
    Fruit(
      id:'p4',
      title:'Jackfruit',
      description:'''Jackfruit is commonly used in South and Southeast Asian cuisines. Both ripe and unripe fruits are consumed. It is available internationally canned or frozen and in chilled meals as are various products derived from the fruit such as noodles and chips.

The jackfruit has played a significant role in Indian agriculture for centuries. Archaeological findings in India have revealed that jackfruit was cultivated in India 3000 to 6000 years ago. The jackfruit is the national fruit of Bangladesh and Sri Lanka.

In 2017, India produced 1.4 million tonnes of jackfruit, followed by Bangladesh, Thailand, and Indonesia.
 ''',
      color1:Colors.lightGreenAccent[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_31_jackfruit.webp',
    ),
    Fruit(
      id:'p4',
      title:'Tamarind',
      description:''' Tamarind is a leguminous tree bearing edible fruit that is indigenous to tropical Africa. 

The tamarind tree produces brown, pod-like fruits that contain a sweet, tangy pulp, which is used in cuisines around the world. The pulp is also used in traditional medicine and as a metal polish. The tree's wood can be used for woodworking and tamarind seed oil can be extracted from the seeds. Tamarind's tender young leaves are used in Indian and Filipino cuisine.

In hens, tamarind has been found to lower cholesterol in their serum, and in the yolks of the eggs they laid. Due to a lack of available human clinical trials, there is insufficient evidence to recommend tamarind for the treatment of hypercholesterolemia or diabetes.

 ''',
      color1:Colors.brown[100],
      color2:Colors.amber,
      tags: [],
      imgUrl: 'images/2_32_tamarind.webp',
    ),

  ];


  List<Fruit> get fruitlist  {return [..._fruitList];}
  List<Fruit> get fruitlistmodify1  {return _fruitList;}

}
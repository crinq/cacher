//
//  cacheController.m
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "cacheController.h"

@implementation cacheController

@synthesize caches;
@synthesize currentCache;

-(id)init{
    caches = [[NSMutableArray alloc] init];
    /*[caches addObject:[[cache alloc] initWithGCCode:@"GC2QR5Q" name:@"Naturlehrpfad" withLongitude:8.501383 andLatitude:54.689900 andInfo:@"Micro: Da es sich um einen Cache handelt, der sich im weiteren Sinne in dem Naturschutzgebiet 'Wattenmeer' befindet, möchten wir darauf aufmerksam machen, dass die ausgewiesenen Wege nicht verlassen werden dürfen.\n\nMikro ohne Stift"]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC3EYBP" name:@"Die geheimnisvolle Ruine" withLongitude:8.507683 andLatitude:54.691050 andInfo:@"Regular: Der Cache befindet sich in der Nähe eines Fahrrad- und Reitweges. Man sollte ihn auch möglichst mit einem Fahrrad ansteuern, da sich das Parken in der näheren Umgebung etwas schwierig gestalten könnte. Falls Ihr mit dem Auto kommen solltet, wäre es wahrscheinlich am sinnvollsten, in Nieblum zu parken. \nAnsonsten beachtet bitte die angegebenen Park-Koordinaten. \nSie sind zwar nicht das non plus ultra, aber eine bessere Möglichkeit gibt es in der Nähe leider nicht. \nDa dies mein erster Geocache ist, bitte ich euch, Nachsicht walten zu lassen, falls noch nicht alles perfekt ist. Verbesserungsvorschläge gerne in das Log. Die Koordinaten habe ich bei gutem Wetter genommen, Genauigkeit des Garmins lag bei ca. 3-4 Meter. Bitte versteckt den Cache wieder so, wie ihr ihn vorgefunden habt und achtet besonders darauf, dass ihr die Dose vernünftig verschließt, damit alles sauber und trocken bleibt. \nFür den ersten Finder ist zudem eine Urkunde hinterlegt. \nErstbefüllung: Föhr-Pin, &#xDC;-Ei-Figuren, Postkarte, Brosche, Bilderrahmen, Schnecken. Lasst die Stifte und den Anspitzer aber bitte in der Tüte ;) Zudem kein Downtrade, damit sich auch der Nächste noch an schönen Kleinigkeiten erfreuen kann :) \nLange Rede, kurzer Sinn....Viel Spaß beim Suchen!"]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC2CZYE" name:@"Golfplatz" withLongitude:8.510850 andLatitude:54.688183 andInfo:@"Small: Vor einigen Jahren wurde der Golfplatz in Wyk zu einem 27 Loch-Platz erweitert. Diesen kann man mit dem Fahrrad auf schönen Naturpfaden umrunden.\n\nJe nachdem, welche Richtung ihr wählt, seid ihr früher oder später beim Cache."]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC3QGD0" name:@"Bredland" withLongitude:8.511250 andLatitude:54.684133 andInfo:@"Regular: Bredland ist eine Siedlung. Sie gehört zu Nieblum liegt aber außerhalb direkt am Golfplatz. Am Besten erreicht ihr den Cache mit dem Fahrrad, aber auch zu Fuß. Am Anfang des Fahrrad(Fuß)weges kann man sein Auto abstellen. Bitte plaziert den Cache wieder so, wie ihr in gefunden habt. Sollte das Logbuch voll sein, dann gebt Bescheid. Der Cache befindet sich in einem Naturschutzgebiet. Die offiziellen Wege müssen zu keiner Zeit verlassen werden.\n Bredland is a settlement. It is one of Nieblum but outside near to the golf course. It's best to reach the cache by bicycle or on foot. At the beginning of the cylce and foot path you can park your car.&#160;Please placed the cache back the way you found it. If the log is full, then give a note. The cache is located in a nature reserve. It ist not necessary to leave the official way at any time."]];

    [caches addObject:[[cache alloc] initWithGCCode:@"GC3HA0N" name:@"Das weiße Haus" withLongitude:8.504883 andLatitude:54.681367 andInfo:@"Mico: Hier könnt Ihr in direkter Nähe zum Cache parken. Fahrt den Weg bitte nicht zu schnell, da er teils erhebliche Schlaglöcher aufweist. Dieser Cache führt Euch zu einem Ort mit wundervoller Aussicht. Das weiße Haus, das sich in direkter Nähe zum Cache befindet, ist vielen Insulanern tatsächlich als &quot;das weiße Haus&quot; bekannt, da es das letzte Haus auf dieser Seite Nieblums ist und vollkommen einsam und verlassen steht. Sollte das Logbuch voll sein, erwähnt dies bitte in Eurem Log, damit ich es ersetzen kann! :) Bei gutem Wetter könnt ihr von dort aus sogar den Amrumer Leuchtturm entdecken. \n\nViel Spaß beim Cachen :)"]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC368AM" name:@"-+- Baywatch -+-" withLongitude:8.490417 andLatitude:54.681583 andInfo:@"Micro: *** Baywatch ***\n\nHier ist es im Sommer fast so wie in der gleichnamigen Serie! Nieblum hat den schönsten Strand und die beste Surfschule auf Foehr!\n\nGesucht wird ein Micro! \nDie beste Kombination hierzu ist Papa und Sohn :-)\n\n-&gt; Bitte zu dem Log unbedingt ein Foto posten!"]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC36B8J" name:@"Lighthouse Nieblum (-) TB Exchange Hotel" withLongitude:8.485767 andLatitude:54.684467 andInfo:@"Small: Das Leuchtfeuer in Nieblum liegt auf der Südseite von Foehr und wurde 1983 erbaut. Die Höhe beträgt 10m. Rund um das Leuchtfeuer sind Wiesen mit Schafen und Pferden.\n\n\nEs handelt sich um einen &quot;Small&quot;. Bitte unbedingt einen TB/Coin hinterlassen! Es sollten mindestens immer 2 Reisende im Hotel verbleiben.\n\nBitte unbedingt ein Foto von euch mit dem Leuchtfeuer im Hintergrund!\n\nEs handelt sich hier um ein Naturschutzgebiet! Bitte die Wege nicht verlassen!\n\nViel Spass beim Suchen und loggen!"]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC2DET7" name:@"floer von foehr" withLongitude:8.481883 andLatitude:54.683233 andInfo:@"Small: Der Cache liegt in einem Wäldchen neben der artgerechten Heimstätte des Schafes Floer von Föhr."]];

    [caches addObject:[[cache alloc] initWithGCCode:@"GC3HA17" name:@"Goting FKK" withLongitude:8.458500 andLatitude:54.690383 andInfo:@"Mico: Hier könnt ihr wunderbar parken. Auch Picknicktische und eine öffentliche Toilette finden sich hier. Dieser Cache führt Euch in die Nähe des FKK Strandes in Goting. \nKeine Sorge, der FKK Strand muss nicht betreten werden ;) \nDas Gelände, in dem sich der Cache befindet, ist nur von einer Seite eingezäunt. Keine Sorge, es handelt sich NICHT um ein Privatgrundstück. Das Betreten ist also durchaus erlaubt. \nKleiner Tipp: Wenn ihr nach dem Suchen des Caches noch Zeit haben solltet, biegt direkt nachdem ihr den Schotterweg, der zu den Parkkoordinaten führt, verlassen habt, links ab und folgt dem nächsten Schotterweg. Von dort aus habt ihr einen tollen Blick über zwei Hügelgräber, die Borgsumer Mühle und den Amrumer Leuchtturm. Bei gutem Wetter solltet Ihr Euch diesen Blick wirklich nicht entgehen lassen. Falls das Logbuch voll sein sollte, teilt mir dies bitte in Eurem Log mit, damit ich es ersetzen kann. \n\nViel Spaß beim Cachen! :)"]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC2DEV1" name:@"König Frederik" withLongitude:8.517067 andLatitude:54.692800 andInfo:@"Mico: &quot;Bereits im Jahr davor, 1824, bereiste König Frederik VI die\nInseln und wurde hier mit großer Freude begrüßt. Am 27. Juni\n1824 kam der König mit seinem Gefolge um 2 Uhr nachmittags in\nWyk an. Großen Eindruck auf die Menschen machte es, dass der König Friesisch gelernt hatte und zu ihnen auf friesisch sprechen konnte. ... Aus Dankbarkeit und Freude\nüber den Besuch des Königs ließen die Föhrer in Kopenhagen\neine Sandsteinstele anfertigen, welche am 8. August 1826 um 11Uhr vormittags, mit einer Rede des General-Superintendenten\nJacob Georg Christian Adler eingeweiht wurde. Auf dieser Stele ist das Datum des Königsbesuches vermerkt und der Spruch: 'Stenen bevarer Hans Navn ' Hjerterne Hans Minde&#x201C; Das bedeutet: 'Der Stein bewahrt seinen Namen ' Die Herzen die Erinnerung an ihn.&#x201C;\nKarin Hansen, inselmagazin, (&lt;a href=&quot;http://inselgrafik.inselseiten.de/uploads/media/IM23.pdf&quot; target=&quot;_blank&quot; rel=&quot;nofollow&quot;&gt;visit link&lt;/a&gt;)"]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC2CZYM" name:@"Gmelin" withLongitude:8.547717 andLatitude:54.681567 andInfo:@"Small: Die heilende Wirkung der Föhringer Luft wurde insbesondere von dem schwäbischen Arzt Dr. Carl Gmelin betont, der 1898 am bisher unbebauten Südstrand der Insel das Nordseesanatorium mit einem ausgedehnten Kurpark errichtete, den heutigen alten Kurpark. Hier findet sich eine kleine Gedenkstätte ihm zu Ehren und unweit davon ein Cache (am westlichen Ausgang)."]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC36FT2" name:@"Alter Golfplatz" withLongitude:8.544917 andLatitude:54.682700 andInfo:@"Micro: An dieser Straße liegen die Wurzeln des Föhrer Golfsports, der hier schon in den 20er Jahren des 20. Jahrhunderts seinen Anfang nahm. Zunächst bot ein recht überschaubarer Platz zwischen der Straße 'Am Golfplatz&#x201C; und dem Strand den Spielern Meeresblick. Später dann dehnte sich der Platz auch auf die Flächen nördlich der Pflasterstraße und weiter nach Osten aus. Wenn man genau hinsieht, erkennt man noch die typischen langen Felder, auf denen heute Pferde grasen bzw. Ferienhäuser stehen. So pausen sich Relikte einer heute weitgehend überprägten Kulturlandschaft durch, zwei ältere Zeitscheiben lassen sich in den beiden Abbildungen ablesen. \n\nViel Spaß bei der Suche wünschen die jaegerundsammler\n\n\nFTF, STF, TTF\n\nNur etwa eine Stunde nach der Veröffentlichung haben sich &quot;Katti 90&quot; und &quot;MULei&quot; gemeinsam in das erste Feld des nagelneuen Logbuchs eingetragen. Ihnen gebührt mit &quot;marisa93&quot; daher als Gruppe der FTF-Titel.\n\nIn das 2. Feld hat sich kurz danach &quot;Das Team 3&quot; eingetragen. Somit nehmen sie den 2. Platz ein.\n\nHerzlichen Glückwunsch sagen die jaegerundsammler"]];
    
    [caches addObject:[[cache alloc] initWithGCCode:@"GC2CZYW" name:@"Lerchenweg" withLongitude:8.544833 andLatitude:54.685983 andInfo:@"Small: Vom Lerchenweg führen zwei Wege in den Kurpark, die sich nach 200 m treffen. Zwischen diesen Wegen liegt der Cache."]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC34YMG" name:@"Kurs Föhr" withLongitude:8.572467 andLatitude:54.691500 andInfo:@"Regular: Kurs Föhr ist nur ein highlight auf der Insel. Das ganze Jahr hindurch finden tolle Events auf der Insel statt. Die launige Atmosphäre erinnert an das Lebensgefühl im mittelamerikanischen Raum. Daher auch der Zusatz &quot;Friesische Karibik&quot;...!\n\n(...übrigens ist das Versteck mit dem Hafenmeister abgesprochen, also habt keine unnötigen &quot;rechtlichen&quot; Bedenken...!)"]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC3HWMX" name:@"St. Nicolai" withLongitude:8.549817 andLatitude:54.695817 andInfo:@"Micro: Dieser Cache soll Euch die schöne Boldixumer Kirche zeigen. Der Cache befindet sich allerdings noch außerhalb des Friedhofsgeländes. Wer etwas Zeit mitgebracht hat, sollte sich aber auf jeden Fall die Kirche ansehen. Falls das Logbuch voll sein sollte, postet dies bitte in Eurem Log, damit ich es schnellstmöglich ersetzen kann :) \nViel Spaß beim Cachen! :)"]];
    [caches addObject:[[cache alloc] initWithGCCode:@"GC3260P" name:@"Kuschelvögel" withLongitude:8.564583 andLatitude:54.687650 andInfo:@"Small: Kleiner Cache mal eben zum mitnehmen.\nUnd wer noch ein bisschen Zeit hat, der kann auch alte Brötchen mitnehmen und die Vögel dort füttern.\n\n\nIch würde mich freuen, wenn ein auf Föhr ansässiger Cacher sich bei mir melden würde, der bereit ist den Cache ab und zu mal zu überprüfen, da ich nur einmal im Jahr auf Föhr bin.\nViel Spaß beim Suchen wünscht Migro23"]];
*/
    
    

    NSLog(@"cachcount: %d", [caches count]);
    return self;
}

-(void)parseGPX{
    
}

- (cache*) getCacheByGCCode:(NSString*)GCCode{
    NSInteger index =  [caches indexOfObjectPassingTest:
        ^ (id obj, NSUInteger idx, BOOL *stop)
        {
            if ([[obj GCCode] caseInsensitiveCompare: GCCode] == NSOrderedSame)
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }];
    return [caches objectAtIndex:index];
}

- (NSMutableArray*) cachesSorted{
    NSMutableArray *filteredCaches = [[NSMutableArray alloc] init];
    
    pos *currentPosition = [[[root get] rootControllerSwitch] currentPosition];
    double maxDistance = [[[root get] rootControllerSwitch] maxDistance];
    int i = 0; //index
    int j = 0; //step
    
    for(cache *c in caches){
        if([currentPosition distanceTo:[c GCPos]] <= maxDistance){
            //i = ([filteredCaches count] - 0.5) / 2;
            //j = (([filteredCaches count] + 0.5) / 2 + 0.5) /2;
            //while(j > 1){
            //    if([currentPosition distanceTo:[[filteredCaches objectAtIndex:i] GCPos]] < [currentPosition distanceTo:[c GCPos]]){
            //        i -= j;
            //    }
            //    else{
            //        i += j;
            //    }
            //    j = (j + 0.5) / 2;
            //}
            //[filteredCaches insertObject:c atIndex:i];
            //NSLog(@"i: %i", i);
            
//            i = ([filteredCaches count] + 1) / 2;
//            j = (i + 1) / 2;
//            NSLog(@"start: %i, i: %i, j: %i", [filteredCaches count], i, j);
////            NSLog(@"go i: %i, count: %i", i, [filteredCaches count]);
////            if([filteredCaches count] > 0){
////                NSLog(@"n. insert");
//                while(j > 0 && i < [filteredCaches count]){
//                    if([currentPosition distanceTo:[[filteredCaches objectAtIndex:i] GCPos]] < [currentPosition distanceTo:[c GCPos]]){
//                        i += j;
//                    }
//                    else{
//                        i -= j;
//                    }
//                    j = (j + 1) / 2;
//                    NSLog(@"j: %i", j);
//                }
//            NSLog(@"i: %i", i);
//            }
//            else{
//                NSLog(@"1. insert");
//            }
//            if([filteredCaches count] == 0){
                [filteredCaches addObject:c];
//            }
//            else{
//                i = [filteredCaches count] - 1;
//                while(i > 0 && [currentPosition distanceTo:[[filteredCaches objectAtIndex:i] GCPos]] > [currentPosition distanceTo:[c GCPos]]){
//                    i--;
//                }
//                [filteredCaches insertObject:c atIndex:i + 1];
//            }
            
            
//            while(i + 1 < [filteredCaches count] && [currentPosition distanceTo:[[filteredCaches objectAtIndex:i + 1] GCPos]] < [currentPosition distanceTo:[c GCPos]]){
//                i++;
//            }
//            [filteredCaches insertObject:c atIndex:i];
//            NSLog(@"i: %i, count: %i", i, [filteredCaches count]);
        }

    }

    
    //if([[[root get] rootControllerSwitch] sortArray]){
        //return [filteredCaches sortedArrayUsingFunction:sort context:(void*)currentPosition];
    //}
    return filteredCaches;
}

- (NSArray*) cachesSortedWithMaxDistance{
    NSMutableArray *filteredCaches = [[NSMutableArray alloc] init];
    
    double maxDistance = [[[root get] rootControllerSwitch] maxDistance];
    pos *currentPosition = [[[root get] rootControllerSwitch] currentPosition];
    
    //for(cache *c in caches){
    //    if([[c GCPos] distanceTo:currentPosition] <= maxDistance){
    //        [filteredCaches addObject:c];
    //    }
    //}
    
    if([[[root get] rootControllerSwitch] sortArray]){
        //return [filteredCaches sortedArrayUsingFunction:sort context:(void*)currentPosition];
    }
    return filteredCaches;
}

NSInteger sort(id cache1, id cache2, void* position)
{
    NSLog(@"sort");
    if([[cache1 GCPos] distanceTo:CFBridgingRelease(position)] > [[cache2 GCPos] distanceTo:CFBridgingRelease(position)]){
        return NSOrderedDescending;
    }
    return NSOrderedAscending;
}

@end

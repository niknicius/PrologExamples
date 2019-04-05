% fatos
filho(balto_slavic,proto_indo_european).
  filho(baltic,balto_slavic).
    filho(old_prussian, baltic).
    filho(lithuanian, baltic).
    filho(latvian, baltic).
  filho(slavic, balto_slavic).
    filho(east_slavic, slavic).
      filho(russian, east_slavic).
      filho(byelorussian, east_slavic).
      filho(ukrainian, east_slavic).
    filho(south_slavic, slavic).
      filho(slovene, south_slavic).
      filho(serbo_croatian, south_slavic).
      filho(macedonian, south_slavic).
      filho(bulgarian, south_slavic).
      filho(old_church_slavonic, south_slavic).
    filho(west_slavic, slavic).
      filho(wendish, west_slavic).


filho(germanic,proto_indo_european).
  filho(north_germanic, germanic).
    filho(old_horse, north_germanic).
      filho(old_icelandic, old_horse).
        filho(icelandic, old_icelandic).
      filho(faroese, old_horse).
      filho(old_norwegian, old_horse).
        filho(middle_norwegian, old_norwegian).
          filho(norwegian, middle_norwegian).
    filho(old_swedish, north_germanic).
      filho(middle_swedish, old_swedish).
        filho(swedish, middle_swedish).
    filho(old_danish, north_germanic).
      filho(middle_danish, old_danish).
        filho(danish, middle_danish).
  filho(west_germanic, germanic).
    filho(old_english, west_germanic).
      filho(middle_english, old_english).
        filho(english, old_english).
    filho(old_frisian, west_germanic).
      filho(frisian, old_frisian).
    filho(old_dutch, west_germanic).
      filho(middle_dutch, old_dutch).
        filho(dutch, middle_dutch).
        filho(flemish, middle_dutch).
        filho(afrikaans, middle_dutch).
    filho(old_low_german, west_germanic).
      filho(middle_low_german, old_low_german).
        filho(low_german, middle_low_german).
    filho(old_high_german, west_germanic).
      filho(middle_high_german, old_high_german).
        filho(high_german, middle_high_german).
        filho(yiddish, middle_high_german).
  filho(east_germanic, germanic).
    filho(gothic, east_germanic).


filho(celtic, proto_indo_european).
  filho(goidelic, celtic).
    filho(irish_gaelic, goidelic).
    filho(scottish_gaelic, goidelic).
    filho(manx, goidelic).
  filho(brythonic, celtic).
    filho(cornish, brythonic).
    filho(breton, brythonic).
    filho(welsh, brythonic).
    filho(gaulish, brythonic).

filho(italic, proto_indo_european).
  filho(latino_faliscan, italic).
    filho(fallscan, italic).
    filho(latin, italic).
      filho(portuguese, latin).
      filho(spanish, latin).
      filho(catalan, latin).
      filho(provencal, latin).
      filho(french, latin).
      filho(italian, latin).
      filho(rhaeto_romance, latin).
      filho(rumanian, latin).
  filho(osco_umbrian, italic).
    filho(oscan, osco_umbrian).
    filho(umbrian, osco_umbrian).

filho(illyrian, proto_indo_european).

filho(albanian, proto_indo_european).

filho(thracian, proto_indo_european).

filho(hellenic, proto_indo_european).
  filho(greek, hellenic).

filho(armenian, proto_indo_european).

filho(phrygian, proto_indo_european).

filho(anatolian, proto_indo_european).
  filho(lycian , anatolian).
  filho(lydian , anatolian).
  filho(luvian, anatolian).
  filho(hittite, anatolian).

filho(indo_iranian,proto_indo_european).
  filho(iranian, indo_iranian).
    filho(old_persian, iranian).
      filho(middle_persian, old_persian).
        filho(persian, middle_persian).
      filho(pahlavi, old_persian).
    filho(avestan, iranian).
    filho(sogdian, iranian).
    filho(kurdish, iranian).
    filho(baluchi, iranian).
    filho(pashto, iranian).
  filho(indic, indo_iranian).
    filho(sanskrit, indic).
      filho(sindhi, sanskrit).
      filho(romany, sanskrit).
      filho(urdu, sanskrit).
      filho(hindi, sanskrit).
      filho(bihari, sanskrit).
      filho(assamese, sanskrit).
      filho(bengali, sanskrit).
      filho(marathi, sanskrit).
      filho(gujarati, sanskrit).
      filho(punjabi, sanskrit).
      filho(singhalese, sanskrit).
  filho(dardic, indo_iranian).
    filho(dard, dardic).

filho(tocharian,proto_indo_european).
  filho(tocharian_b, tocharian).
  filho(tocharian_a, tocharian).



irma(X,Y):- filho(X,A),
            filho(Y,A),
            X\==Y.

descendente(X,Y):- filho(X,Y).
descendente(X,Y):- filho(X,A),
                  descendente(A,Y).

antecessor(X,Y):- filho(Y,X).
antecessor(X,Y) :- filho(A,X), antecessor(A,Y).


imprimirAntecedentes(X):- descendente(X,A),
                writeln(A),fail.

imprimirDescedentes(X):- descendente(A,X),
                        writeln(A),fail.

imprimirIrmas(X):- irma(X,A), writeln(A), fail.

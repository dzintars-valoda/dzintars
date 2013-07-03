[![Build Status](https://travis-ci.org/dzintars-valoda/dzintars.png)](https://travis-ci.org/dzintars-valoda/dzintars)

# Dzintars

Dzintars ir pirmā latviešu programmēšanas valoda.

## Uzstādīšana

Nepieciešams vispirms uzstādīt Ruby programmēšanas valodu (versiju 1.9.3 vai vēlāku)
un pēc tam uzstādīt Dzintaru ar

    gem install dzintars

## Kāpēc Dzintars?

Programmēšanas valoda Dzintars ir [Ruby programmēšanas valoda](http://www.ruby-lang.org/) ar latvisku sintaksi.
Tulkojot Ruby nosaukumu uz latviešu valodu sanāca Dzintars.

## Pirmā programma

Izveidojiet datni sveika_pasaule.dz ar sekojošu saturu

    ja 1 > 0
      izdrukāt_virkni "Sveika pasaule!"
    citādi
      izdrukāt_virkni "Kaut kas ir sabojājies"
    beigas

un izpildiet ar

    dzintars sveika_pasaule.dz

## Sintakse

### Skaitļi

Veseli skaitļi

    123

Daļskaitļi (kā decimāldaļu atdalītājs jāizmanto komats nevis svešzemju ieviestais punkts)

    123,45

### Burtu virknes

    "Es esmu burtu virkne ar latviešu burtiem"
    <<-BEIGAS
    Burtu virkne, kas
    sadalīta vairākās rindās
    BEIGAS

### Būla izteiksmes

    patiess
    aplams
    nav patiess

### Nosacījumi

`tad` ir neobligāts atslēgvārds.

    ja vērtība > 100 tad
      "viss kārtībā"
    bet_ja vērtība > 0 tad
      "gandrīz kārtībā"
    citādi
      "nav labi"
    beigas

    gadījumā atzīme
    kad 5 tad "teicami"
    kad 4 tad "labi"
    citādi "vidēji"
    beigas

### Kļūdu apstrāde

    kļūdu_skaits = 0
    sākt
      # komentārs par slikto darbību
      1 / 0
    glābt => kļūda
      kļūdu_skaits += 1
      mēģināt_vēlreiz ja kļūdu_skaits < 3
      celt "ļoti slikta kļūda"
    nodrošināt
      izdrukāt_virkni "Esam beiguši"
    beigas

Turpinājums sekos...

## Piedalīšanās Dzintara izstrādē

Sūtiet vilkšanas pieprasījumus.

## Licence

Masačūsetsas Tehnoloģiskā Institūta licence (skat. LICENSE.txt datni).

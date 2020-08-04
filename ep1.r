# Hallo zum R-Skript von Episode I

# Alles hinter dem # in einer Zeile wird als "Kommentar" ignoriert.
# Der erste wirkliche Befehl folgt also erst jetzt:
library(tidyverse)


# Ein Wert
42


# Eine einfache Rechnung
(42*sqrt(2))/13.7603


# Immer alles einzutippen, ist müßig.
# Damit sich der Computer etwas merkt, gibt es in R Variablen.
# Variablen werden über den angedeuteten Pfeil nach links (<-) zugewiesen.
# (Beachte: Nach Ausführung taucht die Variable im RStudio-Environment auf)
halbe_wahrheit <- 21


# Variablennamen sollten zumindest drei Spielregeln folgen:
# - einfach: keine Leerzeichen, Umlaute und Sonderzeichen, außer _ und .
# - selbsterklärend: lieber "summe_likes" statt "test3"
# - konsistent: neben "summe_likes" gibt es "summe_comments", nicht "sumComments"
outlet_name <- 'ZEIT online'
outlet_url <- 'https://zeit.de/'
anzahl_artikel <- 1024
mittelwert_likes_je_artikel <- 74.2


# Statt mit Zahlen kann R natürlich auch mit Variablen umgehen und rechnen.
geschaetzte_summe_likes <- anzahl_artikel*mittelwert_likes_je_artikel


# Um Variablen auf der Konsole auszugeben, kann man sie übrigens einfach eingeben.
geschaetzte_summe_likes


# Aber mal ehrlich, einzelne Zahlen sind Kindergeburtstag.
# R wird erst wirklich brauchbar, wenn wir mit vielen Zahlen arbeiten.
# Dafür nutzt R "Vektoren", die mit einem kleinen "c" generiert werden.
# Hier legen wir eine Reihe mit dem Alter von sechs Personen an.
alter <- c(23, 24, 23, 25, 20, 26)


# What? Reihe? Vektoren? c? Dasgehtmirallesvielzuschnell!!1!
# Keine Sorge: Mit "str" stellt R die STRuktur von Variablen dar.
str(alter)
# Wir sehen also, dass es sich um eine numerische Liste mit Elementen von 1 bis 6 handelt.


# R kann Rechenoperationen jetzt ganz einfach auf alle Einträge der Liste anwenden.
# Und das in atemberaubendem Tempo.
alter_quadriert <- alter^2
str(alter_quadriert)


# Noch nicht beeindruckt?
# Okay, okay, okay. Wir laden ein paar tatsächliche Daten:
tote_in_breaking_bad <- read_csv('https://wegweisr.haim.it/Daten/breaking_bad_deaths.csv')


# Oh, äh, was lief da schief?
# Nichts! Rot heißt in R nicht immer "schlecht" (manchmal aber schon).
# Also: Meldungen in der Konsole lesen!


# Okay, zurück zum Datensatz. Was haben wir hier?
str(tote_in_breaking_bad)


# Ziemlich wilde Datenstruktur. Das Kürzel "tbl" deutet aber auf eine "Tibble"-Tabelle hin.
# Es gibt in R zahlreiche Tabellenformate (z.B. "Dataframes"). Die bequemsten aber heißen "tibble".
# Und das haben wir hier: ein tibble. Das können wir einfach mal ausgeben:
tote_in_breaking_bad


# Und mit unserem "tibble" können wir jetzt recht "selbsterklärend" weiter arbeiten.
# Gelesen von oben nach unten: Nimm die Tabelle und zähle!
tote_in_breaking_bad %>% 
  count()


# Nimm die Tabelle, filtere auf Einträge, in denen der Mörder "Walter White" heißt, und zähle dann!
tote_in_breaking_bad %>% 
  filter(murderer == 'Walter White') %>% 
  count()


# Nimm die Tabelle und fasse zusammen auf die Gesamtzahl (wie count) und die Anzahl einzigartiger Namen!
tote_in_breaking_bad %>% 
  summarise(
    number_of_entries = n(),
    number_of_murderers = n_distinct(murderer)
  )


# Nimm die Tabelle, filtere auf den Mörder "Walter White" und zähle alle Einträge sowie die Mordarten!
tote_in_breaking_bad %>% 
  filter(murderer == 'Walter White') %>% 
  summarise(
    number_of_entries = n(),
    number_of_methods = n_distinct(method)
  )



# Nimm die Tabelle, filtere auf "Walter White", gruppiere nach Mordart und zähle (je Gruppe)!
tote_in_breaking_bad %>% 
  filter(murderer == 'Walter White') %>% 
  group_by(method) %>% 
  count()


# Nimm die Tabelle, filtere auf "Walter White", gruppiere nach Mordart, zähle und sortiere absteigend!
tote_in_breaking_bad %>% 
  filter(murderer == 'Walter White') %>% 
  group_by(method) %>% 
  count() %>% 
  arrange(-n)


# Übungen zu Episode I


#'     /\___/\
#'    /       \
#'   l  u   u  l
#' --l----*----l--
#'    \   w   /     - Miau!
#'      ======
#'    /       \ __
#'    l        l\ \
#'    l        l/ /
#'    l  l l   l /
#'    \ ml lm /_/


###########################
# Lücken-Skript
# Füllen Sie die Kommentare und beschreiben Sie, was die jeweilige Operation macht.
# Wenn Sie unsicher sind, nutzen Sie die "str"-Funktion.
###########################

# Zuweisen von Werten zu Variablen 
alter <- 23
jahr_aktuell <- 2020
jahr_geburt <- jahr_aktuell - alter


# Laden der library tidyverse
library(tidyverse)


# Einlesen der csvDatei in die 
tote_in_breaking_bad <- read_csv('https://wegweisr.haim.it/Daten/breaking_bad_deaths.csv')

str(tote_in_breaking_bad)

# Filtert den Datensatz tote_in_breaking_bad nach den Morden "erschossen" ud zählt die Fälle
tote_in_breaking_bad %>% 
  filter(method == 'shot') %>% 
  count()


# Filtert Datensatz Tote in Breaking Bad nach allen Mödern außer Walter White
tote_in_breaking_bad %>% 
  filter(murderer != 'Walter White') %>% 
  count()



###########################
# Code-Verständnis 2.0
# Der folgende Code enthält noch nicht gelernte Elemente.
# Können Sie trotzdem beschreiben, was hier passiert?
###########################

# Filtert Tote in Breaking Bad nach der Methode = erschossen und Mörder = Walter White
tote_in_breaking_bad %>% 
  filter(method == 'shot' & murderer == 'Walter White') %>% 
  count()


# Häufigkeitsauszählung der Tote nach Episode 
tote_in_breaking_bad %>% 
  group_by(episode) %>% 
  count()

#ich wollte herausfinden, as die Todesursache der vielen Toten in Episode 213 ist
tote_in_breaking_bad %>%
  filter(episode == 213) %>%
  group_by(method) %>%
  count()

# Die Häufigkeitsauszählung der Toten nach Episoden wird der Größe nach absteigend sortiert
tote_in_breaking_bad %>% 
  group_by(episode) %>% 
  count() %>% 
  arrange(-n)


# Die Häufigkeitsauszählung der Toten nach Episoden wird der Größe nach aufsteigend sortiert
tote_in_breaking_bad %>% 
  group_by(episode) %>% 
  count() %>% 
  arrange(n)


# Man lässt sich die Häufigkeitsauszählung nur für Episoden mit mehr als 10 Toten ausgeben
tote_in_breaking_bad %>% 
  group_by(episode) %>% 
  count() %>% 
  filter(n > 10)


# Zusammenfügen der Folgen zu Staffeln 
tote_in_breaking_bad %>% 
  bind_cols('season' = c(rep(1, 2), rep(2, 176), rep(3, 28), rep(4, 27), rep(5, 38)))


# Neues Datenelement, das die Staffeln als Vriablen enthält
tote_in_breaking_bad_mit_season <-
  tote_in_breaking_bad %>% 
  bind_cols('season' = c(rep(1, 2), rep(2, 176), rep(3, 28), rep(4, 27), rep(5, 38)))


# Häufigkeitsauszählung der Tote nach Staffel
tote_in_breaking_bad_mit_season %>%
  group_by(season) %>% 
  count()



###########################
# Code-Anpassungen
# Kopieren Sie sich den Code so zusammen, dass er den Anforderungen gerecht wird.
###########################

# Anzahl Episoden mit mehr als fünf Toten (korrekt: 6)
tote_in_breaking_bad %>%
  group_by(episode) %>%
  filter(n() > 5) %>% 
  count()
  

# Anzahl Opfer je Todesursache, sortiert absteigend nach Anzahl
# (korrekt: accidental 172, shot 59, poisoned 14, stabbed 13 ...)



# Mörder mit den meisten Opfern (absteigend sortiert) in Staffel 5
# (korrekt: Jack/Nazi group 22, Walter White 9 ...)



# Identifikation "mehrfach ermorderter" Personen (korrekt: Los Pollos Driver & Guard)



# Namen der Opfer von Jesse, nach Season aufsteigend sortiert
# (korrekt: Gale in #3, Joaquin Salamanca in #4 und Todd in #5)





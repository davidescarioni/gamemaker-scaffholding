# GameMaker Scaffholding

Questo è un progetto scaffholding per un progetto GameMaker, usando principalmente risorse sviluppate dalle community di GMI.

## Panoramica

- L'oggetto *obj_init* inizializza tutti gli oggetti *manager* (audio, localizzazione, input, ecc..). E' l'oggetto che deve esistere nella prima room di gioco per far si che tutto il resto funzioni.
- **obj_i18n_manager** è l'oggetto che inizializza la localizzazione. All'interno degli *Included files* troverete i json contenenti le stringhe tradotte.
- **obj_input_manager** è l'oggetto che inizia tutti i metodi di input: se dovete aggiungere la mappatura di un tasto va inserita qui.
- **obj_audio_manager** ha il compito di inizializzare i due *Audio Group* (uno per la musica, l'altro per gli sfx) e di cambiare il volume del gioco
- Tutte le variabili e le risorse seguono le regole di Feather
- Le room hanno dimensione 384 * 216, che è una delle "vere" risoluzioni a 16:9 ([Fonte](https://pacoup.com/2011/06/12/list-of-true-169-resolutions/))

## Cosa è presente

- un menu in cui vengono usati tutti i manager sopra descritti. Viene generato dall'oggetto **obj_menu**

## Come usare la localizzazione

L'implementazione della localizzazione segue pedissequamente il tutorial "[Traduzione e internazionalizzazione con GameMaker](https://gamemakeritalia.it/posts/traduzione-e-internazionalizzazione-con-game-maker/)" redatto da [AlexoFalco](https://alexofalco.com)

## Come mappare e usare gli input

Per questo aspetto è stato utilizzato [InputManager.gml](https://gist.github.com/adriano-t/bd8785dd8a46b641a98634e254f9c241) sviluppato da Tiz.

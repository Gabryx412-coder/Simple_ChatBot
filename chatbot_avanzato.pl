% File: chatbot_avanzato.pl

% Saluti
risposta_saluto('Ciao') :- random_response([ 'Ciao! Come posso aiutarti oggi?', 'Salve! Di cosa hai bisogno?', 'Ciao! Sono qui per te!' ]).
risposta_saluto('Salve') :- random_response([ 'Ciao! Come posso esserti utile?', 'Salve, che posso fare per te?' ]).
risposta_saluto('Ehi') :- random_response([ 'Ehi! Come va?', 'Ciao, cosa posso fare per te?' ]).
risposta_saluto('Buongiorno') :- random_response([ 'Buongiorno! Come posso aiutarti oggi?', 'Buongiorno, di cosa hai bisogno?' ]).
risposta_saluto('Buonasera') :- random_response([ 'Buonasera! Come va?', 'Buonasera, cosa posso fare per te?' ]).

% Domande sul meteo
risposta_meteo('Che tempo fa oggi?') :- random_response([ 'Oggi è una giornata soleggiata!', 'Il meteo di oggi è nuvoloso con possibili piogge.', 'Oggi c\'è il sole, perfetto per una passeggiata!' ]).
risposta_meteo('Com\'è il meteo?') :- random_response([ 'Oggi è piuttosto nuvoloso e fresco.', 'Il tempo è sereno oggi!', 'Dicono che domani pioverà, approfitta della giornata di sole!' ]).
risposta_meteo('Farà bel tempo domani?') :- random_response([ 'Le previsioni dicono che domani sarà soleggiato!', 'Domani ci potrebbero essere delle nuvole, ma niente pioggia.' ]).

% Domande sull'ora
risposta_ora('Che ore sono?') :- 
    get_time(T), 
    format_time(atom(Time), '%H:%M:%S', T), 
    format('L\'ora attuale è: ~w', [Time]).

% Domande sulla posizione
risposta_posizione('Dove ti trovi?') :- random_response([ 'Sono nel mondo virtuale, sempre pronto ad aiutarti!', 'Mi trovo dove tu mi vuoi! In questo momento sono nella tua macchina!' ]).

% Domande generali
risposta_generale('Chi sei?') :- random_response([ 'Sono un chatbot creato per rispondere alle tue domande!', 'Sono il tuo assistente virtuale, pronto a rispondere alle tue curiosità!' ]).
risposta_generale('Cosa sei?') :- random_response([ 'Sono un programma che usa Prolog per rispondere alle tue domande!', 'Sono un’intelligenza artificiale che può aiutarti in molte cose!' ]).

% Domande su sport
risposta_sport('Che sport ti piacciono?') :- random_response([ 'Mi piace il calcio, ma posso parlare di qualsiasi sport!', 'Mi piace il basket, ma anche altri sport sono interessanti.' ]).
risposta_sport('Come sta la tua squadra?') :- random_response([ 'Non ho una squadra, ma posso darti informazioni sulle squadre di calcio!' ]).
risposta_sport('Cosa sai del calcio?') :- random_response([ 'Il calcio è uno degli sport più popolari al mondo!', 'Il calcio è il mio sport preferito. Posso dirti molto su di esso!' ]).

% Domande sulla tecnologia
risposta_tecnologia('Cos\'è un chatbot?') :- random_response([ 'Un chatbot è un programma che simula una conversazione con un essere umano!', 'Un chatbot è un assistente virtuale che usa intelligenza artificiale per rispondere alle domande.' ]).
risposta_tecnologia('Cosa puoi fare?') :- random_response([ 'Posso rispondere a domande su vari argomenti come meteo, sport, tecnologia, e altro!', 'Posso darti informazioni su molti argomenti e rispondere a domande generali!' ]).
risposta_tecnologia('Come funziona un algoritmo?') :- random_response([ 'Un algoritmo è una sequenza di istruzioni che risolve un problema o compie un compito!', 'Un algoritmo funziona seguendo un insieme di passaggi logici per raggiungere un risultato.' ]).

% Domande sulla salute
risposta_salute('Come posso rimanere in forma?') :- random_response([ 'Per restare in forma, è importante fare esercizio regolare e mangiare sano.', 'L\'esercizio fisico e una dieta equilibrata sono la chiave per una vita sana!' ]).
risposta_salute('Qual è il miglior esercizio per perdere peso?') :- random_response([ 'L\'esercizio cardiovascolare, come la corsa o il nuoto, è molto utile per bruciare calorie.', 'Il miglior esercizio per perdere peso dipende dal tuo corpo e dal tuo stile di vita!' ]).

% Domande su film
risposta_film('Qual è il miglior film che hai visto?') :- random_response([ 'Non vedo film, ma posso dirti quali sono i più popolari!', 'Un film molto apprezzato è "Il Padrino", ma ce ne sono tanti da vedere!' ]).
risposta_film('Mi consigli un film da vedere?') :- random_response([ 'Se ti piacciono i film d\'azione, ti consiglio "Inception".', 'Se ami i film di fantascienza, "Interstellar" è un capolavoro!' ]).

% Domande sui libri
risposta_libri('Qual è il miglior libro che hai letto?') :- random_response([ 'Non leggo libri, ma posso darti consigli sui più venduti!', 'Un libro molto popolare è "Il piccolo principe", ma ce ne sono molti altri!' ]).
risposta_libri('Mi consigli un libro da leggere?') :- random_response([ 'Se ti piacciono i romanzi, "1984" di George Orwell è un grande classico.', 'Un ottimo libro è "La strada" di Cormac McCarthy, un racconto potente e toccante.' ]).

% Risposte di errore
risposta_non_riconosciuta :- random_response([ 'Mi dispiace, non ho capito la tua domanda.', 'Non sono sicuro di cosa intendi. Puoi riformulare?', 'Scusa, non riesco a rispondere a questa domanda.' ]).

% Funzione di risposta casuale
random_response(List) :-
    length(List, Len),
    random_between(1, Len, Index),
    nth1(Index, List, Response),
    write(Response), nl.

% Funzione principale per gestire la conversazione
chatbot :-
    write('Ciao! Sono qui per aiutarti. Digita "exit" per uscire.'), nl,
    repeat,
    write('Tu: '), read_line_to_string(user_input, Input),
    ( Input == 'exit' -> 
        write('Arrivederci! Spero di esserti stato utile!'), nl, !;
        process_input(Input), fail
    ).

% Funzione per processare l'input dell'utente
process_input(Input) :-
    normalize_input(Input, Normalized),
    ( risposta_saluto(Normalized) -> risposta_saluto(Normalized) ;
      risposta_meteo(Normalized) -> risposta_meteo(Normalized) ;
      risposta_ora(Normalized) -> risposta_ora(Normalized) ;
      risposta_posizione(Normalized) -> risposta_posizione(Normalized) ;
      risposta_generale(Normalized) -> risposta_generale(Normalized) ;
      risposta_sport(Normalized) -> risposta_sport(Normalized) ;
      risposta_tecnologia(Normalized) -> risposta_tecnologia(Normalized) ;
      risposta_salute(Normalized) -> risposta_salute(Normalized) ;
      risposta_film(Normalized) -> risposta_film(Normalized) ;
      risposta_libri(Normalized) -> risposta_libri(Normalized) ;
      risposta_non_riconosciuta
    ).

% Normalizzare l'input dell'utente (trasformare in minuscolo, rimuovere spazi extra, ecc.)
normalize_input(Input, Normalized) :-
    downcase_atom(Input, Lower),
    atomic_list_concat(Atoms, ' ', Lower),
    atomic_list_concat(Atoms, ' ', Normalized).

% Avvio del chatbot
:- chatbot.

% Saluti ulteriori
risposta_saluto('Buongiorno') :- random_response([ 'Buongiorno! Come posso aiutarti oggi?', 'Buongiorno, di cosa hai bisogno?' ]).
risposta_saluto('Buonasera') :- random_response([ 'Buonasera! Come va?', 'Buonasera, cosa posso fare per te?' ]).

% Domande sull'alimentazione
risposta_alimentazione('Cosa devo mangiare per stare in forma?') :- random_response([ 'Una dieta bilanciata con frutta, verdura, proteine e carboidrati è importante!', 'Mangiare cibi sani come frutta, verdura e proteine magre aiuta a mantenersi in forma!' ]).
risposta_alimentazione('Quanto è importante bere acqua?') :- random_response([ 'Bere molta acqua è fondamentale per il nostro corpo!', 'L\'acqua aiuta a mantenere il corpo idratato e a migliorare la digestione.' ]).

% Domande sul tempo libero
risposta_tempo_libero('Cosa fai nel tempo libero?') :- random_response([ 'Non ho tempo libero, sono sempre qui per aiutarti!', 'Nel mio tempo libero esploro nuovi argomenti da condividere con te!' ]).
risposta_tempo_libero('Hai hobby?') :- random_response([ 'Non ho hobby, ma mi piace aiutarti con le tue domande!', 'Mi piace esplorare nuove informazioni per essere utile!' ]).

% Domande sulla musica
risposta_musica('Che genere di musica ti piace?') :- random_response([ 'Mi piacciono tutti i generi musicali, anche se non posso ascoltarla!', 'Sono curioso di conoscere i tuoi gusti musicali!' ]).
risposta_musica('Conosci qualche gruppo famoso?') :- random_response([ 'I Beatles e i Queen sono molto famosi!', 'Mi vengono in mente i Pink Floyd e gli Oasis!' ]).

% Domande sulla storia
risposta_storia('Chi ha inventato la lampadina?') :- random_response([ 'Thomas Edison è stato l\'inventore della lampadina!', 'La lampadina fu perfezionata da Thomas Edison, ma ci furono anche altri contributi.' ]).
risposta_storia('Quando è stata la rivoluzione francese?') :- random_response([ 'La rivoluzione francese è iniziata nel 1789.', 'La rivoluzione francese è un evento storico che ha avuto inizio nel 1789.' ]).

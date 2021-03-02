risoluzione progetto :
https://github.com/nunzilor/societ-turistica/blob/main/Simulazione_Informatica_Testo_2017.pdf

# societ-turistica
*analisi tecnica*
Analizzando il testo e le linee guida descritte nella prova, in questo caso un società  operante nel settore del turismo, ho deciso di sviluppare un interfaccia web. 
l’utente si può interfacciare tramite un semplice browser da qualsiasi dispositivo (smartphone, tablet, pc ) digitando nella barra della ricerca l’ip statico del webserver che nel nostro caso sarà una vps linux distribuzione debian con la suite apache che ci permetterà di avere a disposizione tutti i tools necessari per hostare il sito web .
una volta che il sito avrà superato la beta test verrà dotato di un url grazie al sistema dns che sostituirà l’indirizzo ip del webserver dotandolo di un vero e proprio nome. Es 8.8.8.8  www.google.it
dove troveremo sia lato server (php,mysql,ecc..),  che lato client (js,html). Per la parte frontend (quella dove si interfaccerà l’utente) ho deciso di creare una pagina web html con il login e la registrazione per gli utenti, dove oltre ad inserire i loro dati ed immagazzinarli in un database potranno trovare a disposizione quelli riguardanti delle guide turistiche e degli itinerari. La parte backend e il flusso dei dati come scritto sopra sarà gestita da php e mysql che restituirà all’utente con delle chiamate web sulla porta 8080 del webserver e con l’ausilio delle query.
Ho deciso di processare i dati del testo con uno schema e-r che scriverò qui di seguito :

https://github.com/nunzilor/societ-turistica/blob/main/schemaer.drawio

qui lo schema implementato in mariadb :

https://github.com/nunzilor/societ-turistica/blob/main/Screenshot%202021-03-02%20175845.png

e qui la login page :

https://github.com/nunzilor/societ-turistica/blob/main/Screenshot%202021-03-02%20175648.png

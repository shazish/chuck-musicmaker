// score.ck
// TITLE: Happy all around

Machine.add(me.dir() + "/drums.ck") => int drumID;
Machine.add(me.dir() + "/bass.ck") => int bassID;
Machine.add(me.dir() + "/flute.ck") => int fluteID;

10::second => now;

Machine.remove(fluteID);
Machine.add(me.dir() + "/piano.ck") => int pianoID;

20::second => now; 

Machine.remove(pianoID);
Machine.remove(bassID);
Machine.remove(drumID);



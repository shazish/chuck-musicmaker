// score.ck
// Assignment_7_Farewell

BPM tempo;
drum mydrum; // second class 
tempo.tempo(96.0);


Machine.add(me.dir()+"/piano.ck") => int pianoID;
Machine.add(me.dir()+"/flute.ck") => int fluteID;
spork ~ mydrum.playback(0,5);
5::second=> now;

// bass kicks in
Machine.add(me.dir()+"/bass.ck") => int bassID;
spork ~ mydrum.playback(1,10);
10::second=> now;

// tempo slightly decreased to give a more lullaby-ish feeling
spork ~ mydrum.playback(2,10);
tempo.tempo(72.0); 
10::second=> now;

spork ~ mydrum.playback(3,5);
Machine.add(me.dir()+"/flute.ck") => int flute2ID;
Machine.remove(pianoID);
5::second=> now;

Machine.remove(bassID);
Machine.remove(fluteID);
Machine.remove(flute2ID);






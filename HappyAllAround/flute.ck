// flute.ck
// TITLE: Happy all around
// I tried to come up with a more engaging melody for the flute but 
// it just didn't sit well with the rest of the song.

// Part of your composition goes here
Gain master;

Flute flute => Pan2 pflute => NRev rflute => master;
master => dac;
4 => int pos;
0.3 => rflute.mix; // reverb
-0.3 => pflute.pan;
0.4 => master.gain;


0.625 * 2:: second => now; // to make a half note delay after piano

fun void flutePlayback(int mult) {
        

        Std.mtof( 58 ) => flute.freq;
        0.4 => flute.noteOn;
        0.125 * mult:: second => now;
        0.1 => flute.noteOff;  
        0.500 * mult :: second => now;

}

while(true){
    flutePlayback(4);

}
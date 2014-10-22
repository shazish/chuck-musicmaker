// flute.ck
// Assignment_7_Farewell


Gain master;

Flute flute => Pan2 pflute => NRev rflute => master;
master => dac;
4 => int pos;
0.5 => rflute.mix; // reverb
-0.3 => pflute.pan;
0.2 => master.gain;

BPM tempo;

fun void flutePlayback(int mult) {
       
        Std.mtof( 84 ) => flute.freq;
        0.3 => flute.noteOn;
        tempo.quarterNote * 3  => now;
        0.3 => flute.noteOff;  
        tempo.quarterNote * 3 => now;
}

flutePlayback(2);

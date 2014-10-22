// bass.ck
// Assignment_7_Farewell


Gain master;
Mandolin bass => Pan2 pan2 => NRev r => master;
master => dac;
int counter;

0.1 => r.mix;
0.1 => bass.stringDamping;
0.01 => bass.stringDetune;
0.03 => bass.bodySize;
4 => int pos;
.5 => master.gain;
0.4 => pan2.pan;
BPM tempo;

fun void bassPlayback(int note) {

    Std.mtof( note ) => bass.freq;
    Math.random2f(0.5, .1) => bass.pluckPos;

    0.5 => bass.noteOn; 
    tempo.quarterNote * 2 => now;
    .01 => bass.noteOff;
    tempo.quarterNote * 2 => now;
    counter++;

}

while(true){  
        bassPlayback(60);
}
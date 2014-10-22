// bass.ck
// TITLE: Happy all around

// Part of your composition goes here
Gain master;
Mandolin bass => Pan2 pan2 => NRev r => master;
master => dac;
int counter;
[46, 58, 49, 51, 48, 49, 46, 58] @=> int scale[];
[46, 46, 46, 46, 46, 46, 49, 46] @=> int scale2[];

0.02 => r.mix;
0 => bass.stringDamping;
0.1 => bass.stringDetune;
0.09 => bass.bodySize;
4 => int pos;
.3 => master.gain;
0.4 => pan2.pan;

fun void bassPlayback(int scale[]) {
    Math.random2(0, scale.cap() - 1) => pos;
    Std.mtof(scale[ counter % 8 ] - 12) => bass.freq;
    Math.random2f(0.5, .1) => bass.pluckPos;
    0.5 => bass.noteOn; 
    (0.550/4):: second => now;
    .01 => bass.noteOff;
    (0.075/4):: second => now;
    counter++;

}

while(true){
    
    if (counter < 32 * 2) // changes the scale to open up space for piano kicking in
        bassPlayback(scale);
    else        
        bassPlayback(scale2);

}
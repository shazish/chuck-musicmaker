// piano.ck
// TITLE: Happy all around


Rhodey piano => NRev rev => dac;
piano => Delay d => d => rev;
0.1 => rev.mix;
0.3::second => d.max => d.delay;
0.4 => d.gain;
int pos;


[ 48, 51, 54, 56, 46, 49, 53, 54] @=> int chords[];


while(true){
    
    if ( Math.random2f(0,1) > 0.4 ) { // plays the flute 60% of the time
        Math.random2(0, chords.cap() - 1 ) => pos;
        Math.mtof( chords[ pos ] + 24) => piano.freq; 
        0.1 => piano.noteOn;
    }
    (0.625 / 4)::second => now;
    

}
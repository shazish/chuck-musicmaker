// piano.ck
// Assignment_7_Farewell

Rhodey piano => NRev rev => dac;
piano => Delay d => d => rev;
0.12 => rev.mix;
0.25::second => d.max => d.delay;
0.5 => d.gain;
int pos;


[ 48, 50, 52, 53, 55, 57, 59, 60 ] @=> int chords[];


BPM tempo;

    now => time starttime;
    while ( now - starttime < 25::second ) { 
    
        if ( Math.random2f(0,1) > 0.3 ) { // plays the instrument 60% of the time
            Math.random2(0, chords.cap() - 1 ) => pos;           
            Math.mtof( chords[ pos ] + 12 ) => piano.freq; 
            0.1 => piano.noteOn;
        }
    tempo.quarterNote => now;   
    }


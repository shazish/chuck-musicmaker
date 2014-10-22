// Assignment4_shaahin
// shaahin@gmail.com


string beats[11];
int counter;
int selectedDrum;
Gain master;

SndBuf beat => Pan2 pbeat => master;
SndBuf fx => Pan2 pfx => master;
SqrOsc key => Pan2 pkey => NRev r => master;
master => dac;

// load array of sound addresses
me.dir() + "/audio/snare_01.wav" => beats[0];
me.dir() + "/audio/snare_02.wav" => beats[1];
me.dir() + "/audio/snare_03.wav" => beats[2];
me.dir() + "/audio/snare_04.wav" => beats[3];
me.dir() + "/audio/snare_05.wav" => beats[4];
me.dir() + "/audio/kick_03.wav" => beats[5];
me.dir() + "/audio/kick_01.wav" => beats[6];
me.dir() + "/audio/kick_02.wav" => beats[7];
me.dir() + "/audio/hihat_01.wav" => beats[8];
me.dir() + "/audio/hihat_03.wav" => beats[9];
me.dir() + "/audio/stereo_fx_01.wav" => beats[10];

[ 51, 53, 55, 56, 58, 60, 61, 63 ] @=> int melody[];
[ 1, 2, 1, 3, 1, 2, 3, 3 ] @=> int pattern[];

0.1 => key.gain;
0.7 => beat.gain;
0.2 => r.mix; // reverb
0.7 => pfx.pan;
-0.7 => pkey.pan;

fun void beatPlayback(int reverse_chance) {   
    // error handling
    if ( reverse_chance < 2 )
        2 => reverse_chance;
    // the higher the value of reverse_chance, the lower the 
    // occurance of a reverse playback
    if ( Math.random2(0, reverse_chance) == 0 ) {
        beat.samples() => beat.pos;
        -1.0 => beat.rate;
    }
    else {
        0 => beat.pos;
        1.0 => beat.rate;
    }
}

fun void instrumentSelector (int instrument_type) {
    if ( instrument_type == 1 ) // kick
        Math.random2(5, 7) => selectedDrum;
    else if ( instrument_type == 2 ) // hihat
        Math.random2(8, 9) => selectedDrum;    
    else if ( instrument_type == 3 ) // snare
        Math.random2(0, 4) => selectedDrum;
    else // error handling
        Math.random2(0, 9) => selectedDrum;
    
    beats[ selectedDrum ] => beat.read;
}

fun void fxPlayback( int key_change_every_x_step ) {
    if (counter % key_change_every_x_step == 0)
    0.5 * Math.random2(1, 2) => fx.rate;
    beats[ 10 ] => fx.read;
}

fun void keyPlayback() {
        Std.mtof( melody [ Math.random2(0, 7) ] ) => key.freq;  
}

// main program
while (counter < 50) {
            
    instrumentSelector( pattern[ counter % 8 ] ); // drum randomizer
    beatPlayback(9); // drums playback
    fxPlayback(8); // background filler
    keyPlayback(); // keyboard
    
    600::ms => now;
    counter++;
}
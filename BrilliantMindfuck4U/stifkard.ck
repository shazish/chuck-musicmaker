// stifkard.ck
// Exotic polyrhythmics
// Final project


public class stifkard {
    
    int counter;
    Gain master;
    int melody_to_play[4];

    StifKarp m => Pan2 pkey => NRev r => master;
    master => dac;
    BPM tempo;

    [ 50, 52, 53, 55, 57, 59, 60, 62 ] @=> int melody_pool[];


    0.4 => m.gain;

    0.05 => r.mix; // reverb

    -0.5 => pkey.pan;

    fun void playback(float duration, float timestretch, float gainer) {
        gainer => m.gain;
        now => time starttime;
        while ( now - starttime < duration::second ) {    
            
            for ( 0 => int i; i < melody_to_play.cap(); i++) {
                melody_pool [ Math.random2(0, 7) ] => melody_to_play[i];

            }

            for ( 0 => int i; i < 2 * melody_to_play.cap(); i++) {
                Math.random2f( 0.5, 1 ) => m.pickupPosition;
                Math.random2f( 0.5, 1 ) => m.sustain;
                Math.random2f( 0.5, 1 ) => m.stretch;
                
                Std.mtof( melody_to_play [ i % melody_to_play.cap() ] + 24 ) => m.freq;
                Math.random2f( .7, .9 ) => m.pluck;
                tempo.eighthNote * timestretch => now;       
                //220::ms =>now;

            }        
        }
    }  
}  
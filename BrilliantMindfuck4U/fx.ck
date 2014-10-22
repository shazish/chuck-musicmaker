// fx.ck
// Exotic polyrhythmics
// Final project


public class fx {
    Gain master;
    SndBuf fx => Pan2 pfx => master;
    master => dac;
    int counter;
    BPM tempo;
    0.6 => pfx.pan;
    0.4 => master.gain;
    string fxsound;
    me.dir(-1) + "/audio/stereo_fx_01.wav" => fxsound;

    fun void fxPlayback( float duration, float rate_set, float on, float off ) {

        now => time starttime;
        while ( now - starttime < duration::second ) {           
            rate_set => fx.rate;
            fxsound => fx.read; 
            0.45 => master.gain;  
            tempo.quarterNote * on => now;  
            0 => master.gain;
            tempo.quarterNote * off => now; 
            
        }
    }


}    
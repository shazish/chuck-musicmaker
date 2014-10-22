// flute.ck
// Exotic polyrhythmics
// Final project


public class flute {
    Gain master;

    Flute flute => Pan2 pflute => NRev rflute => master;
    master => dac;
    4 => int pos;
    0.5 => rflute.mix; // reverb
    -0.5 => pflute.pan;
    0.2 => master.gain;

    BPM tempo;

    fun void playback(int note, int length) {
           
            Std.mtof( note ) => flute.freq;
            0.3 => flute.noteOn;
            tempo.quarterNote * length  => now;
            0.3 => flute.noteOff;  
            tempo.quarterNote * 3 => now;
    }    
}
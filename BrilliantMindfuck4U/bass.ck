// bass.ck
// Exotic polyrhythmics
// Final project


public class bass {
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
    -0.4 => pan2.pan;
    BPM tempo;

    fun void playback(int duration, int note, float ontime, float offtime) {
        now => time starttime;
        while ( now - starttime < duration::second ) {
            Std.mtof( note ) => bass.freq;
            Math.random2f(0.5, .1) => bass.pluckPos;

            0.5 => bass.noteOn; 
            tempo.quarterNote * ontime => now;
            .01 => bass.noteOff;
            tempo.quarterNote * offtime  => now;
            counter++;
        }

    }
}
// drum.ck
// Exotic polyrhythmics
// Final project

public class drum {
    Gain master;
    SndBuf playdrum => master => dac;
    0.25 => master.gain;
    string drum_sound[4];
    0 => int counter;

    [
        [ 1, 0, 0, 0, 0, 2, 0, 0],     
        [ 1, 0, 0, 0, 0, 3, 0, 0], 
        [ 1, 0, 0, 2, 0, 1, 3, 0],
        [ 1, 0, 0, 0, 0, 2, 0, 0, 1, 0, 2, 0],
        [ 1, 0, 0, 2, 0, 0, 0, 1, 0, 0, 2],
        [ 1, 0, 0, 0, 0] ,
        [ 1, 0, 0, 2, 1, 0, 2, 1, 2, 1, 0, 2],
        [ 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 0] // ending passage
        
    ] @=>  int drum_pattern[][];

    me.dir(-1) + "/audio/kick_02.wav" => drum_sound[0];
    me.dir(-1) + "/audio/snare_01.wav" => drum_sound[1];
    me.dir(-1) + "/audio/hihat_01.wav" => drum_sound[2];
    me.dir(-1) + "/audio/hihat_02.wav" => drum_sound[3];
    BPM tempo; 
    
     
    // make a conductor for our tempo 
    // this is set and updated elsewhere

       
    fun void playback(int selector, int duration, float gainer) {
        0 => int counter;
        gainer => master.gain;
        now => time starttime;
        while ( now - starttime < duration::second ) { 

            drum_pattern[selector][ counter % drum_pattern[selector].cap() ] => int chosen_drum;
            if ( chosen_drum != 0 )
                drum_sound[ chosen_drum - 1 ] => playdrum.read;
            counter++;  
            tempo.eighthNote => now;
            //500::ms => now;
         }    
    } 
  
}

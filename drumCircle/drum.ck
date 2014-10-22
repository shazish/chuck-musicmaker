// kick.ck
// on the fly drumming with global BPM conducting

public class drum {
    Gain master;
    SndBuf playdrum => master => dac;
    0.3 => master.gain;
    string drum_sound[3];
    0 => int counter;

    [
        [ 1, 0, 0, 0, 0, 0, 0, 0],     
        [ 1, 0, 0, 0, 0, 2, 0, 0], 
        [ 1, 0, 0, 0, 2, 0, 0, 3],
        [ 0, 0, 0, 0, 0, 0, 0, 3]
    ] @=>  int drum_pattern[][];

    me.dir(-1) + "/audio/kick_02.wav" => drum_sound[0];
    me.dir(-1) + "/audio/snare_01.wav" => drum_sound[1];
    me.dir(-1) + "/audio/hihat_02.wav" => drum_sound[2];
    BPM tempo; 
    
     
    // make a conductor for our tempo 
    // this is set and updated elsewhere

       
    fun void playback(int selector, int duration) {
        now => time starttime;
        while ( now - starttime < duration::second ) { 

            drum_pattern[selector][ counter % drum_pattern[selector].cap() ] => int chosen_drum;
            if ( chosen_drum != 0 )
                drum_sound[ chosen_drum - 1 ] => playdrum.read;
            counter++;  
            tempo.eighthNote => now;
         }    
    } 
  
}

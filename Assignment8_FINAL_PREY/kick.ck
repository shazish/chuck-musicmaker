// final_assignment_8_PREY
// kick.ck
// pretty vanilla sounding kick drum
SndBuf kick => dac;
me.dir(-1)+"/audio/kick_01.wav" => kick.read;
.3 => kick.gain;
kick.samples() => kick.pos;

BPM tempo;

while (1)  {
    // update our basic beat each measure
    tempo.quarterNote => dur quarter;
    tempo.eighthNote => dur eighth;
    
    // play kick every beat
    for (0 => int beat; beat < 8; beat++)  {
        0 => kick.pos;
        quarter => now;
    }
    // at the end of every 2 measures play a triplet
    for (0 => int beat; beat < 8; beat++)  {
        if ( beat == 7)
        {
            0 => kick.pos;
            eighth => now;
            0 => kick.pos;
            eighth => now;
       }
    }

}    


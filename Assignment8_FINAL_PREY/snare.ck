// final_assignment_8_PREY
 // snare.ck
//  normal snare, other than setting gain I didn't change this much
SndBuf snare => dac;
me.dir(-1)+"/audio/snare_01.wav" => snare.read;
.4 => snare.gain;
snare.samples() => snare.pos;

// make a conductor for our tempo 
// this is set and updated elsewhere
BPM tempo;

while (1)  {
    // update our basic beat each measure
    tempo.quarterNote => dur quarter;
    
    // play a measure of quarter note kicks
    for (0 => int beat; beat < 4; beat++)  {
        0 => snare.pos;
        quarter => now;
    }
    for (0=> int beat; beat < 4; beat++ ) {
        if ( beat==1 || beat==3) {
            0=> snare.pos;
            quarter => now;
        }
    }
}    


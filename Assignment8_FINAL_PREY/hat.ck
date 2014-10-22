// final_assignment_8_PREY
// hat.ck
// the pattern is based on a hat.ck file from class, but I used a different sample
// because I generally find hihat incredibly annoyng
SndBuf hat => dac;
me.dir(-1)+"/audio/click_02.wav" => hat.read;

// make a conductor for our tempo 
// this is set and updated elsewhere
BPM tempo;
// set the volume relatively low so hihat won't be so annoying
.3 => hat.gain;

// play a measure of 8th notes (leaving off the last one in each measure)

while (1)  {
    // update our basic beat each measure
    tempo.eighthNote => dur eighth;
    
    // play a measure of eighth notes
    for (0 => int beat; beat < 8; beat++)  {
        // play mostly, but leave out last eighth
        if (beat != 7) {
            0 => hat.pos;
        }
        eighth => now;
    }
}    
    

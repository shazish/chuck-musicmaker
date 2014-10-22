// drums.ck
// TITLE: Happy all around

Gain master;
string beats[10];
int selectedDrum;
0 => int counter;

SndBuf beat => Pan2 pbeat => NRev rbeat => master;
master => dac;

0.25 => master.gain;
0.03 => rbeat.mix; // reverb

me.dir(-1) + "/audio/snare_01.wav" => beats[0];
me.dir(-1) + "/audio/snare_02.wav" => beats[1];
me.dir(-1) + "/audio/snare_03.wav" => beats[2];
me.dir(-1) + "/audio/kick_03.wav" => beats[3];
me.dir(-1) + "/audio/kick_02.wav" => beats[4];
me.dir(-1) + "/audio/kick_01.wav" => beats[5];
me.dir(-1) + "/audio/hihat_01.wav" => beats[6];
me.dir(-1) + "/audio/hihat_02.wav" => beats[7];
me.dir(-1) + "/audio/hihat_03.wav" => beats[8];
me.dir(-1) + "/audio/hihat_04.wav" => beats[9];

// drum patterns are changed during composition
[[ 1, 0, 0, 0, 0, 1, 0, 0], 
 [ 1, 0, 0, 1, 0, 0, 3, 0],
 [ 1, 0, 0, 0, 0, 2, 0, 0]
 ] @=> int drum_pattern[][];

fun void instrumentSelector (int instrument_type) {
    if ( instrument_type == 1 ) // kick
        Math.random2(3, 5) => selectedDrum;
    else if ( instrument_type == 3 ) // hihat
        Math.random2(6, 9) => selectedDrum;    
    else if ( instrument_type == 2 ) // snare
        Math.random2(0, 1) => selectedDrum;
    else if ( instrument_type == 0 ) // mute!
        return;
    
    beats[ selectedDrum ] => beat.read;
}
now => time past;

while(true){
    if ( counter < 32  )
        instrumentSelector( drum_pattern[0][ counter % 8 ] ); // drum randomizer    
    else if ( counter < 32 * 3 )
        instrumentSelector( drum_pattern[1][ counter % 8 ] ); // drum randomizer    
     else 
        instrumentSelector( drum_pattern[2][ counter % 8 ] ); // drum randomizer    
       
    counter++;
    (625/4)::ms => now;    

}
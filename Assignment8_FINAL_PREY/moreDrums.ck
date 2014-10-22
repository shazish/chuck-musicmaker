// assignment_8_PREY
// More drums
Shakers shaker => Gain master;

SndBuf snare => Pan2 p => dac;
SndBuf snarey =>  dac;
SndBuf kick => dac;
SndBuf click => dac;
SndBuf click2 => dac;
me.dir(-1) + "/audio/snare_01.wav" => snare.read;
me.dir(-1) + "/audio/hihat_04.wav" => snarey.read;
me.dir(-1) + "/audio/kick_01.wav" => kick.read;
me.dir(-1) + "/audio/stereo_fx_03.wav" => click.read;
me.dir(-1) + "/audio/stereo_fx_01.wav" => click2.read;

0.2=>snare.gain;
0.2=>snarey.gain;
0.3=>kick.gain;
0.3=>click.gain; 
0.3=>click2.gain;
snare.samples()=> snare.pos;
snarey.samples()=> snarey.pos;
kick.samples()=> kick.pos;
click.samples()=> click.pos;
0=>click.gain;

BPM tempo;
tempo.eighthNote => dur beattime;

while ( true ) {
    // for variety play a few different pattern/instrument combos

   if (Math.random2(0,3)>2)
       {
        0 => snare.pos;
        0 => snarey.pos;
        0 => kick.pos;
        }
        else {
            if ( Math.random2(0,3) > 2 ) {
                1 => kick.rate;
                snare.samples()/35 => int grain;
                Math.random2(0,snare.samples()-grain) => snare.pos;
                -1 => snare.rate;
                .4 => kick.gain;
                .2 => snare.gain;
                0 => snare.pos;
                0 => kick.pos;
            }
       }
       if (Math.random2(0,5) > 4) {
           0=> click.pos;
       }
       beattime => now;
}


